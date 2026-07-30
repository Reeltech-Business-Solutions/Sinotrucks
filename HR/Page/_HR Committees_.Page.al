page 54498 "HR Committees"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Committees";
    AdditionalSearchTerms = 'HR Committees';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field(Commitee; rec.Commitee)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Roles; rec.Roles)
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Committee)
            {
                Caption = 'Committee';

                action(Members)
                {
                    Caption = 'Members';
                    RunObject = Page "HR Commitee Members";
                    //RunPageLink = Committee = FIELD (Commitee);
                    ApplicationArea = All;
                }
            }
        }
    }
}
