table 54557 prAssignEmployeeLoan
{
    Caption = 'prAssignEmployeeLoan';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            Caption = 'Employee Code';
        }
        field(2; "Transaction Code"; Code[50])
        {
            Caption = 'Transaction Code';
        }
        field(3; "Payroll Period"; Date)
        {
            Caption = 'Payroll Period';
        }
        field(4; "Transaction Name"; Text[50])
        {
            Caption = 'Transaction Name';
        }
        field(5; "Amount"; Integer)
        {
            Caption = 'Amount';
        }
        field(6; "Balance"; Integer)
        {
            Caption = 'Balance';
        }
        field(7; "#of Repayments"; Integer)
        {
            Caption = '% of Repayments';
        }
        field(8; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(9; "End Date"; Date)
        {
            Caption = 'End Date';
        }
    }
    keys
    {
        key(PK; "Employee Code")
        {
            Clustered = true;
        }
    }
}
