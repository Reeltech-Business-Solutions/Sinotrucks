page 54602 "HR Training Eva. Template"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Training Eval. question line";
    AdditionalSearchTerms = 'HR Training Eva. Template';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Eval Question No."; Rec."Training Eval Question No.")
                {
                    ApplicationArea = all;
                }
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = all;
                }
                field("Training Eval. Question"; Rec."Training Eval. Question")
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
