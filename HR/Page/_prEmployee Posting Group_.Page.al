page 54616 "prEmployee Posting Group"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prEmployee Posting Group";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Employee Posting Group';

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;

                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Salary Account"; Rec."Salary Account")
                {
                    ApplicationArea = all;
                }
                field("Income Tax Account"; Rec."Income Tax Account")
                {
                    ApplicationArea = all;
                }
                field("SSF Employer Account"; Rec."SSF Employer Account")
                {
                    ApplicationArea = all;
                }
                field("SSF Employee Account"; Rec."SSF Employee Account")
                {
                    ApplicationArea = all;
                }
                field("Net Salary Payable"; Rec."Net Salary Payable")
                {
                    ApplicationArea = all;
                }
                field("Operating Overtime"; Rec."Operating Overtime")
                {
                    ApplicationArea = all;
                }
                field("Employee Provident Fund Acc."; Rec."Employee Provident Fund Acc.")
                {
                    ApplicationArea = all;
                }
                field("Pension Employer Acc"; Rec."Pension Employer Acc")
                {
                    ApplicationArea = all;
                }
                field("Pension Employee Acc"; Rec."Pension Employee Acc")
                {
                    ApplicationArea = all;
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = all;
                }
                field("NHIF Employee Account"; Rec."NHIF Employee Account")
                {
                    ApplicationArea = all;
                }
                field("Suspense Account"; Rec."Suspense Account")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
