table 50389 "NRS Received Invoice Line"
{
    Caption = 'NRS Received Invoice Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "IRN"; Text[100]) { Caption = 'IRN'; TableRelation = "NRS Received Invoice".IRN; }
        field(2; "Line No."; Integer) { Caption = 'Line No.'; }
        field(10; "Item Name"; Text[250]) { Caption = 'Item Name'; }
        field(11; "Description"; Text[250]) { Caption = 'Description'; }
        field(12; "Sellers Item Id"; Text[50]) { Caption = 'Sellers Item Id'; }
        field(13; "HSN Code"; Text[30]) { Caption = 'HSN Code'; }
        field(14; "Product Category"; Text[100]) { Caption = 'Product Category'; }
        field(20; "Quantity"; Decimal) { Caption = 'Quantity'; }
        field(21; "Price Amount"; Decimal) { Caption = 'Price Amount'; }
        field(22; "Line Extension Amount"; Decimal) { Caption = 'Line Amount'; }
    }

    keys
    {
        key(PK; "IRN", "Line No.") { Clustered = true; }
    }
}
