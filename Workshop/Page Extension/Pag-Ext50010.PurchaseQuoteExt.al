pageextension 50010 PurchaseQuoteExt extends "Purchase Quote Subform"
{
    layout
    {
        addbefore(Type)
        {
            field("Expense No."; Rec."Expense No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Qty. Assigned")
        {
            field("PRF No."; Rec."PRF No.")
            {
                ApplicationArea = All;
            }
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
            }
            // field("VAT Bus. Posting Group1"; Rec."VAT Bus. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
            // field("VAT Prod. Posting Group1"; Rec."VAT Prod. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
    }
}
