pageextension 50057 ItemCardExt extends "Item Card"
{
    layout
    {
        addafter("Common Item No.")
        {
            field("Usage period (Warranty)"; Rec."Usage period (Warranty)")
            {
                ApplicationArea = All;
            }
        }
        addafter("Item Category Code")
        {
            field("Truck Model"; Rec."Truck Model")
            {
                ApplicationArea = All;
            }
        }
    }
}
