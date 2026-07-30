page 54420 "HR Confirmation Supervisor"
{
    Caption = 'HR Confirmation Supervisor';
    CardPageID = "HR Confirmation Header";
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Employee Confirmation";
    SourceTableView = WHERE(Status=CONST("Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Date of Employment"; Rec."Date of Employment")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Return to Appraisee")
            {
                Caption = 'Return to Appraisee';
                Image = Return;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    IF CONFIRM('Do you want to send this Appraisal Form to the Appraisee?', FALSE) = TRUE THEN BEGIN
                        rec.Status:=rec.Status::New;
                        rec.MODIFY;
                        MESSAGE('%1', 'Process Completed')END;
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        HREmployeeConfirmation.SETRANGE(HREmployeeConfirmation.Supervisor, USERID);
        IF HREmployeeConfirmation.FINDFIRST THEN BEGIN
            rec.FILTERGROUP(2);
            rec.SETRANGE(Supervisor, USERID);
            rec.FILTERGROUP(0);
        END
        ELSE
        BEGIN
            HREmployeeConfirmation.SETRANGE(HREmployeeConfirmation."Second Line Supervisor", USERID);
            rec.FILTERGROUP(2);
            rec.SETRANGE("Second Line Supervisor", USERID);
            rec.FILTERGROUP(0);
        END /*
        HREmployeeConfirmation.SETRANGE(HREmployeeConfirmation."Second Line Supervisor",USERID);
        IF HREmployeeConfirmation.FINDFIRST THEN
         SETFILTER("Second Line Supervisor",USERID)
        ELSE BEGIN
        HREmployeeConfirmation.SETRANGE(HREmployeeConfirmation.Supervisor,USERID);
        IF HREmployeeConfirmation.FINDFIRST THEN
         SETFILTER(Supervisor,USERID)
        ELSE
        SETRANGE(Supervisor,'');
        //HREmployees.SETRANGE(HREmployees."User ID",USERID)
        SETFILTER(Supervisor,USERID);
        END;
        
          FILTERGROUP(2);
          SETRANGE(Supervisor,USERID);
          FILTERGROUP(0);
         */
    end;
    var HREmployeeConfirmation: Record "HR Employee Confirmation";
    HREmployees: Record "HR Employees";
}
