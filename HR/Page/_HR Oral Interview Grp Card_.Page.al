page 54783 "HR Oral Interview Grp Card"
{
    PageType = Card;
    SourceTable = "HR Oral Interview Group";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Oral Interview Category"; Rec."Oral Interview Category")
                {
                    ApplicationArea = All;
                }
                field("Oral Interview Description"; Rec."Oral Interview Description")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
