table 50101 "Value Posting"
{
    Caption = 'Value Posting';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; UserID; Code[50])
        {
            TableRelation = User;
        }
        field(2; "Value Posting"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; UserID)
        {
        }
    }

    fieldgroups
    {
    }
}
