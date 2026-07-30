page 54875 "Edit Posting Description"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Purch. Inv. Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Pay-to Name"; Rec."Pay-to Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Posting Description"; Rec."Posting Description")
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
