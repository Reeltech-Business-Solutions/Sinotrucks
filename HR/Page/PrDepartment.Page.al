page 54654 PrDepartment
{
    ApplicationArea = All;
    Caption = 'PrDepartment';
    PageType = List;
    SourceTable = Deps;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(CODE; Rec."CODE")
                {
                    ApplicationArea = All;
                }
                field("NAME TEXT"; Rec."NAME TEXT")
                {
                    ApplicationArea = All;
                }
                field("Location/Division"; Rec."Location/Division")
                {
                    ApplicationArea = All;
                }
                field(Allowances; Rec.Allowances)
                {
                    ApplicationArea = All;
                }
                field(Allowancesjn; Rec.Allowancesjn)
                {
                    ApplicationArea = All;
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = All;
                }
                field("Basic Salaryjn"; Rec."Basic Salaryjn")
                {
                    ApplicationArea = All;
                }
                field("Curr Net Pay"; Rec."Curr Net Pay")
                {
                    ApplicationArea = All;
                }
                field("Employer Pension"; Rec."Employer Pension")
                {
                    ApplicationArea = All;
                }
                field("Employer Pensionjn"; Rec."Employer Pensionjn")
                {
                    ApplicationArea = All;
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = All;
                }
                field("Gross Payjn"; Rec."Gross Payjn")
                {
                    ApplicationArea = All;
                }
                field("Prev Net Pay"; Rec."Prev Net Pay")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
