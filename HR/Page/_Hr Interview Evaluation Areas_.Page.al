page 54574 "Hr Interview Evaluation Areas"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Hr Interview Evaluation Areas';
    UsageCategory = Lists;
    SourceTable = "Hr Interview Evaluation Areas";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Code"; Rec."Evaluation Code")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Description"; Rec."Evaluation Description")
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
