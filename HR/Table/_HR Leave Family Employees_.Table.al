table 54623 "HR Leave Family Employees"
{
    Caption = 'HR Leave Family Employees';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee No"; Code[50])
        {
            Caption = 'Employee No';
        }
        field(2; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(3; "Family"; Code[50])
        {
            Caption = 'Family';
        }
        field(4; "Max Employees On Leave"; Code[20])
        {
            Caption = 'Max Employees on Leave';
        }
    }
    keys
    {
        key(PK; "Employee No")
        {
            Clustered = true;
        }
    }
}
