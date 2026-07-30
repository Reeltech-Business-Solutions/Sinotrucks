codeunit 50088 "Employee Approval Mgt. Ext."
{
    trigger OnRun()
    begin

    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Emp Workflow EventHandlng Ext";

        NoWorkFlowEnabledErr: Label 'No approval workflow for this record type is Enabled';


    // Employee workflow begin
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendEmployeeForApproval(var EMP: Record "HR Employees")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckEmployeeApprovalsWorkflowEnable(var EMP: Record "HR Employees"): Boolean
    begin
        if not IsEmployeeDocApprovalsWorkflowEnable(EMP) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsEmployeeDocApprovalsWorkflowEnable(var EMP: Record "HR Employees"): Boolean
    begin
        if EMP."Approval Status" <> EMP."Approval Status"::New then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(EMP, WorkflowEventHandling.RunWorkflowOnSendEmployeeForApprovalCode()))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelEmployeeForApproval(var EMP: Record "HR Employees")
    begin
    end;
    // Employee workflow end  Ridwan 1/18/2024
    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        DocType: Enum "Approval Document Type";
        HREMP: Record "HR Employees";

    begin
        case RecRef.Number of
            DATABASE::"HR Employees":
                begin
                    RecRef.SetTable(HREMP);
                    ApprovalEntryArgument."Document No." := HREMP."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Employee;
                end;
        end;
    end;
}
