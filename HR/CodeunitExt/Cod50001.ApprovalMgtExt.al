codeunit 50001 "Approval Mgt. Ext"
{
    trigger OnRun()
    begin

    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling Ext.";

        NoWorkFlowEnabledErr: Label 'No approval workflow for this record type is Enabled';


    // Leave workflow begin
    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendLeaveForApproval(var LVE: Record "HR Leave Application")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckLeaveApprovalsWorkflowEnable(var LVE: Record "HR Leave Application"): Boolean
    begin
        if not IsLeaveDocApprovalsWorkflowEnable(LVE) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsLeaveDocApprovalsWorkflowEnable(var LVE: Record "HR Leave Application"): Boolean
    begin
        if LVE.Status <> LVE.Status::New then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(LVE, WorkflowEventHandling.RunWorkflowOnSendLeaveForApprovalCode()))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelLeaveForApproval(var LVE: Record "HR Leave Application")
    begin
    end;
    // Leave workflow end  Ridwan 1/18/2024

    // Leave acknowledgement workflow begin Tolu 9/4/24

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnSendLeaveAcknwForApproval(var LVEACKN: Record "HR Leave Acknowledgement")
    begin
    end;

    [Scope('Cloud')]
    procedure CheckLeaveAcknwApprovalsWorkflowEnable(var LVEACKN: Record "HR Leave Acknowledgement"): Boolean
    begin
        if not IsLeaveAcknwDocApprovalsWorkflowEnable(LVEACKN) then
            Error(NoworkflowEnabledErr);
        exit(true);
    end;

    [Scope('Cloud')]
    procedure IsLeaveAcknwDocApprovalsWorkflowEnable(var LVEACKN: Record "HR Leave Acknowledgement"): Boolean
    begin
        if LVEACKN.Status <> LVEACKN.Status::Pending then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(LVEACKN, WorkflowEventHandling.RunWorkflowOnSendLeaveAcknwForApprovalCode()))
    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelLeaveAcknwForApproval(var LVEACKN: Record "HR Leave Acknowledgement")
    begin
    end;

    // Leave Acknowledgement workflow end Tolu 9/4/24

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        DocType: Enum "Approval Document Type";
        HRLVE: Record "HR Leave Application";
        LeavAck: Record "HR Leave Acknowledgement";

    begin
        case RecRef.Number of
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(HRLVE);
                    ApprovalEntryArgument."Document No." := HRLVE."Application Code";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Leave;
                end;
        end;

        case RecRef.Number of
            DATABASE::"HR Leave Acknowledgement":
                begin
                    RecRef.SetTable(LeavAck);
                    ApprovalEntryArgument."Document No." := LeavAck."No.";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::LaveAckn;
                end;
        end;
    end;
}
