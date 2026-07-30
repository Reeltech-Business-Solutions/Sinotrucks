table 54619 "HR Leave Attachments"
{
    Caption = 'HR Leave Attachments';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Text[50])
        {
            Caption = '';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
