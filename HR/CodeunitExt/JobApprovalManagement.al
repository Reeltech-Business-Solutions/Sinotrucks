codeunit 50091 "Job Approval Mgt. Ext"
{
    trigger OnRun()
    begin

    end;

    var

        WorkflowManagement: Codeunit "Workflow Management";

        WorkflowEventHandling: Codeunit "Job Workflow EventHandling Ext";

        NoWorkFlowEnabledErr: Label 'No approval workflow for this record type is Enabled';

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]

    procedure OnSendJobsForApproval(var Job: Record "HR Jobs")
    begin

    end;

    [Scope('Cloud')]

    procedure CheckJobsApprovalsWorkflowEnable(var Job: Record "HR Jobs"): Boolean
    begin
        if not isJobsDocApprovalsWorkflowEnable(Job) then
            Error(NoWorkFlowEnabledErr);
        EXIT(true);
    end;

    [Scope('Cloud')]

    procedure isJobsDocApprovalsWorkflowEnable(var Job: Record "HR Jobs"): Boolean
    begin
        if Job.Status <> Job.Status::New then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(Job, WorkflowEventHandling.RunWorkflowOnSendJobForApprovalsCodes()))

    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelJobForApproval(var Job: Record "HR Jobs")
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]

    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        DocType: Enum "Approval Document Type";
        Job: Record "HR Jobs";

    begin
        case RecRef.Number of
            DATABASE::"HR Jobs":
                begin
                    RecRef.SetTable(Job);
                    ApprovalEntryArgument."Document No." := Job."Job ID";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Job;
                end;
        end;
    end;



}