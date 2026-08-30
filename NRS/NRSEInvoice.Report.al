report 50180 "NRS E-Invoice"
{
    Caption = 'NRS E-Invoice';
    UsageCategory = None;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'NRSEInvoice.rdlc';

    dataset
    {
        dataitem(Header; "Sales Invoice Header")
        {
            RequestFilterFields = "No.", "Bill-to Customer No.", "Posting Date";

            column(DocNo; "No.") { }
            column(PostingDate; Format("Posting Date")) { }
            column(DueDate; Format("Due Date")) { }
            column(CustName; "Bill-to Name") { }
            column(CustAddress; "Bill-to Address") { }
            column(CustAddress2; "Bill-to Address 2") { }
            column(CustCity; "Bill-to City") { }
            column(CustPostCode; "Bill-to Post Code") { }
            column(CustCountry; "Bill-to Country/Region Code") { }
            column(CurrencyCode; CurrencyText) { }
            column(TotalAmount; Amount) { }
            column(TotalVAT; "Amount Including VAT" - Amount) { }
            column(TotalInclVAT; "Amount Including VAT") { }
            column(IRN; IRNText) { }
            column(IRNStatus; Format("NRS IRN Status")) { }
            column(ValidationStatus; ValidationStatusText) { }
            column(QRBase64; QRBase64Text) { }
            column(SupplierName; NRSSetup."Supplier Name") { }
            column(SupplierTIN; NRSSetup."Supplier TIN") { }
            column(SupplierEmail; NRSSetup."Supplier Email") { }
            column(SupplierAddress; SupplierAddressText) { }
            column(CompanyName; CompanyInfo.Name) { }

            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = Header;
                DataItemTableView = sorting("Document No.", "Line No.") where(Quantity = filter(<> 0));

                column(LineNo; "Line No.") { }
                column(LineType; Format(Type)) { }
                column(LineItemNo; "No.") { }
                column(LineDescription; Description) { }
                column(LineQuantity; Quantity) { }
                column(LineUnitPrice; "Unit Price") { }
                column(LineDiscountPct; "Line Discount %") { }
                column(LineAmount; Amount) { }
            }

            trigger OnAfterGetRecord()
            var
                IRNLog: Record "NRS IRN Log";
            begin
                IRNText := "NRS IRN";
                CurrencyText := "Currency Code";
                if CurrencyText = '' then
                    CurrencyText := NRSSetup."Def. Document Currency";

                QRBase64Text := '';
                ValidationStatusText := '';
                IRNLog.SetRange("Source Table No.", Database::"Sales Invoice Header");
                IRNLog.SetRange("Document No.", "No.");
                if IRNLog.FindFirst() then begin
                    QRBase64Text := IRNLog.GetQRCode();
                    ValidationStatusText := Format(IRNLog."Validation Status");
                end;
            end;
        }
    }

    trigger OnInitReport()
    begin
        NRSSetup.GetRecordOnce();
        CompanyInfo.Get();
        SupplierAddressText :=
            NRSSetup."Supplier Street" + ', ' + NRSSetup."Supplier City" + ' ' + NRSSetup."Supplier Postal Zone";
    end;

    var
        NRSSetup: Record "NRS Setup";
        CompanyInfo: Record "Company Information";
        IRNText: Text;
        QRBase64Text: Text;
        CurrencyText: Text;
        SupplierAddressText: Text;
        ValidationStatusText: Text;
}
