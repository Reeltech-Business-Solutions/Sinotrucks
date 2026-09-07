table 50185 "NRS State"
{
    Caption = 'NRS State';
    DataClassification = CustomerContent;
    LookupPageId = "NRS States";
    DrillDownPageId = "NRS States";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Name")
        {
        }
    }
}
