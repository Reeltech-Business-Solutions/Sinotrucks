codeunit 50101 "HR Leave Application"
{
    TableNo = "HR Leave Application";

    procedure CreateLeaveEntry(EmployeeID: Code[20]; LeaveStartDate: Date; LeaveEndDate: Date)
    var
        LeaveEntryRec: Record "HR Leave Application";
    begin
        // Initialize the record
        LeaveEntryRec.Init();
        // Assign values to fields
        //LeaveEntryRec."Employee ID" := EmployeeID;
        LeaveEntryRec."Start Date":=LeaveStartDate;
        LeaveEntryRec."Return Date":=LeaveEndDate;
        // Insert the record
        LeaveEntryRec.Insert(true); // 'true' indicates that the record should be committed immediately
    // Optionally, provide feedback to the user
    //Message('Leave entry created for %1 from %2 to %3.', LeaveEntryRec."Employee ID", LeaveEntryRec."Start Date", LeaveEntryRec."Return Date");
    end;
    trigger OnRun()
    var
        EmployeeID: Code[20];
        LeaveStartDate: Date;
        LeaveEndDate: Date;
    begin
        // Initialize parameters (replace with actual values)
        EmployeeID:='EMP001';
        LeaveStartDate:=TODAY;
        LeaveEndDate:=TODAY + 5;
        // Call the create leave entry procedure
        CreateLeaveEntry(EmployeeID, LeaveStartDate, LeaveEndDate);
    end;
}
