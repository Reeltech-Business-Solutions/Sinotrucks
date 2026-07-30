page 54617 "prMembership Groups"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prMembership Groups";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Membership Groups';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Group No"; Rec."Group No")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Comments; rec.Comments)
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
            group("Member Details")
            {
                Caption = 'Member Details';

                action("Institutional Listing")
                {
                    Caption = 'Institutional Listing';
                    Image = IndustryGroups;
                    RunObject = Page "prInstitutional Membership";
                    RunPageLink = "Group No"=FIELD("Group No");
                    ApplicationArea = All;
                }
            }
        }
    }
}
