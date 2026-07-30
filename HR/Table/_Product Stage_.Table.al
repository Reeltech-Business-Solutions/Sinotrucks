table 54440 "Product Stage"
{
    DrillDownPageId = "Product Stage List";
    LookupPageId = "Product Stage List";

    fields
    {
        field(1; "Product Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Product Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Product Code")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
}
