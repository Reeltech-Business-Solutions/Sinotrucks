pageextension 50025 "Purchase Cr MemoExt" extends "Purchase Credit Memo"
{
    layout
    {
        addafter(Status)
        {
            field("Import file No."; Rec."Import file No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
