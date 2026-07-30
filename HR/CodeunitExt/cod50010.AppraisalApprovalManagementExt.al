codeunit 50080 "Appraisal Approval Mgt. Ext"
{
    trigger OnRun()
    begin

    end;

    var
        WorkflowManagement: Codeunit "Workflow Management";

        WorkflowEventHandling: Codeunit "App Workflow EventHandling Ext";

        NoWorkFlowEnabledErr: Label 'No approval workflow for this record type is Enabled';

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]

    procedure OnSendAppraisalsForApproval(var APP: Record "HR Appraisal Goal Setting H")
    begin

    end;

    [Scope('Cloud')]

    procedure CheckAppraisalsApprovalsWorkflowEnable(var APP: Record "HR Appraisal Goal Setting H"): Boolean
    begin
        if not isAppraisalsDocApprovalsWorkflowEnable(App) then
            Error(NoWorkFlowEnabledErr);
        EXIT(true);
    end;

    [Scope('Cloud')]

    procedure isAppraisalsDocApprovalsWorkflowEnable(var APP: Record "HR Appraisal Goal Setting H"): Boolean
    begin
        if APP.Status <> App.Status::Open then
            exit(false);
        exit(WorkflowManagement.CanExecuteWorkflow(APP, WorkflowEventHandling.RunWorkflowOnSendAppraisalForApprovalsCodes()))

    end;

    [IntegrationEvent(false, false)]
    [Scope('Cloud')]
    procedure OnCancelAppraisalForApproval(var App: Record "HR Appraisal Goal Setting H")
    begin

    end;



    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]

    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        DocType: Enum "Approval Document Type";
        APP: Record "HR Appraisal Goal Setting H";

    begin
        case RecRef.Number of
            DATABASE::"HR Appraisal Goal Setting H":
                begin
                    RecRef.SetTable(APP);
                    ApprovalEntryArgument."Document No." := APP."Appraisal No";
                    ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Appraisal;
                end;
        end;
    end;
}