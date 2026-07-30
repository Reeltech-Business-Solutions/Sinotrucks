report 50038 "Payment Receipt Report"
{
    ApplicationArea = All;
    Caption = 'Payment Receipt Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './PaymentReceipt.rdl';
    dataset
    {
        dataitem("Cust. Ledger Entry"; "Cust. Ledger Entry")
        {
            RequestFilterFields = "Document Type", "Document No.";

            column(Amount; Amount)
            {

            }
            column(Posting_Date; Format("Posting Date"))
            {

            }
            column(Document_No_; "Document No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Document_Date; Format("Document Date"))
            {

            }
            column(Amtinwords; Amtinwords)
            {

            }
            column(Picture; CompanyInfo.Picture)
            {

            }
            column(CompanyInfoName; CompanyInfo.Name)
            {

            }
            column(CompanyInfoAddr; CompanyInfo.Address)
            {

            }
            column(CompanyInfoVAT; CompanyInfo."VAT Registration No.")
            {

            }
            column(Customer_Name; "Customer Name")
            {

            }
            dataitem("Bank Account Ledger Entry"; "Bank Account Ledger Entry")
            {
                DataItemLink = "Document No." = field("Document No.");

                column(Bank_Account_No_; "Bank Account No.")
                {

                }
                column(BankName; BankName)
                {

                }

                trigger OnAfterGetRecord()
                begin

                    bankAcct.Reset();
                    bankAcct.SetRange("No.", "Bank Account No.");
                    if bankAcct.FindFirst() then
                        BankName := bankAcct.Name;
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
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        BankName: Text;
        bankAcct: Record "Bank Account";
        Amtinwords: Text[200];
}
