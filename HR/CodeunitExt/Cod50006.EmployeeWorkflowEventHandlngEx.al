codeunit 50086 "Emp Workflow EventHandlng Ext"
{

    trigger OnRun()
    begin

    end;

    var

        WorkFlowManagement: Codeunit "Workflow Management";
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        EmployeeRequestSendForApprovalEventDescTxt: Label 'An Approval for HR Employee Request is requested.';

        AppReqforEmployeeTxt: Label 'An approval request for Employee is approved.';

        RejectReqforEmployeeTxt: Label 'An approval request for Employee is rejected.';

        DelegateReqforEmployeeTxt: Label 'An approval request for Employee is delegated.';

        CancelReqforEmployeeRequestTxt: Label 'An approval request for Employee is Canceled.';

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        // LeaveRequest
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnSendEmployeeForApprovalCode, DATABASE::"HR Employees", EmployeeRequestSendForApprovalEventDescTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnApproveApprovalRequestForEmployeeCode, DATABASE::"Approval Entry", AppReqforEmployeeTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnRejectApprovalRequestForEmployeeCode, DATABASE::"Approval Entry", RejectReqforEmployeeTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnDelegateApprovalRequestForEmployeeCode, DATABASE::"Approval Entry", DelegateReqforEmployeeTxt, 0, FALSE);
        WorkflowEventHandling.AddEventToLibrary(RunWorkflowOnCanceledEmployeeForApprovalCode, DATABASE::"HR Employees", CancelReqforEmployeeRequestTxt, 0, FALSE);
    end;

    [EventSubscriber(ObjectType::Codeunit, 1520, 'OnAddWorkflowEventPredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventPredecessorsToLibrary(EventFunctionName: Code[128])
    begin
        case EventFunctionName of
            //Employee Workflow
            RunWorkflowOnCanceledEmployeeForApprovalCode:
                WorkflowEventHandling.AddEventPredecessor(RunWorkflowOnCanceledEmployeeForApprovalCode, RunWorkflowOnSendEmployeeForApprovalCode);

            WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode:
                begin
                    WorkflowEventHandling.AddEventPredecessor(WorkflowEventHandling.RunWorkflowOnApproveApprovalRequestCode, RunWorkflowOnSendEmployeeForApprovalCode);
                end;
        end
    end;
    //workflow for Employee Request
    [Scope('Cloud')]
    procedure RunWorkflowOnSendEmployeeForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendEmployeeForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50088, 'OnSendEmployeeForApproval', '', false, false)]
    procedure RunWorkflowOnSendEmployeeForApproval(var EMP: Record "HR Employees")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnSendEmployeeForApprovalCode, EMP);
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnApproveApprovalRequestForEmployeeCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnApproveApprovalRequestForEmployee'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnApproveApprovalRequest', '', false, false)]

    procedure RunWorkflowOnApproveApprovalRequestForEmployee(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnApproveApprovalRequestForEmployeeCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnRejectApprovalRequestForEmployeeCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnRejectApprovalRequestForEmployee'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnRejectApprovalRequest', '', false, false)]

    procedure RunWorkflowOnRejectApprovalRequestForEmployee(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnRejectApprovalRequestForEmployeeCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnDelegateApprovalRequestForEmployeeCode(): Code[128]
    begin
        EXIT(Uppercase('RunWorkflowOnDelegateApprovalRequestEmployee'));
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnDelegateApprovalRequest', '', false, false)]

    procedure RunWorkflowOnDelegateApprovalRequestForEmployee(var ApprovalEntry: Record 454)
    begin
        WorkflowManagement.HandleEventOnKnownWorkflowInstance(RunWorkflowOnDelegateApprovalRequestForEmployeeCode, ApprovalEntry, ApprovalEntry."Workflow Step Instance ID");
    end;

    [Scope('Cloud')]
    procedure RunWorkflowOnCanceledEmployeeForApprovalCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnCanceledEmployeeForApproval'))
    end;

    [EventSubscriber(ObjectType::Codeunit, 50088, 'OnCancelEmployeeForApproval', '', false, false)]
    procedure RunWorkflowOnCanceledEmployeeForApproval(var EMP: Record "HR Employees")
    begin
        WorkflowManagement.HandleEvent(RunWorkflowOnCanceledEmployeeForApprovalCode, EMP);
    end;
}



