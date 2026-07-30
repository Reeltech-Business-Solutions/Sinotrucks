pageextension 50046 PostedTransferRecptListExt extends "Posted Transfer Receipts"
{
    layout
    {
        addbefore("Posting Date")
        {
            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
