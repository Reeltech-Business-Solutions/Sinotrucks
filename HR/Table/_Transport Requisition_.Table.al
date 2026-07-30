table 50199 "Transport Requisition"
{
    Caption = 'Transport Requisition';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Application Code"; Code[50])
        {
            Caption = 'Application Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Supervisor Email"; Text[50])
        {
            Caption = 'Supervisor Email';
        }
        field(4; "Job Title"; Text[50])
        {
            Caption = 'Job Title';
        }
        field(5; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(6; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
        }
        field(7; Supervisor; Text[50])
        {
            Caption = 'Supervisor';
        }
        field(8; "Responsibility Center"; Text[50])
        {
            Caption = 'Responsibility Center';
        }
        field(9; Comment; Text[50])
        {
            Caption = 'Comment';
        }
        field(10; "Purpose of Trip"; Text[50])
        {
            Caption = 'Purpose of Trip';
        }
        field(11; "Transport type"; Text[50])
        {
            Caption = 'Transport type';
        }
        field(12; "Time of Trip"; Text[50])
        {
            Caption = 'Time of Trip';
        }
        field(13; "Pickup Point"; Text[50])
        {
            Caption = 'Pickup Point';
        }
        field(14; "From Destination"; Text[50])
        {
            Caption = 'From Destination';
        }
        field(15; "To Destination"; Text[50])
        {
            Caption = 'To Destination';
        }
    }
    keys
    {
        key(PK; "Application Code")
        {
            Clustered = true;
        }
    }
}
