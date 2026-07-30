page 54704 "Training Evaluation Subform"
{
    PageType = ListPart;
    SourceTable = "Training Evaluation Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Question; rec.Question)
                {
                    ApplicationArea = all;
                }
                field(Answer; rec.Answer)
                {
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
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
