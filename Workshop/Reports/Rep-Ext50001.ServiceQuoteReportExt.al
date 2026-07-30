reportextension 50001 ServiceQuoteReportExt extends "Service Quote"
{
    dataset
    {

        add("Service Header")
        {
            column(Company_Bank_Account_Code; "Company Bank Account Code")
            {

            }
            column(BankName; BankName)
            {

            }
            column(BannkAcct; BannkAcct)
            {

            }
            column(BnkAccctNLabel; BnkAccctNoLabel)
            {

            }
            column(BnkNameLabel; BnkNameLabel)
            {

            }
            column(KM_Odometer_Reading; "KM Odometer Reading")
            {

            }
            column(CompanyInfo1; CompanyInfo1.Address)
            {

            }


        }
        modify("Service Header")
        {
            trigger OnAfterAfterGetRecord()
            begin
                Bank.Reset();
                Bank.SetRange("No.", "Company Bank Account Code");
                if Bank.FindFirst() then begin
                    BankName := Bank.Name;
                    BannkAcct := Bank."Bank Account No.";
                end;
            end;
        }

        add("Service Line")
        {
            column(VATAmnt; VATAmnt)
            {

            }
            column(VatAmntLabel; VatAmntLabel)
            {

            }
            column(Line_Discount_Amount; "Line Discount Amount")
            {

            }

        }
        modify("Service Line")
        {
            trigger OnAfterAfterGetRecord()
            begin
                VATAmnt := "Amount Including VAT" - "Line Amount";
            end;
        }



    }

    trigger OnPreReport()
    begin
        CompanyInfo1.Get();
        CompanyInfo1.CalcFields(Picture);

    end;



    var
        BankName: Text[100];
        Bank: Record "Bank Account";
        VATAmnt: Decimal;
        BannkAcct: Code[20];
        BnkNameLabel: Label 'Bank Name';
        BnkAccctNoLabel: Label 'Bank Account No.';
        VatAmntLabel: Label 'VAT Amount';
        AmntInclVat: Label 'Amount Incl. VAT';

}
