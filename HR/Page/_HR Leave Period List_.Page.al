page 54699 "HR Leave Period List"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Leave Period List';
    UsageCategory = Lists;
    SourceTable = "HR Leave Periods";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Period Code"; Rec."Period Code")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                }
                field("Period Description"; Rec."Period Description")
                {
                    ApplicationArea = all;
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = all;
                }
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
                field("Date Locked"; Rec."Date Locked")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1102755009; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
