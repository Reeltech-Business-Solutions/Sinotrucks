pageextension 50019 TransferLineExt extends "Transfer Order Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("Quantity in Inventory"; Rec."Quantity in Inventory")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}
