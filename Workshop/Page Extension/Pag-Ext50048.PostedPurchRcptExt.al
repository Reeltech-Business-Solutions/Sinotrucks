pageextension 50048 PostedPurchRcptExt extends "Posted Purchase Receipts"
{
    layout
    {
        addafter("Location Code")
        {
            field(orderNo; Rec."Order No.")
            {
                ApplicationArea = All;
            }   
        }
    }
    
}
