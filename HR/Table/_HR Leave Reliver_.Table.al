table 54767 "HR Leave Reliver"
{
    fields
    {
        field(1; "Application No."; Code[50])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Reliver No."; Code[20])
        {
            TableRelation = "HR Employees";

            trigger OnValidate()
            begin
                if "Reliver No." = "Employee No" then Error('you cannot pick self as a reliver');
                if HrEmp.Get("Reliver No.") then "Reliver Name" := HrEmp."Last Name" + ' ' + HrEmp."First Name" + ' ' + HrEmp."Middle Name";
                // if HRLeaveApplication.Get(Rec."Reliver No.") then
                //     Rec."Reliver No." := HRLeaveApplication."Employee Reliver";
                // rec.Modify();
            end;
        }
        field(4; "Reliver Name"; Text[100])
        {
        }
        field(5; "Employee No"; Code[20])
        {
        }
        field(6; "Department Code"; Code[20])
        {
        }
        field(7; "Location Code"; Code[20])
        {
        }
        field(50101; "Header Id"; Guid)
        {
            TableRelation = "HR Leave Reliver".SystemId;
        }
    }
    keys
    {
        key(Key1; "Application No.", "Line No.", "Employee No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
    var
        HrEmp: Record "HR Employees";
        HRLeaveApplication: Record "HR Leave Application";
}
