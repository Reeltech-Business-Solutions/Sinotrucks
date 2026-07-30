table 54622 "HR Leave Family Groups"
{
    Caption = 'HR Leave Family Groups';
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
        field(3; "Max Employees On Leave"; Integer)
        {
            Caption = 'Max Employees On Leave';
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
