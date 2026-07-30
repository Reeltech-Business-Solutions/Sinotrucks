codeunit 50039 "Req Approval Mgt. Ext"
{
    trigger OnRun()
    begin

    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";

        WorkflowEventHandling: Codeunit "Req Workflow EventHandling Ext";

        NoWorkFlowEnabledErr: Label 'No approval workflow for this record type is Enabled';

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]

    procedure OnSendRequisitionsForApproval(var Requisition: Record "HR Employee Requisitions")
    begin

    end;

    [Scope('Cloud')]

    procedure CheckRequisitionsApprovalsWorkflowEnable(var Requisition: Record "HR Employee Requisitions"): Boolean
    begin
        if not isRequisitionsDocApprovalsWorkflowEnable(Requisition) then
            Error(NoWorkFlowEnabledErr);
        EXIT(true);
    end;

    [Scope('Cloud')]

    procedure isRequisitionsDocApprovalsWorkflowEnable(var Requisition: Record "HR Employee Requisitions"): Boolean
    begin
        if Requisition.Status <> Requisition.Status::New then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(Requisition, WorkflowEventHandling.RunWorkflowOnSendRequisitionForApprovalsCodes()))

    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelRequisitionForApproval(var Requisition: Record "HR Employee Requisitions")
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]

    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        DocType: Enum "Approval Document Type";
        Requisition: Record "HR Employee Requisitions";

    begin
        case RecRef.Number of
            DATABASE::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Requisition);
                    ApprovalEntryArgument."Document No." := Requisition."Job ID";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Requisition;
                end;
        end;
    end;



}