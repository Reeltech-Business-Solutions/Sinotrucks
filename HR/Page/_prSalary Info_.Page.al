page 54612 "prSalary Info"
{
    PageType = CardPart;
    SourceTable = "prSalary Card";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Payment Info")
            {
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = all;
                }
                field("Pays PAYE"; Rec."Pays PAYE")
                {
                    ApplicationArea = all;
                }
                field("Pays NHF"; Rec."Pays NHF")
                {
                    ApplicationArea = all;
                }
            }
            group("Payment History")
            {
                field("Cumm BasicPay"; Rec."Cumm BasicPay")
                {
                    ApplicationArea = all;
                }
                field("Cumm GrossPay"; Rec."Cumm GrossPay")
                {
                    ApplicationArea = all;
                }
                field("Cumm Allowances"; Rec."Cumm Allowances")
                {
                    ApplicationArea = all;
                }
                field("Cumm PAYE"; Rec."Cumm PAYE")
                {
                    ApplicationArea = all;
                }
                field("Cumm Deductions"; Rec."Cumm Deductions")
                {
                    ApplicationArea = all;
                }
                field("Cumm NetPay"; Rec."Cumm NetPay")
                {
                    ApplicationArea = all;
                }
            }
            group("Suspension Of Payment")
            {
                field("Suspend Pay"; Rec."Suspend Pay")
                {
                    ApplicationArea = all;
                }
                field("Suspension Date"; Rec."Suspension Date")
                {
                    ApplicationArea = all;
                }
                field("Suspension Reasons"; Rec."Suspension Reasons")
                {
                    ApplicationArea = all;
                }
                field("Suspension End Date"; Rec."Suspension End Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnInit()
    begin
        //Get the open period
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            CurrentMonth := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
        end;
    end;

    var
        BasicSalary: Decimal;
        Question: Text[200];
        Answer: Boolean;
        objPeriod: Record "prPayroll Periods";
        CurrentMonth: Date;
        PeriodName: Text[30];
        PeriodTrans: Record "prPeriod Transactions";
}
