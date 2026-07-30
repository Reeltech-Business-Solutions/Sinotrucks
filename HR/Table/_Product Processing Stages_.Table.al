table 54439 "Product Processing Stages"
{
    fields
    {
        field(1; "Qoute No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Stage Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; Completed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Qoute No", "Line No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
}
