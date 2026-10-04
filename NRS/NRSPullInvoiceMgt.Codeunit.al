codeunit 50183 "NRS Pull Invoice Mgt."
{
    // Buyer-side "pull invoice": GET {si_base}/get-invoice/{irn}. Retrieves an invoice a supplier
    // signed and transmitted to us, and stores it in NRS Received Invoice (+ lines).

    Permissions = tabledata "NRS Received Invoice" = RIMD,
                  tabledata "NRS Received Invoice Line" = RIMD;

    var
        NoIRNErr: Label 'Enter the IRN of the invoice to pull.';
        ConnErr: Label 'Could not reach the NRS e-invoicing service. Check network access / firewall.';
        PullFailErr: Label 'Pull invoice failed (HTTP %1): %2', Comment = '%1 = status, %2 = message';
        ParseErr: Label 'The response from NRS could not be read.';
        NoDataErr: Label 'The response did not contain any invoice data for that IRN.';
        PulledTxt: Label 'Invoice %1 pulled successfully.', Comment = '%1 = IRN';

    /// <summary>Pulls a signed invoice by IRN and stores it. Returns true on success.</summary>
    procedure PullInvoice(IRNToPull: Text): Boolean
    var
        NRSSetup: Record "NRS Setup";
        EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
        Url: Text;
        ResponseText: Text;
        HttpStatusCode: Integer;
        Sent: Boolean;
        Json: JsonObject;
        DataTok: JsonToken;
    begin
        NRSSetup.CheckReady();
        if IRNToPull = '' then
            Error(NoIRNErr);

        Url := EInvoiceMgt.SiBaseUrl() + '/get-invoice/' + IRNToPull;
        Sent := EInvoiceMgt.SendSignedToUrl('GET', Url, '', HttpStatusCode, ResponseText);
        if not Sent then
            Error(ConnErr);
        if not ((HttpStatusCode = 200) or (HttpStatusCode = 201)) then
            Error(PullFailErr, HttpStatusCode, ExtractMessage(ResponseText));
        if not Json.ReadFrom(ResponseText) then
            Error(ParseErr);
        if not Json.Get('data', DataTok) then
            Error(NoDataErr);
        if not DataTok.IsObject() then
            Error(NoDataErr);

        SaveReceived(IRNToPull, DataTok.AsObject(), ResponseText);
        Message(PulledTxt, IRNToPull);
        exit(true);
    end;

    local procedure SaveReceived(IRNToPull: Text; DataObj: JsonObject; RawResponse: Text)
    var
        Received: Record "NRS Received Invoice";
        RcvLine: Record "NRS Received Invoice Line";
        SupplierObj: JsonObject;
        CustomerObj: JsonObject;
        TotalsObj: JsonObject;
        LinesTok: JsonToken;
        LineTok: JsonToken;
        LineObj: JsonObject;
        ItemObj: JsonObject;
        PriceObj: JsonObject;
        IRNValue: Text;
        LineNo: Integer;
    begin
        IRNValue := GetText(DataObj, 'irn');
        if IRNValue = '' then
            IRNValue := IRNToPull;

        if not Received.Get(IRNValue) then begin
            Received.Init();
            Received.IRN := CopyStr(IRNValue, 1, MaxStrLen(Received.IRN));
            Received.Insert();
        end;

        Received."Invoice Type Code" := CopyStr(GetText(DataObj, 'invoice_type_code'), 1, MaxStrLen(Received."Invoice Type Code"));
        Received."Issue Date" := GetDate(DataObj, 'issue_date');
        Received."Due Date" := GetDate(DataObj, 'due_date');
        Received."Payment Status" := CopyStr(GetText(DataObj, 'payment_status'), 1, MaxStrLen(Received."Payment Status"));
        Received."Currency Code" := CopyStr(GetText(DataObj, 'document_currency_code'), 1, MaxStrLen(Received."Currency Code"));

        if GetObject(DataObj, 'accounting_supplier_party', SupplierObj) then begin
            Received."Supplier Name" := CopyStr(GetText(SupplierObj, 'party_name'), 1, MaxStrLen(Received."Supplier Name"));
            Received."Supplier TIN" := CopyStr(GetText(SupplierObj, 'tin'), 1, MaxStrLen(Received."Supplier TIN"));
            Received."Supplier Email" := CopyStr(GetText(SupplierObj, 'email'), 1, MaxStrLen(Received."Supplier Email"));
        end;
        if GetObject(DataObj, 'accounting_customer_party', CustomerObj) then begin
            Received."Customer Name" := CopyStr(GetText(CustomerObj, 'party_name'), 1, MaxStrLen(Received."Customer Name"));
            Received."Customer TIN" := CopyStr(GetText(CustomerObj, 'tin'), 1, MaxStrLen(Received."Customer TIN"));
        end;
        if GetObject(DataObj, 'legal_monetary_total', TotalsObj) then begin
            Received."Tax Exclusive Amount" := GetDecimal(TotalsObj, 'tax_exclusive_amount');
            Received."Tax Inclusive Amount" := GetDecimal(TotalsObj, 'tax_inclusive_amount');
            Received."Payable Amount" := GetDecimal(TotalsObj, 'payable_amount');
        end;
        Received."Tax Amount" := GetTaxAmount(DataObj);
        Received."Pulled At" := CurrentDateTime();
        Received.SetRawResponse(RawResponse);
        Received.Modify();

        // Rebuild the lines from the response.
        RcvLine.SetRange(IRN, IRNValue);
        RcvLine.DeleteAll();
        if DataObj.Get('invoice_line', LinesTok) then
            if LinesTok.IsArray() then
                foreach LineTok in LinesTok.AsArray() do
                    if LineTok.IsObject() then begin
                        LineObj := LineTok.AsObject();
                        LineNo += 10000;
                        RcvLine.Init();
                        RcvLine.IRN := CopyStr(IRNValue, 1, MaxStrLen(RcvLine.IRN));
                        RcvLine."Line No." := LineNo;
                        if GetObject(LineObj, 'item', ItemObj) then begin
                            RcvLine."Item Name" := CopyStr(GetText(ItemObj, 'name'), 1, MaxStrLen(RcvLine."Item Name"));
                            RcvLine."Description" := CopyStr(GetText(ItemObj, 'description'), 1, MaxStrLen(RcvLine."Description"));
                            RcvLine."Sellers Item Id" := CopyStr(GetText(ItemObj, 'sellers_item_identification'), 1, MaxStrLen(RcvLine."Sellers Item Id"));
                        end;
                        if GetObject(LineObj, 'price', PriceObj) then
                            RcvLine."Price Amount" := GetDecimal(PriceObj, 'price_amount');
                        RcvLine."HSN Code" := CopyStr(GetText(LineObj, 'hsn_code'), 1, MaxStrLen(RcvLine."HSN Code"));
                        RcvLine."Product Category" := CopyStr(GetText(LineObj, 'product_category'), 1, MaxStrLen(RcvLine."Product Category"));
                        RcvLine."Quantity" := GetDecimal(LineObj, 'invoiced_quantity');
                        RcvLine."Line Extension Amount" := GetDecimal(LineObj, 'line_extension_amount');
                        RcvLine.Insert();
                    end;
    end;

    local procedure GetTaxAmount(DataObj: JsonObject): Decimal
    var
        Tok: JsonToken;
        FirstTok: JsonToken;
    begin
        if DataObj.Get('tax_total', Tok) then
            if Tok.IsArray() and (Tok.AsArray().Count() > 0) then begin
                Tok.AsArray().Get(0, FirstTok);
                if FirstTok.IsObject() then
                    exit(GetDecimal(FirstTok.AsObject(), 'tax_amount'));
            end;
        exit(0);
    end;

    // ---- JSON helpers ----
    local procedure GetText(Obj: JsonObject; KeyName: Text): Text
    var
        Tok: JsonToken;
    begin
        if Obj.Get(KeyName, Tok) then
            if Tok.IsValue() and (not Tok.AsValue().IsNull()) then
                exit(Tok.AsValue().AsText());
        exit('');
    end;

    local procedure GetDecimal(Obj: JsonObject; KeyName: Text): Decimal
    var
        Tok: JsonToken;
        Result: Decimal;
        AsTxt: Text;
    begin
        if not Obj.Get(KeyName, Tok) then
            exit(0);
        if not Tok.IsValue() then
            exit(0);
        if Tok.AsValue().IsNull() then
            exit(0);
        // Value may be a number or a string; Evaluate handles both, invariant format.
        AsTxt := Tok.AsValue().AsText();
        if Evaluate(Result, AsTxt, 9) then
            exit(Result);
        exit(0);
    end;

    local procedure GetDate(Obj: JsonObject; KeyName: Text): Date
    var
        Tok: JsonToken;
        Result: Date;
        AsTxt: Text;
    begin
        if not Obj.Get(KeyName, Tok) then
            exit(0D);
        if not Tok.IsValue() then
            exit(0D);
        if Tok.AsValue().IsNull() then
            exit(0D);
        AsTxt := Tok.AsValue().AsText();
        if AsTxt = '' then
            exit(0D);
        if Evaluate(Result, AsTxt, 9) then
            exit(Result);
        exit(0D);
    end;

    local procedure GetObject(Parent: JsonObject; KeyName: Text; var Child: JsonObject): Boolean
    var
        Tok: JsonToken;
    begin
        Clear(Child);
        if Parent.Get(KeyName, Tok) then
            if Tok.IsObject() then begin
                Child := Tok.AsObject();
                exit(true);
            end;
        exit(false);
    end;

    local procedure ExtractMessage(ResponseText: Text): Text
    var
        Json: JsonObject;
        Tok: JsonToken;
    begin
        if Json.ReadFrom(ResponseText) then
            if Json.Get('message', Tok) then
                if not Tok.AsValue().IsNull() then
                    exit(Tok.AsValue().AsText());
        exit(CopyStr(ResponseText, 1, 250));
    end;
}
