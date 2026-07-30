page 54673 "HR Appraisal Behavioural GRP"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Appraisal Behaviourals";
    AdditionalSearchTerms = 'HR Appraisal Behavioural GRP';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Behavioural Group"; Rec."Behavioural Group")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Rating; rec.Rating)
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
