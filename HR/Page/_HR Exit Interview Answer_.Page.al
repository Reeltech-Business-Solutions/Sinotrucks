page 54959 "HR Exit Interview Answer"
{
    PageType = CardPart;
    SourceTable = "HR Emp. Exit Interview Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Question; rec.Question)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Answer; rec.Answer)
            {
                MultiLine = true;
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
