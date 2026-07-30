pageextension 50008 "Posted Purch InvExt" extends "Posted Purchase Invoice"
{
    layout
    {
        addbefore(Cancelled)
        {
            field("Import file No."; Rec."Import file No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
