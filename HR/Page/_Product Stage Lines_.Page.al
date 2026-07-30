page 54441 "Product Stage Lines"
{
    PageType = ListPart;
    SourceTable = "Product Stage Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Stage; rec.Stage)
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
