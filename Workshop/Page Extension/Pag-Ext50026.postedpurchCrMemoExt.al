pageextension 50026 "posted purch CrMemoExt" extends "Posted Purchase Credit Memo"
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
