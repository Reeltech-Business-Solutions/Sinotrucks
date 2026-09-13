table 50187 "NRS Line Buffer"
{
    Caption = 'NRS Line Buffer';
    TableType = Temporary;
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Line No."; Integer) { Caption = 'Line No.'; }
        field(2; "Is Resource"; Boolean) { Caption = 'Is Resource'; }
        field(3; "No."; Code[20]) { Caption = 'No.'; }
        field(4; "Description"; Text[250]) { Caption = 'Description'; }
        field(5; "Unit of Measure Code"; Code[10]) { Caption = 'Unit of Measure Code'; }
        field(6; "Unit Price"; Decimal) { Caption = 'Unit Price'; }
        field(7; "Quantity"; Decimal) { Caption = 'Quantity'; }
        field(8; "Line Discount %"; Decimal) { Caption = 'Line Discount %'; }
        field(9; "Line Discount Amount"; Decimal) { Caption = 'Line Discount Amount'; }
        field(10; "Amount"; Decimal) { Caption = 'Amount'; }
        field(11; "Amount Including VAT"; Decimal) { Caption = 'Amount Including VAT'; }
        field(12; "VAT %"; Decimal) { Caption = 'VAT %'; }
    }

    keys
    {
        key(PK; "Line No.") { Clustered = true; }
    }
}
