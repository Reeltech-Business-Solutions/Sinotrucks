pageextension 50031 "Posted TransferShipmntExt" extends "Posted Transfer Shipments"
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
