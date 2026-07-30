page 54572 "Hr Interview Evaluation Rating"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Hr Interview Evaluation Rating';
    UsageCategory = Lists;
    SourceTable = "Hr Interview Evalution Rating";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Score; rec.Score)
                {
                    ApplicationArea = all;
                }
                field(Recommendations; rec.Recommendations)
                {
                    ApplicationArea = all;
                }
                field("Description 2"; Rec."Description 2")
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
