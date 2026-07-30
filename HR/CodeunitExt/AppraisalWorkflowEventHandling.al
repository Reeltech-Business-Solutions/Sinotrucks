codeunit 50016 "App Workflow EventHandling Ext"
{
    trigger OnRun()
    begin

    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";

        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        AppraisalRequestSendForApprovalEventDescTxt: Label 'An approval for appraisal document request is requested.';

        AppReqforAppraisalTxt: Label 'An approval request for appraisal document is approved.';

        RejectReqforAppraisalTxt: Label 'An approval request for appraisal document is rejected.';

        DelegateReqforAppraisalTxt: Label 'An approval request for appraisal document is delegated.';

        CancelReqforAppraisalRequestTxt: Label 'An approval request for appraisal document is Canceled.';




    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]

    local procedure onAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendAppraisalForApprovalsCodes, DATABASE::"HR Appraisal Goal Setting H", AppraisalRequestSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForAppraisalsCodes, DATABASE::"Approval Entry", AppReqforAppraisalTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForAppraisalsCodes, DATABASE::"Approval Entry", RejectReqforAppraisalTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowwOnDelegateApprovalRequestForAppraisalsCodes, DATABASE::"Approval Entry", DelegateReqforAppraisalTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledAppraisalsForApprovalCode, DATABASE::"HR Appraisal Goal Setting H", CancelReqforAppraisalRequestTxt, 0, FALSE);



    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin

        case EventFunctionName of
            RunWorkflowOnCanceledAppraisalsForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledAppraisalsForApprovalCode, RunWorkflowOnSendAppraisalForApprovalsCodes);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                begin
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendAppraisalForApprovalsCodes);
                end;

        end;


    end;

    //workflow for appraisal request
    [Scope('Cloud')]

    procedure RunWorkflowOnSendAppraisalForApprovalsCodes(): Code[128]
    begin
        exit(UpperCase(('RunWorkflowOnSendAppraisalForApprovals')))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50080, 'OnSendAppraisalsForApproval', '', false, false)]

    procedure RunWorkflowOnSendAppraisalsForApproval(var APP: Record "HR Appraisal Goal Setting H")
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendAppraisalForApprovalsCodes, APP);
    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnApproveApprovalRequestForAppraisalsCodes(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForAppraisals'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForAppraisal(var ApprovalEntry: Record 454)
    begin
        WorkFlowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForAppraisalsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");

    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnRejectApprovalRequestForAppraisalsCodes(): Code[128]

    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForAppraisals'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForAppraisals(var ApprovalEntry: Record 454)

    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForAppraisalsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]

    procedure RunWorkflowwOnDelegateApprovalRequestForAppraisalsCodes(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestAppraisals'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForAppraisal(var ApprovalEntry: Record 454)
    begin
        WorkFlowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowwOnDelegateApprovalRequestForAppraisalsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnCanceledAppraisalsForApprovalCode(): Code[128]
    begin
        Exit(UpperCase('RunWorkflowOnCanceledAppraisalsForApproval'))
    end;



    [EventSubscriber(ObjectType::Codeunit, 50080, 'OnCancelAppraisalForApproval', '', false, false)]

    procedure RunWorkflowOnCanceledAppraisalsForApproval(var APP: Record "HR Appraisal Goal Setting H")
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCanceledAppraisalsForApprovalCode, App);
    end;



}