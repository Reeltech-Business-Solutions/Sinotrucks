codeunit 50034 "Job Workflow EventHandling Ext"
{
    trigger OnRun()
    begin

    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";

        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        JobRequestSendForApprovalEventDescTxt: Label 'An approval for Job document request is requested.';

        AppReqforJobTxt: Label 'An approval request for Job document is approved.';

        RejectReqforJobTxt: Label 'An approval request for Job document is rejected.';

        DelegateReqforJobTxt: Label 'An approval request for Job document is delegated.';

        CancelReqforJobRequestTxt: Label 'An approval request for Job document is Canceled.';

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]

    local procedure onAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendJobForApprovalsCodes, DATABASE::"HR Jobs", JobRequestSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForJobsCodes, DATABASE::"Approval Entry", AppReqforJobTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForJobsCodes, DATABASE::"Approval Entry", RejectReqforJobTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowwOnDelegateApprovalRequestForJobsCodes, DATABASE::"Approval Entry", DelegateReqforJobTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledJobsForApprovalCode, DATABASE::"HR Jobs", CancelReqforJobRequestTxt, 0, FALSE);



    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin

        case EventFunctionName of
            RunWorkflowOnCanceledJobsForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledJobsForApprovalCode, RunWorkflowOnSendJobForApprovalsCodes);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                begin
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendJobForApprovalsCodes);
                end;

        end;


    end;

    //workflow for Job request
    [Scope('Cloud')]

    procedure RunWorkflowOnSendJobForApprovalsCodes(): Code[128]
    begin
        exit(UpperCase(('RunWorkflowOnSendJobForApprovals')))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50091, 'OnSendJobsForApproval', '', false, false)]

    procedure RunWorkflowOnSendJobsForApproval(var Job: Record "HR Jobs")
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendJobForApprovalsCodes, Job);
    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnApproveApprovalRequestForJobsCodes(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForJobs'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForJob(var ApprovalEntry: Record 454)
    begin
        WorkFlowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForJobsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");

    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnRejectApprovalRequestForJobsCodes(): Code[128]

    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForJobs'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForJobs(var ApprovalEntry: Record 454)

    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForJobsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]

    procedure RunWorkflowwOnDelegateApprovalRequestForJobsCodes(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestJobs'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForJob(var ApprovalEntry: Record 454)
    begin
        WorkFlowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowwOnDelegateApprovalRequestForJobsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnCanceledJobsForApprovalCode(): Code[128]
    begin
        Exit(UpperCase('RunWorkflowOnCanceledJobsForApproval'))
    end;


    [EventSubscriber(ObjectType::Codeunit, 50091, 'OnCancelJobForApproval', '', false, false)]

    procedure RunWorkflowOnCanceledJobsForApproval(var Job: Record "HR Jobs")
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCanceledJobsForApprovalCode, Job);
    end;
}