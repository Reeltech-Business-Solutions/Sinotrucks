table 50186 "NRS LGA"
{
    Caption = 'NRS LGA';
    DataClassification = CustomerContent;
    LookupPageId = "NRS LGAs";
    DrillDownPageId = "NRS LGAs";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Name"; Text[100])
        {
            Caption = 'Name';
        }
        field(3; "State Code"; Code[10])
        {
            Caption = 'State Code';
            TableRelation = "NRS State".Code;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
        key(State; "State Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Name", "State Code")
        {
        }
    }
}
