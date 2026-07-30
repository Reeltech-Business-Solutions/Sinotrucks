page 54594 "HR Appraisal DevelopmentLines1"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Appraisal Evaluations";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Category; rec.Category)
                {
                    ApplicationArea = all;
                }
                field("<Groups>"; rec.Group)
                {
                    ApplicationArea = all;
                }
                field("Sub Category"; rec."Sub Category")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Code"; rec."Evaluation Code")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Description"; rec."Evaluation Description")
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
