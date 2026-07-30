codeunit 50082 "Workflow Event Handling Ext."
{
    trigger OnRun()
    begin

    end;

    var

        WorkFlowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        LeaveRequestSendForApprovalEventDescTxt: Label 'An Approval for HR Leave Request is requested.';

        AppReqforLeaveTxt: Label 'An approval request for Leave is approved.';

        RejectReqforLeaveTxt: Label 'An approval request for Leave is rejected.';

        DelegateReqforLeaveTxt: Label 'An approval request for Leave is delegated.';

        CancelReqforLeaveRequestTxt: Label 'An approval request for HR Leave Request is Canceled.';

        // Leave Acknowledgement

        LeaveAcknwRequestSendForApprovalEventDescTxt: Label 'An Approval for HR Leave Acknowledgement Request is requested.';

        AppReqforLeaveAcknwTxt: Label 'An approval request for Leave Acknowledgement is approved.';

        RejectReqforLeaveAcknwTxt: Label 'An approval request for Leave Acknowledgement is rejected.';

        DelegateReqforLeaveAcknwTxt: Label 'An approval request for Leave Acknowledgement is delegated.';

        CancelReqforLeaveAcknwRequestTxt: Label 'An approval request for HR Leave Acknowledgement Request is Canceled.';

    // Leave Acknowledgement



    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        // LeaveRequest
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLeaveForApprovalCode, DATABASE::"HR Leave Application", LeaveRequestSendForApprovalEventDescTxt, 0, FALSE);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForLeaveCode, DATABASE::"Approval Entry", AppReqforLeaveTxt, 0, FALSE);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForLeaveCode, DATABASE::"Approval Entry", RejectReqforLeaveTxt, 0, FALSE);
        // WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestForLeaveCode, DATABASE::"Approval Entry", DelegateReqforLeaveTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledLeaveForApprovalCode, DATABASE::"HR Leave Application", CancelReqforLeaveRequestTxt, 0, FALSE);

        // Leave Acknowledgement
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendLeaveAcknwForApprovalCode(), DATABASE::"HR Leave Acknowledgement", LeaveAcknwRequestSendForApprovalEventDescTxt, 0, false);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledLeaveAcknwForApprovalCode(), DATABASE::"HR Leave Acknowledgement", CancelReqforLeaveAcknwRequestTxt, 0, false);

    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            //Leave Workflow
            RunWorkflowOnCanceledLeaveForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledLeaveForApprovalCode, RunWorkflowOnSendLeaveForApprovalCode);

            // Leave Acknowledgement Workflow
            RunWorkflowOnCanceledLeaveAcknwForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledLeaveAcknwForApprovalCode, RunWorkflowOnSendLeaveAcknwForApprovalCode);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                begin
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendLeaveForApprovalCode);
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendLeaveAcknwForApprovalCode);
                end;
        end
    end;

    //workflow for Leave Request
    [Scope('Cloud')]
    procedure RunWorkflowOnSendLeaveForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendLeaveForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50001, 'OnSendLeaveForApproval', '', false, false)]
    procedure RunWorkflowOnSendLeaveForApproval(var LVE: Record "HR Leave Application")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveForApprovalCode, LVE);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForLeaveCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForLeave'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForLeave(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForLeaveCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForLeaveCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForLeave'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForLeave(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForLeaveCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForLeaveCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestLeave'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForLeave(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForLeaveCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledLeaveForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledLeaveForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50001, 'OnCancelLeaveForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledLeaveForApproval(var LVE: Record "HR Leave Application")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledLeaveForApprovalCode, LVE);
    end;

    //workflow for Leave Acknowledgement Request
    [Scope('Cloud')]
    procedure RunWorkflowOnSendLeaveAcknwForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendLeaveAcknwForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50001, 'OnSendLeaveAcknwForApproval', '', false, false)]
    procedure RunWorkflowOnSendLeaveAcknwForApproval(var LVEACKN: Record "HR Leave Acknowledgement")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendLeaveAcknwForApprovalCode, LVEACKN);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForLeaveAcknwCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForLeaveAcknw'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForLeaveAcknw(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForLeaveAcknwCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForLeaveAcknwCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForLeaveAcknw'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForLeaveAcknw(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForLeaveAcknwCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForLeaveAcknwCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestLeaveAcknw'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForLeaveAcknw(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForLeaveAcknwCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledLeaveAcknwForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledLeaveAcknwForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50001, 'OnCancelLeaveAcknwForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledLeaveAcknwForApproval(var LVEACKN: Record "HR Leave Acknowledgement")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledLeaveAcknwForApprovalCode, LVEACKN);
    end;

}
