pageextension 50001 "GL/AcctExt" extends "G/L Account Card"
{
    layout
    {
        modify("No. 2")
        {
            Visible = true;
        }

        // addafter("No.")
        // {
        //     field("No. 2";Rec."No. 2")
        //     {
        //         ApplicationArea = All;
        //     }
        // }
    }
}
