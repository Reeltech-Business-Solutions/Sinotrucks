table 54614 "HR Transport Requisition"
{
    Caption = 'HR Transport Requisition';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Application Code"; Text[50])
        {
            Caption = 'Application Code';
        }
        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
        }
        field(3; "Job Title"; Code[50])
        {
            Caption = 'Job Title';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "Days Applied"; Code[10])
        {
            Caption = 'Days Applied';
        }
        field(6; "Time of Trip"; Time)
        {
            Caption = 'Time of Trip';
        }
        field(7; "From Destination"; Text[50])
        {
            Caption = 'From Destination';
        }
        field(8; "To Destination"; Text[50])
        {
            Caption = 'From Destination';
        }
        field(9; "Return Date"; DATE)
        {
            Caption = 'Return Date';
        }
        field(10; "Purpose of Trip"; Text[50])
        {
            Caption = 'Purpose Of Trip';
        }
        field(11; "Supervisor"; Text[50])
        {
            Caption = 'Supervisor';
        }
        field(12; "Supervisor Email"; Text[50])
        {
            Caption = 'Supervisor Email';
        }
        field(13; "Status"; Enum StatusEnum)
        {
            Caption = 'Status';
        }
        field(14; "Comment"; Text[50])
        {
            Caption = 'Comment';
        }
        field(15; "Names"; Text[50])
        {
            caption = 'Names';
        }
        field(16; "Selected"; Boolean)
        {
            caption = 'Selected';
        }
        field(17; "User ID"; Code[50])
        {
            caption = 'User ID';
        }
        field(18; "Description"; Code[50])
        {
            caption = 'Description';
        }
        field(19; "Responsibility Center"; Code[50])
        {
            caption = 'Responsibility Center';
        }
        field(20; "Transport Type"; Code[50])
        {
            caption = 'Transport Type';
        }
        field(21; "Pickup Point"; Code[50])
        {
            caption = 'Pickup Point';
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
