report 50041 "WHT Report"
{
    ApplicationArea = All;
    Caption = 'WHT Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './WHTReport.rdl';
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            RequestFilterFields = "No.";
            PrintOnlyIfDetail = true;
            column(No_; "No.")
            {

            }
            column(Name; Name)
            {

            }

            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "G/L Account No." = field("No."), "Posting Date" = field("Date Filter");
                DataItemLinkReference = "G/L Account";
                DataItemTableView = sorting("G/L Account No.", "Posting Date");

                column(Posting_Date; format("Posting Date"))
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(SourceName; SourceName)
                {

                }
                column(Source_No_; "Source No.")
                {

                }
                column(Amount; Amount)
                {

                }
                column(WHT_; "WHT%")
                {

                }
                column(Description; Description)
                {

                }
                column(WHTAmnt; WHTAmnt)
                {

                }



                trigger OnAfterGetRecord()

                begin
                    case "G/L Entry"."Source Type" of
                        "G/L Entry"."Source Type"::Customer:
                            if Customer.Get("G/L Entry"."Source No.") then
                                SourceName := Customer.Name;

                        "G/L Entry"."Source Type"::Vendor:
                            if Vendor.Get("G/L Entry"."Source No.") then
                                SourceName := Vendor.Name;

                        "G/L Entry"."Source Type"::"Bank Account":
                            if BankAccount.Get("G/L Entry"."Source No.") then
                                SourceName := BankAccount.Name;

                        "G/L Entry"."Source Type"::"Fixed Asset":
                            if FixedAsset.Get("G/L Entry"."Source No.") then
                                SourceName := FixedAsset.Description;

                        "G/L Entry"."Source Type"::Employee:
                            if Employee.Get("G/L Entry"."Source No.") then
                                SourceName := Employee.FullName();


                    end;
                    WHTAmnt := 0;
                    VendorLedg.Reset();
                    VendorLedg.SetRange("Transaction No.", "G/L Entry"."Transaction No.");
                    if VendorLedg.FindFirst() then begin
                        repeat
                            WHTAmnt += VendorLedg.Amount;
                        until VendorLedg.Next() = 0;
                    end;
                end;



            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        SourceName: Text[150];
        Vendor: Record Vendor;
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
        Customer: Record Customer;
        "WHT%": decimal;
        PurchaseHd: Record "Purchase Header";
        VendorLedg: Record "Vendor Ledger Entry";
        WHTAmnt: Decimal;


}
