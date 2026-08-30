page 50485 "NRS QR Code"
{
    Caption = 'NRS QR Code';
    PageType = Card;
    SourceTable = "NRS QR Buffer";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            group(Info)
            {
                Caption = 'Invoice';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the posted invoice this QR code belongs to.';
                }
                field(IRN; Rec.IRN)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Invoice Reference Number.';
                }
            }
            group(Code)
            {
                Caption = 'QR Code';

                field("QR Image"; Rec."QR Image")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    ToolTip = 'Shows the QR code image returned by NRS.';
                }
            }
        }
    }
}
