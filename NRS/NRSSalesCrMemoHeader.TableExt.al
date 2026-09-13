tableextension 50182 "NRS Sales Cr.Memo Hdr Ext" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50180; "NRS IRN"; Text[100])
        {
            Caption = 'NRS IRN';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50181; "NRS IRN Status"; Enum "NRS IRN Status")
        {
            Caption = 'NRS IRN Status';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50182; "NRS IRN Log Entry No."; Integer)
        {
            Caption = 'NRS IRN Log Entry No.';
            Editable = false;
            DataClassification = CustomerContent;
            TableRelation = "NRS IRN Log"."Entry No.";
        }
        field(50183; "NRS IRN Generated At"; DateTime)
        {
            Caption = 'NRS IRN Generated At';
            Editable = false;
            DataClassification = CustomerContent;
        }
        // The original invoice this credit note corrects (used for billing_reference).
        field(50185; "NRS Original Invoice No."; Code[20])
        {
            Caption = 'NRS Original Invoice No.';
            DataClassification = CustomerContent;
            TableRelation = "Sales Invoice Header"."No.";
        }
    }
}
