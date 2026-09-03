codeunit 50181 "NRS Validate Invoice Mgt."
{
    // Builds the UBL "Validate Invoice" payload from a posted sales invoice and sends it to
    // {base_url}/validate. Supplier party + document defaults come from NRS Setup; customer and
    // item specifics come from NRS fields on the Customer and Item cards.
    //
    // Mapping (standard BC -> NRS):
    //   irn                    <- Sales Invoice Header."NRS IRN" (must be generated first)
    //   issue_date             <- Posting Date
    //   document/tax currency  <- Currency Code (blank -> setup default)
    //   tax_exclusive_amount   <- Header.Amount
    //   tax_inclusive_amount   <- Header."Amount Including VAT"
    //   tax_amount             <- Amount Including VAT - Amount
    //   invoice_line[*]        <- Sales Invoice Line (item name, price, qty, discounts, amount)
    //   hsn/product/isic/svc   <- NRS Item Category Mapping (keyed by the item's Item Category Code)
    // Amounts and codes with no standard BC source are configured in NRS Setup / Customer / Item.

    Permissions = tabledata "NRS IRN Log" = RIMD,
                  tabledata "Sales Invoice Header" = R,
                  tabledata "Sales Invoice Line" = R,
                  tabledata Customer = R,
                  tabledata Item = R,
                  tabledata "NRS Item Category Map" = R,
                  tabledata "Unit of Measure" = R;

    var
        // The 'sign' endpoint validates the content, signs and reports the invoice to NRS.
        // (The 'validate' endpoint only checks compliance and uses a different schema - lga/state
        // and tax_scheme - which 'sign' does not.)
        ValidatePathTok: Label 'sign', Locked = true;
        ZeroVatTok: Label 'ZERO_VAT', Locked = true;
        ConnErrTxt: Label 'Could not reach the NRS e-invoicing service. Check network access / firewall.';
        NothingSelectedTxt: Label 'No invoices were selected.';
        NoIRNTxt: Label 'Invoice %1 has no IRN yet. Generate the IRN before validating.', Comment = '%1 = invoice no.';
        ConfirmBatchTxt: Label 'Validate %1 selected invoice(s) with NRS?', Comment = '%1 = count';
        SummaryTxt: Label 'Validation complete.\n\nProcessed: %1\nValidated: %2\nFailed: %3', Comment = '%1..%3 counts';
        ConfirmGVTxt: Label 'Generate IRN and validate %1 selected invoice(s)?', Comment = '%1 = count';
        GVSummaryTxt: Label 'Generate + Validate complete.\n\nProcessed: %1\nIRN generated: %2\nValidated: %3\nFailed: %4', Comment = '%1..%4 counts';

    /// <summary>Batch validation from the Posted Sales Invoices list.</summary>
    procedure ValidateForSelected(var SalesInvHeader: Record "Sales Invoice Header")
    var
        NRSSetup: Record "NRS Setup";
        ResultStatus: Enum "NRS Validation Status";
        TotalCount: Integer;
        ValidatedCount: Integer;
        FailCount: Integer;
    begin
        NRSSetup.CheckReadyForValidate();

        if SalesInvHeader.IsEmpty() then begin
            Message(NothingSelectedTxt);
            exit;
        end;

        if not Confirm(ConfirmBatchTxt, false, SalesInvHeader.Count()) then
            exit;

        SalesInvHeader.FindSet();
        repeat
            TotalCount += 1;
            ResultStatus := ValidateForInvoice(SalesInvHeader);
            if ResultStatus = ResultStatus::Validated then
                ValidatedCount += 1
            else
                FailCount += 1;
        until SalesInvHeader.Next() = 0;

        Message(SummaryTxt, TotalCount, ValidatedCount, FailCount);
    end;

    /// <summary>Validates a single posted invoice. Returns the resulting validation status.</summary>
    procedure ValidateForInvoice(SalesInvHeader: Record "Sales Invoice Header"): Enum "NRS Validation Status"
    var
        NRSSetup: Record "NRS Setup";
        IRNLog: Record "NRS IRN Log";
        EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
        Body: JsonObject;
        RawBody: Text;
        ResponseText: Text;
        RespMsg: Text;
        HttpStatusCode: Integer;
        Sent: Boolean;
        NewStatus: Enum "NRS Validation Status";
    begin
        NRSSetup.CheckReadyForValidate();
        if SalesInvHeader."NRS IRN" = '' then
            Error(NoIRNTxt, SalesInvHeader."No.");

        BuildInvoiceJson(SalesInvHeader, NRSSetup, Body);
        Body.WriteTo(RawBody);

        Sent := EInvoiceMgt.SendSigned(ValidatePathTok, RawBody, HttpStatusCode, ResponseText);

        FindOrCreateLog(IRNLog, SalesInvHeader);

        if not Sent then begin
            NewStatus := NewStatus::Failed;
            RespMsg := ConnErrTxt;
        end else begin
            RespMsg := ExtractMessage(ResponseText);
            if (HttpStatusCode = 200) or (HttpStatusCode = 201) then
                NewStatus := NewStatus::Validated
            else
                NewStatus := NewStatus::Failed;
        end;

        IRNLog."Validation Status" := NewStatus;
        IRNLog."Validation Message" := CopyStr(RespMsg, 1, MaxStrLen(IRNLog."Validation Message"));
        IRNLog."Validated At" := CurrentDateTime();
        IRNLog."HTTP Status Code" := HttpStatusCode;
        if NewStatus = NewStatus::Failed then
            IRNLog."Error Message" := CopyStr(ResponseText, 1, MaxStrLen(IRNLog."Error Message"));
        IRNLog.Modify(true);

        exit(NewStatus);
    end;

    // ----------------------------------------------------------------------------------
    // Generate IRN + Validate in one pass
    // ----------------------------------------------------------------------------------

    /// <summary>For each selected invoice: generate the IRN, then validate - in one action.</summary>
    procedure GenerateAndValidateForSelected(var SalesInvHeader: Record "Sales Invoice Header")
    var
        NRSSetup: Record "NRS Setup";
        IRNStatus: Enum "NRS IRN Status";
        ValStatus: Enum "NRS Validation Status";
        EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
        RefreshedHeader: Record "Sales Invoice Header";
        TotalCount: Integer;
        GeneratedCount: Integer;
        ValidatedCount: Integer;
        FailCount: Integer;
    begin
        NRSSetup.CheckReadyForValidate();

        if SalesInvHeader.IsEmpty() then begin
            Message(NothingSelectedTxt);
            exit;
        end;

        if not Confirm(ConfirmGVTxt, false, SalesInvHeader.Count()) then
            exit;

        SalesInvHeader.FindSet();
        repeat
            TotalCount += 1;
            IRNStatus := EInvoiceMgt.GenerateForInvoice(SalesInvHeader, false);
            if IRNStatus in [IRNStatus::Generated, IRNStatus::Duplicate] then begin
                GeneratedCount += 1;
                if RefreshedHeader.Get(SalesInvHeader."No.") and (RefreshedHeader."NRS IRN" <> '') then begin
                    ValStatus := ValidateForInvoice(RefreshedHeader);
                    if ValStatus = ValStatus::Validated then
                        ValidatedCount += 1
                    else
                        FailCount += 1;
                end else
                    FailCount += 1;
            end else
                FailCount += 1;
        until SalesInvHeader.Next() = 0;

        Message(GVSummaryTxt, TotalCount, GeneratedCount, ValidatedCount, FailCount);
    end;

    /// <summary>Single invoice: generate the IRN then validate. Returns the validation status.</summary>
    procedure GenerateAndValidateForInvoice(SalesInvHeader: Record "Sales Invoice Header"): Enum "NRS Validation Status"
    var
        EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
        RefreshedHeader: Record "Sales Invoice Header";
        IRNStatus: Enum "NRS IRN Status";
        ValStatus: Enum "NRS Validation Status";
    begin
        IRNStatus := EInvoiceMgt.GenerateForInvoice(SalesInvHeader, false);
        if not (IRNStatus in [IRNStatus::Generated, IRNStatus::Duplicate]) then
            exit(ValStatus::Failed);
        if not RefreshedHeader.Get(SalesInvHeader."No.") then
            exit(ValStatus::Failed);
        if RefreshedHeader."NRS IRN" = '' then
            exit(ValStatus::Failed);
        exit(ValidateForInvoice(RefreshedHeader));
    end;

    // ----------------------------------------------------------------------------------
    // Payload builder
    // ----------------------------------------------------------------------------------

    local procedure BuildInvoiceJson(SalesInvHeader: Record "Sales Invoice Header"; NRSSetup: Record "NRS Setup"; var Body: JsonObject)
    var
        Customer: Record Customer;
        SupplierParty: JsonObject;
        CustomerParty: JsonObject;
        LegalTotal: JsonObject;
        TaxTotalArr: JsonArray;
        InvoiceLineArr: JsonArray;
        CurrencyCode: Code[10];
        InvoiceKind: Text;
        TaxExclusive: Decimal;
        TaxInclusive: Decimal;
    begin
        CurrencyCode := SalesInvHeader."Currency Code";
        if CurrencyCode = '' then
            CurrencyCode := NRSSetup."Def. Document Currency";

        // Totals for legal_monetary_total come straight from the posted header.
        TaxExclusive := SalesInvHeader.Amount;
        TaxInclusive := SalesInvHeader."Amount Including VAT";

        // invoice_kind is taken from the customer card (NRS Invoice Kind). Falls back to B2B
        // only if a customer has not been tagged.
        if Customer.Get(SalesInvHeader."Bill-to Customer No.") then;
        InvoiceKind := Customer."NRS Invoice Kind";
        if InvoiceKind = '' then
            InvoiceKind := 'B2B';

        // ---- Header scalars ----
        Body.Add('business_id', NRSSetup."Business ID");
        Body.Add('irn', SalesInvHeader."NRS IRN");
        Body.Add('issue_date', Format(SalesInvHeader."Posting Date", 0, '<Year4>-<Month,2>-<Day,2>'));
        if SalesInvHeader."Due Date" <> 0D then
            Body.Add('due_date', Format(SalesInvHeader."Due Date", 0, '<Year4>-<Month,2>-<Day,2>'));
        Body.Add('invoice_type_code', NRSSetup."Def. Invoice Type Code");
        Body.Add('invoice_kind', InvoiceKind);
        Body.Add('payment_status', NRSSetup."Def. Payment Status");
        Body.Add('document_currency_code', CurrencyCode);
        Body.Add('tax_currency_code', CurrencyCode);

        // ---- Supplier party (required) ----
        BuildParty(SupplierParty, NRSSetup."Supplier Name", NRSSetup."Supplier TIN", NRSSetup."Supplier Email",
            NRSSetup."Supplier Telephone", NRSSetup."Supplier Business Desc.", NRSSetup."Supplier Street",
            NRSSetup."Supplier City", NRSSetup."Supplier LGA Code", NRSSetup."Supplier State Code",
            NRSSetup."Supplier Postal Zone", NRSSetup."Supplier Country");
        Body.Add('accounting_supplier_party', SupplierParty);

        // ---- Customer party (required for B2B/B2G/G2B) ----
        // The posted invoice's bill-to address is frozen at posting time; where a field was blank
        // then, fall back to the customer master so filling the Customer card fixes past invoices too.
        BuildParty(CustomerParty, SalesInvHeader."Bill-to Name", Customer."NRS TIN", Customer."NRS Email",
            Customer."Phone No.", Customer."NRS Business Desc.",
            CustAddrValue(SalesInvHeader."Bill-to Address", Customer.Address),
            CustAddrValue(SalesInvHeader."Bill-to City", Customer.City),
            Customer."NRS LGA Code", Customer."NRS State Code",
            CustAddrValue(SalesInvHeader."Bill-to Post Code", Customer."Post Code"),
            GetCustomerCountry(Customer, SalesInvHeader));
        Body.Add('accounting_customer_party', CustomerParty);

        // ---- Tax total ----
        BuildTaxTotalFromLines(SalesInvHeader, NRSSetup, TaxTotalArr);
        Body.Add('tax_total', TaxTotalArr);

        // ---- Legal monetary total ----
        LegalTotal.Add('line_extension_amount', TaxExclusive);
        LegalTotal.Add('tax_exclusive_amount', TaxExclusive);
        LegalTotal.Add('tax_inclusive_amount', TaxInclusive);
        LegalTotal.Add('payable_amount', TaxInclusive);
        Body.Add('legal_monetary_total', LegalTotal);

        // ---- Invoice lines ----
        BuildInvoiceLines(SalesInvHeader, NRSSetup, InvoiceLineArr);
        Body.Add('invoice_line', InvoiceLineArr);
    end;

    local procedure BuildParty(var PartyObj: JsonObject; Name: Text; Tin: Text; Email: Text; Telephone: Text; Description: Text; Street: Text; City: Text; Lga: Text; State: Text; PostalZone: Text; Country: Text)
    var
        Addr: JsonObject;
    begin
        Clear(PartyObj);
        PartyObj.Add('party_name', Name);
        PartyObj.Add('tin', Tin);
        PartyObj.Add('email', Email);
        if Telephone <> '' then
            PartyObj.Add('telephone', Telephone);
        if Description <> '' then
            PartyObj.Add('business_description', Description);

        // postal_address: street_name, city_name, lga, state, postal_zone, country. The server
        // (validateInvoiceRequestV3, used by BOTH /validate and /sign) requires lga and state -
        // it rejects them as "cannot be empty" when missing, regardless of the doc examples.
        Addr.Add('street_name', Street);
        Addr.Add('city_name', City);
        Addr.Add('lga', Lga);
        Addr.Add('state', State);
        Addr.Add('postal_zone', PostalZone);
        Addr.Add('country', Country);
        PartyObj.Add('postal_address', Addr);
    end;

    /// <summary>
    /// Builds tax_total from the invoice lines: VAT is summed per line and grouped by VAT rate,
    /// producing one tax_subtotal per distinct rate (e.g. a 7.5% Standard VAT subtotal and, if the
    /// invoice mixes treatments, a separate 0% Zero VAT subtotal).
    /// </summary>
    local procedure BuildTaxTotalFromLines(SalesInvHeader: Record "Sales Invoice Header"; NRSSetup: Record "NRS Setup"; var Arr: JsonArray)
    var
        SalesInvLine: Record "Sales Invoice Line";
        TotalObj: JsonObject;
        SubtotalObj: JsonObject;
        CategoryObj: JsonObject;
        SubtotalArr: JsonArray;
        TaxableByRate: Dictionary of [Decimal, Decimal];
        VatByRate: Dictionary of [Decimal, Decimal];
        Rate: Decimal;
        LineBase: Decimal;
        LineVat: Decimal;
        TotalVat: Decimal;
        Taxable: Decimal;
        Vat: Decimal;
        CategoryId: Text;
    begin
        // Accumulate taxable base and VAT per rate, straight from each posted line.
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        SalesInvLine.SetFilter(Type, '<>%1', SalesInvLine.Type::" ");
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        if SalesInvLine.FindSet() then
            repeat
                Rate := SalesInvLine."VAT %";
                LineBase := SalesInvLine.Amount;
                LineVat := SalesInvLine."Amount Including VAT" - SalesInvLine.Amount;
                if TaxableByRate.ContainsKey(Rate) then begin
                    TaxableByRate.Set(Rate, TaxableByRate.Get(Rate) + LineBase);
                    VatByRate.Set(Rate, VatByRate.Get(Rate) + LineVat);
                end else begin
                    TaxableByRate.Add(Rate, LineBase);
                    VatByRate.Add(Rate, LineVat);
                end;
            until SalesInvLine.Next() = 0;

        // One tax_subtotal per rate group.
        foreach Rate in TaxableByRate.Keys() do begin
            Taxable := TaxableByRate.Get(Rate);
            Vat := VatByRate.Get(Rate);
            TotalVat += Vat;

            if Rate > 0 then begin
                CategoryId := NRSSetup."Def. Tax Category";
                if CategoryId = '' then
                    CategoryId := 'STANDARD_VAT';
            end else
                CategoryId := ZeroVatTok;

            Clear(CategoryObj);
            CategoryObj.Add('id', CategoryId);
            CategoryObj.Add('percent', Rate);

            Clear(SubtotalObj);
            SubtotalObj.Add('taxable_amount', Taxable);
            SubtotalObj.Add('tax_amount', Vat);
            SubtotalObj.Add('tax_category', CategoryObj);
            SubtotalObj.Add('tax_category_percent', Rate);
            SubtotalArr.Add(SubtotalObj);
        end;

        Clear(TotalObj);
        TotalObj.Add('tax_amount', TotalVat);
        TotalObj.Add('tax_subtotal', SubtotalArr);
        Clear(Arr);
        Arr.Add(TotalObj);
    end;

    local procedure BuildInvoiceLines(SalesInvHeader: Record "Sales Invoice Header"; NRSSetup: Record "NRS Setup"; var Arr: JsonArray)
    var
        SalesInvLine: Record "Sales Invoice Line";
        Item: Record Item;
        ItemCategoryMap: Record "NRS Item Category Map";
        UnitOfMeasure: Record "Unit of Measure";
        LineObj: JsonObject;
        ItemObj: JsonObject;
        PriceObj: JsonObject;
        PriceUnit: Text;
        MappedUnit: Text;
        HsnCode: Text;
        ProductCategory: Text;
        ServiceCategory: Text;
        IsicCode: Integer;
        ItemHasService: Boolean;
    begin
        Clear(Arr);
        SalesInvLine.SetRange("Document No.", SalesInvHeader."No.");
        SalesInvLine.SetFilter(Type, '<>%1', SalesInvLine.Type::" ");
        SalesInvLine.SetFilter(Quantity, '<>%1', 0);
        if not SalesInvLine.FindSet() then
            exit;

        repeat
            Clear(ItemObj);
            ItemObj.Add('name', GetLineName(SalesInvLine));
            if SalesInvLine.Description <> '' then
                ItemObj.Add('description', SalesInvLine.Description);
            if SalesInvLine."No." <> '' then
                ItemObj.Add('sellers_item_identification', SalesInvLine."No.");

            // price_unit resolution order:
            //  1) the unit's International Standard Code, if set on the Unit of Measure card;
            //  2) the built-in UN/ECE mapping for the company's known unit codes;
            //  3) the setup default.
            PriceUnit := NRSSetup."Def. Price Unit";
            if SalesInvLine."Unit of Measure Code" <> '' then begin
                MappedUnit := '';
                if UnitOfMeasure.Get(SalesInvLine."Unit of Measure Code") then
                    MappedUnit := UnitOfMeasure."International Standard Code";
                if MappedUnit = '' then
                    MappedUnit := MapUnitCode(SalesInvLine."Unit of Measure Code");
                if MappedUnit <> '' then
                    PriceUnit := MappedUnit;
            end;

            Clear(PriceObj);
            PriceObj.Add('price_amount', SalesInvLine."Unit Price");
            PriceObj.Add('base_quantity', 1);
            PriceObj.Add('price_unit', PriceUnit);

            Clear(LineObj);
            LineObj.Add('item', ItemObj);
            LineObj.Add('price', PriceObj);

            // Resolve classification. Items take it from their BC Item Category (via the NRS Item
            // Category Mapping); Resource-type lines are classified as goods using the dedicated
            // resource HSN default; anything unmatched falls back to the general setup defaults.
            HsnCode := NRSSetup."Def. HSN Code";
            ProductCategory := NRSSetup."Def. Product Category";
            IsicCode := NRSSetup."Def. ISIC Code";
            ServiceCategory := NRSSetup."Def. Service Category";
            ItemHasService := false;

            case SalesInvLine.Type of
                SalesInvLine.Type::Resource:
                    begin
                        // Resources (e.g. BREAK-IN SERVICE) are sent as goods with an HSN code.
                        if NRSSetup."Def. Resource HSN Code" <> '' then
                            HsnCode := NRSSetup."Def. Resource HSN Code";
                        if NRSSetup."Def. Resource Product Category" <> '' then
                            ProductCategory := NRSSetup."Def. Resource Product Category";
                    end;
                SalesInvLine.Type::Item:
                    if Item.Get(SalesInvLine."No.") then
                        if (Item."Item Category Code" <> '') and ItemCategoryMap.Get(Item."Item Category Code") then begin
                            if ItemCategoryMap."HSN Code" <> '' then
                                HsnCode := ItemCategoryMap."HSN Code";
                            if ItemCategoryMap."Product Category" <> '' then
                                ProductCategory := ItemCategoryMap."Product Category";
                            if ItemCategoryMap."ISIC Code" <> 0 then
                                IsicCode := ItemCategoryMap."ISIC Code";
                            if ItemCategoryMap."Service Category" <> '' then begin
                                ServiceCategory := ItemCategoryMap."Service Category";
                                ItemHasService := true;
                            end;
                        end;
            end;

            // Emit HSN + product category for goods (now including Resource lines). Only send the
            // isic/service pair for an item you've explicitly tagged with a service category.
            if HsnCode <> '' then
                LineObj.Add('hsn_code', HsnCode);
            if ProductCategory <> '' then
                LineObj.Add('product_category', ProductCategory);
            if ItemHasService and (ServiceCategory <> '') then begin
                LineObj.Add('isic_code', IsicCode);
                LineObj.Add('service_category', ServiceCategory);
            end;

            LineObj.Add('discount_rate', SalesInvLine."Line Discount %");
            LineObj.Add('discount_amount', SalesInvLine."Line Discount Amount");
            LineObj.Add('fee_rate', 0);
            LineObj.Add('fee_amount', 0);
            LineObj.Add('invoiced_quantity', SalesInvLine.Quantity);
            LineObj.Add('line_extension_amount', SalesInvLine.Amount);

            Arr.Add(LineObj);
        until SalesInvLine.Next() = 0;
    end;

    // ----------------------------------------------------------------------------------
    // Helpers
    // ----------------------------------------------------------------------------------

    local procedure GetLineName(SalesInvLine: Record "Sales Invoice Line"): Text
    begin
        if SalesInvLine.Description <> '' then
            exit(SalesInvLine.Description);
        exit(SalesInvLine."No.");
    end;

    /// <summary>Maps a Business Central unit-of-measure code to its UN/ECE (NRS) price_unit code.</summary>
    local procedure MapUnitCode(UomCode: Code[10]): Text
    begin
        case UpperCase(UomCode) of
            'KG':
                exit('KGM');
            'LITRE':
                exit('LTR');
            'METERS':
                exit('MTR');
            'LENGTH':
                exit('MTR');
            'YARD':
                exit('YRD');
            'GALLON':
                exit('GLI');
            'HRS':
                exit('HUR');
            'MINS':
                exit('MIN');
            'DAYS':
                exit('DAY');
            'PAIR':
                exit('PR');
            'SET':
                exit('SET');
            'PCS':
                exit('H87');
            'CAN', 'CUP', 'CYLINDER', 'DRUM', 'KEG', 'PACK', 'ROLL', 'SHEET', 'UNIT':
                exit('C62');
        end;
        exit('');
    end;

    /// <summary>Returns the posted (bill-to) address value, falling back to the customer master when blank.</summary>
    local procedure CustAddrValue(PostedValue: Text; MasterValue: Text): Text
    begin
        if PostedValue <> '' then
            exit(PostedValue);
        exit(MasterValue);
    end;

    local procedure GetCustomerCountry(Customer: Record Customer; SalesInvHeader: Record "Sales Invoice Header"): Text
    begin
        if Customer."NRS Country Code" <> '' then
            exit(Customer."NRS Country Code");
        if SalesInvHeader."Bill-to Country/Region Code" <> '' then
            exit(SalesInvHeader."Bill-to Country/Region Code");
        exit('NG');
    end;

    local procedure FindOrCreateLog(var IRNLog: Record "NRS IRN Log"; SalesInvHeader: Record "Sales Invoice Header")
    begin
        IRNLog.Reset();
        IRNLog.SetRange("Source Table No.", Database::"Sales Invoice Header");
        IRNLog.SetRange("Document No.", SalesInvHeader."No.");
        if IRNLog.FindFirst() then
            exit;
        IRNLog.Init();
        IRNLog."Source Table No." := Database::"Sales Invoice Header";
        IRNLog."Document No." := SalesInvHeader."No.";
        IRNLog."Invoice Number" := SalesInvHeader."No.";
        IRNLog."Posting Date" := SalesInvHeader."Posting Date";
        IRNLog.IRN := SalesInvHeader."NRS IRN";
        IRNLog.Insert(true);
    end;

    local procedure ExtractMessage(ResponseText: Text): Text
    var
        Json: JsonObject;
        Tok: JsonToken;
        BaseMsg: Text;
        Details: Text;
    begin
        if not Json.ReadFrom(ResponseText) then
            exit(CopyStr(ResponseText, 1, 250));

        // Top-level human message (e.g. "Validation error").
        if Json.Get('message', Tok) then
            if not Tok.AsValue().IsNull() then
                BaseMsg := Tok.AsValue().AsText();

        // NRS returns the specific field problems in an "errors" collection, sometimes
        // nested under "data". Pull those out so the log names the actual offending fields.
        Details := ExtractErrorDetails(Json);
        if (Details = '') then
            if Json.Get('data', Tok) then
                if Tok.IsObject() then
                    Details := ExtractErrorDetails(Tok.AsObject());

        if Details <> '' then begin
            if BaseMsg <> '' then
                exit(CopyStr(BaseMsg + ': ' + Details, 1, 250));
            exit(CopyStr(Details, 1, 250));
        end;

        if BaseMsg <> '' then
            exit(BaseMsg);
        exit(CopyStr(ResponseText, 1, 250));
    end;

    /// <summary>Flattens an "errors" collection (object of field->messages, or an array) into a readable string.</summary>
    local procedure ExtractErrorDetails(Obj: JsonObject): Text
    var
        ErrTok: JsonToken;
        ItemTok: JsonToken;
        MsgTok: JsonToken;
        ErrObj: JsonObject;
        ErrArr: JsonArray;
        FieldKeys: List of [Text];
        FieldKey: Text;
        Result: Text;
    begin
        if not Obj.Get('errors', ErrTok) then
            exit('');

        // Shape A: { "errors": { "field": ["msg", ...], ... } }
        if ErrTok.IsObject() then begin
            ErrObj := ErrTok.AsObject();
            FieldKeys := ErrObj.Keys();
            foreach FieldKey in FieldKeys do begin
                ErrObj.Get(FieldKey, ItemTok);
                if Result <> '' then
                    Result += '; ';
                Result += FieldKey + ' - ' + TokenToText(ItemTok);
            end;
            exit(Result);
        end;

        // Shape B: { "errors": [ "msg", ... ] } or [ { "field":.., "message":.. }, ... ]
        if ErrTok.IsArray() then begin
            ErrArr := ErrTok.AsArray();
            foreach ItemTok in ErrArr do begin
                if Result <> '' then
                    Result += '; ';
                if ItemTok.IsObject() and ItemTok.AsObject().Get('message', MsgTok) then
                    Result += MsgTok.AsValue().AsText()
                else
                    Result += TokenToText(ItemTok);
            end;
            exit(Result);
        end;

        exit('');
    end;

    /// <summary>Renders a JSON token (value, or array of values) as plain text.</summary>
    local procedure TokenToText(Tok: JsonToken): Text
    var
        Arr: JsonArray;
        ElemTok: JsonToken;
        Result: Text;
    begin
        if Tok.IsValue() then
            exit(Tok.AsValue().AsText());
        if Tok.IsArray() then begin
            Arr := Tok.AsArray();
            foreach ElemTok in Arr do begin
                if Result <> '' then
                    Result += ', ';
                if ElemTok.IsValue() then
                    Result += ElemTok.AsValue().AsText();
            end;
            exit(Result);
        end;
        exit('');
    end;
}
