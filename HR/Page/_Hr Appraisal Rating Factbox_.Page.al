page 54414 "Hr Appraisal Rating Factbox"
{
    Editable = false;
    ApplicationArea = All;
    PageType = ListPart;
    SourceTable = "HR Ratings";
    SourceTableView = SORTING(Score)ORDER(Ascending);

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field(Score; rec.Score)
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
