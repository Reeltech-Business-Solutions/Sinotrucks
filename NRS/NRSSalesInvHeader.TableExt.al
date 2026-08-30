tableextension 50180 "NRS Sales Inv. Header Ext" extends "Sales Invoice Header"
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
    }
}
