page 50392 "NRS Note Details"
{
    Caption = 'NRS Note Details';
    PageType = StandardDialog;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Details)
            {
                field(DocType; DocTypeVar)
                {
                    Caption = 'NRS Document Type';
                    ApplicationArea = All;
                    Visible = ShowDocTypeVar;
                    ToolTip = 'Choose whether NRS should treat this posted invoice as a normal Invoice or a Debit Note.';
                }
                field(OrigNo; OrigNoVar)
                {
                    Caption = 'Original Invoice No.';
                    ApplicationArea = All;
                    TableRelation = "Sales Invoice Header"."No.";
                    ToolTip = 'Enter or look up the original posted invoice this note corrects. Its IRN becomes the NRS billing_reference.';
                }
            }
        }
    }

    var
        DocTypeVar: Enum "NRS Document Type";
        OrigNoVar: Code[20];
        ShowDocTypeVar: Boolean;

    /// <summary>Seeds the dialog. Pass ShowDocType=true for invoices (debit-note choice), false for credit memos.</summary>
    procedure InitDialog(ShowDocType: Boolean; CurrentType: Enum "NRS Document Type"; CurrentOrig: Code[20])
    begin
        ShowDocTypeVar := ShowDocType;
        DocTypeVar := CurrentType;
        OrigNoVar := CurrentOrig;
    end;

    procedure GetDocType(): Enum "NRS Document Type"
    begin
        exit(DocTypeVar);
    end;

    procedure GetOrigNo(): Code[20]
    begin
        exit(OrigNoVar);
    end;
}
