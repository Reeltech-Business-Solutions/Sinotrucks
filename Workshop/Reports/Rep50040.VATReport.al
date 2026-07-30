report 50040 "VAT Report"
{
    ApplicationArea = All;
    Caption = 'VAT Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './VatReport.rdl';
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
                column(Customer_Name; "Customer Name")
                {

                }
                column(VAT_Amount; "VAT Amount")
                {

                }
                column(INV_Amount; Amount)
                {

                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {

                }
                column(Source_No_; "Source No.")
                {

                }
                column(SourceName; SourceName)
                {

                }
                column(Description; Description)
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
                    // VatBase.Reset();
                    // VatBase.SetRange("Document No.", "G/L Entry"."Document No.");
                    // VatBase.SetRange("G/L Acc. No.", "G/L Account"."No.");
                    // if VatBase.FindSet() then
                    // InvAmnt := VatBase.Base;


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
        VatBase: Record "VAT Entry";
        InvAmnt: Decimal;
}
