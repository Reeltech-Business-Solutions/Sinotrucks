page 54621 "prPayroll Type"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prPayroll Type";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Payroll Type';

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;

                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = all;
                }
                field("Payroll Name"; Rec."Payroll Name")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                }
                field("Period Length"; Rec."Period Length")
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
