page 54941 "HR Appraisal Career Dev Ques"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Career Dev";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Question; rec.Question)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Answer; rec.Answer)
                {
                    Editable = true;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
