page 50266 ComplaintComment
{
    ApplicationArea = All;
    Caption = 'Comments/Reason';
    PageType = Worksheet;
    SourceTable = ComplaintComment;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Visible = false;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Comment By"; Rec."Comment By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment By field.';
                }
                field("Comment Date"; Rec."Comment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment Date field.';
                }
                field(Seen; Rec.Seen)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies if the user has read the comment';
                }
                field("Seen By"; Rec."Seen By")
                {
                    ApplicationArea = All;
                }
                field("Seen Date"; Rec."Seen Date")
                {
                    ApplicationArea = All;
                }
                field(Notify; Rec.Notify)
                {
                    ApplicationArea = All;
                }

            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: record "User Setup";
    begin
        // UserSetup.SetFilter();
    end;


}
