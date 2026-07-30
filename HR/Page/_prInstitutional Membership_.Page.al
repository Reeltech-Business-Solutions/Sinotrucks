page 54618 "prInstitutional Membership"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prInstitutional Membership";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Institutional Membership';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Group No"; Rec."Group No")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Institution No"; Rec."Institution No")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("pfa code"; Rec."pfa code")
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
