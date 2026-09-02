table 50184 "NRS Item Category Map"
{
    Caption = 'NRS Item Category Mapping';
    DataClassification = CustomerContent;
    LookupPageId = "NRS Item Category Map";
    DrillDownPageId = "NRS Item Category Map";

    fields
    {
        field(1; "Item Category Code"; Code[20])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
            NotBlank = true;
        }
        field(2; "HSN Code"; Text[30])
        {
            Caption = 'HSN Code';
        }
        field(3; "Product Category"; Text[100])
        {
            Caption = 'Product Category';
        }
        field(4; "ISIC Code"; Integer)
        {
            Caption = 'ISIC Code';
        }
        field(5; "Service Category"; Text[100])
        {
            Caption = 'Service Category';
        }
    }

    keys
    {
        key(PK; "Item Category Code")
        {
            Clustered = true;
        }
    }
}
