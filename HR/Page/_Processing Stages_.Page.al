page 54438 "Processing Stages"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = ListPart;
    SourceTable = "Product Processing Stages";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Stage Name"; rec."Stage Name")
                {
                    ApplicationArea = All;
                }
                field(Completed; rec.Completed)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
