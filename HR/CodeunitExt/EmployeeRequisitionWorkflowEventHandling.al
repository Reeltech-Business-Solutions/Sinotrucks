codeunit 50037 "Req Workflow EventHandling Ext"
{
    trigger OnRun()
    begin

    end;

    var
        WorkFlowManagement: Codeunit "Workflow Management";

        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        RequisitionRequestSendForApprovalEventDescTxt: Label 'An approval for Requisition document request is requested.';

        AppReqforRequisitionTxt: Label 'An approval request for Requisition document is approved.';

        RejectReqforRequisitionTxt: Label 'An approval request for Requisition document is rejected.';

        DelegateReqforRequisitionTxt: Label 'An approval request for Requisition document is delegated.';

        CancelReqforRequisitionRequestTxt: Label 'An approval request for Requisition document is Canceled.';


    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]

    local procedure onAddWorkflowEventsToLibrary()
    begin
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendRequisitionForApprovalsCodes, DATABASE::"HR Employee Requisitions", RequisitionRequestSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForRequisitionsCodes, DATABASE::"Approval Entry", AppReqforRequisitionTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForRequisitionsCodes, DATABASE::"Approval Entry", RejectReqforRequisitionTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowwOnDelegateApprovalRequestForRequisitionsCodes, DATABASE::"Approval Entry", DelegateReqforRequisitionTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledRequisitionsForApprovalCode, DATABASE::"HR Employee Requisitions", CancelReqforRequisitionRequestTxt, 0, FALSE);



    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin

        case EventFunctionName of
            RunWorkflowOnCanceledRequisitionsForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledRequisitionsForApprovalCode, RunWorkflowOnSendRequisitionForApprovalsCodes);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                begin
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendRequisitionForApprovalsCodes);
                end;

        end;


    end;

    //workflow for Requisition request
    [Scope('Cloud')]

    procedure RunWorkflowOnSendRequisitionForApprovalsCodes(): Code[128]
    begin
        exit(UpperCase(('RunWorkflowOnSendRequisitionForApprovals')))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50039, 'OnSendRequisitionsForApproval', '', false, false)]

    procedure RunWorkflowOnSendRequisitionsForApproval(var Requisition: Record "HR Employee Requisitions")
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnSendRequisitionForApprovalsCodes, Requisition);
    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnApproveApprovalRequestForRequisitionsCodes(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForRequisitions'));
    end;


    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForRequisition(var ApprovalEntry: Record 454)
    begin
        WorkFlowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForRequisitionsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");

    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnRejectApprovalRequestForRequisitionsCodes(): Code[128]

    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForRequisitions'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForRequisitions(var ApprovalEntry: Record 454)

    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForRequisitionsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]

    procedure RunWorkflowwOnDelegateApprovalRequestForRequisitionsCodes(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestRequisitions'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForRequisition(var ApprovalEntry: Record 454)
    begin
        WorkFlowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowwOnDelegateApprovalRequestForRequisitionsCodes, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]

    procedure RunWorkflowOnCanceledRequisitionsForApprovalCode(): Code[128]
    begin
        Exit(UpperCase('RunWorkflowOnCanceledRequisitionsForApproval'))
    end;


    [EventSubscriber(ObjectType::Codeunit, 50039, 'OnCancelRequisitionForApproval', '', false, false)]

    procedure RunWorkflowOnCanceledRequisitionsForApproval(var Requisition: Record "HR Employee Requisitions")
    begin
        WorkFlowManagement.HandleEvent(RunWorkflowOnCanceledRequisitionsForApprovalCode, Requisition);
    end;

}