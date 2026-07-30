page 54811 "prEmployer Deductions"
{
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "prEmployer Deductions";

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
