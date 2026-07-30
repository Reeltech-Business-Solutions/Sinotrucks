page 54424 "Self Evaluation"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Evaluations";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; rec.Description)
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
