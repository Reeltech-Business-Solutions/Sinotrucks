page 54522 "HR Commitee Members"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Commitee Members';
    SourceTable = "HR Commitee Members";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = all;
                }
                field("Member Name"; Rec."Member Name")
                {
                    ApplicationArea = all;
                }
                field(Role; rec.Role)
                {
                    ApplicationArea = all;
                }
                field("Date Appointed"; Rec."Date Appointed")
                {
                    ApplicationArea = all;
                }
                field(Active; rec.Active)
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
