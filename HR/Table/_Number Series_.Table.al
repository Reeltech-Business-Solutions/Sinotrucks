table 50102 "Number Series"
{
    Caption = 'Number Series';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Number Series "; Code[20])
        {
            Caption = 'Number Series ';
        }
        field(2; "Last No."; Integer)
        {
            Caption = 'Last No.';
            DataClassification = ToBeClassified;
        }
        field(3; "DocumentDate"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Number Series ")
        {
            Clustered = true;
        }
    }
}
