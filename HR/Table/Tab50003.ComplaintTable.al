table 50003 "Complaint Table"
{
    Caption = 'Complaint Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'No.';


        }
        field(2; "Date"; Text[50])
        {
            Caption = 'Date';
        }
        field(3; "First Name"; Text[50])
        {
            // Caption = 'First Name';
        }
        field(4; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
        }
        field(5; "Last name "; Text[50])
        {
            Caption = 'Last name ';
        }
        field(6; Designation; Text[50])
        {
            Caption = 'Designation';
        }
        field(7; "Phone Number "; Text[50])
        {
            Caption = 'Phone Number ';
        }
        field(8; Email; Text[50])
        {
            Caption = 'Email';
        }
        field(9; Supervisor; Boolean)
        {
            Caption = 'Supervisor';
        }
        field(10; "Supervisor Name"; Text[50])
        {
            Caption = 'Supervisor Name';
        }
        field(11; "Date of Incident"; Date)
        {
            Caption = 'Date of Incident';
        }
        field(12; "Location of Incident"; Text[50])
        {
            Caption = 'Location of Incident';
        }
        field(13; "Description of Incedent"; Text[50])
        {
            Caption = 'Description of Incedent';
        }
        field(14; "Incident Withness 1"; Text[50])
        {
            Caption = 'Incident Withness 1';
        }
        field(15; "Incident Witness 2"; Text[50])
        {
            Caption = 'Incident Witness 2';
        }
        field(16; "Concerns previously raised"; Boolean)
        {
            Caption = 'Concerns previously raised';
        }
        field(17; "Additional Comments"; Text[100])
        {
            Caption = 'Additional Comments';
        }

    }
    keys
    {
        key(PK; "Date")
        {
            Clustered = true;
        }
    }
}