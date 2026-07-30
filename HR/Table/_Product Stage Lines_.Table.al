table 54441 "Product Stage Lines"
{
    fields
    {
        field(1; "Product Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Stage; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Product Code", "Line No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
}
