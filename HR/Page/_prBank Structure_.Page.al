page 54608 "prBank Structure"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prBank Structure";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Bank Structure';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = all;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = all;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = all;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = all;
                }
                field("Bank Sort Code"; Rec."Bank Sort Code")
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
