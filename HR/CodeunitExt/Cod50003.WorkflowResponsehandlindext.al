codeunit 50083 "Workflow Response handlind ext"
{
    trigger OnRun()
    begin

    end;

    var
        UnsupportedRecordTypeErr: Label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnOpenDocument', '', false, false)]
    local procedure OnOpenDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        LVE: Record "HR Leave Application";
        LVEACKNW: record "HR Leave Acknowledgement";

    begin
        begin
            case RecRef.Number of
                DATABASE::"HR Leave Application":
                    begin
                        RecRef.SetTable(LVE);
                        LVE.Status := LVE.Status::NEW;
                        LVE.Modify;
                        Handled := true;
                    end;

                DATABASE::"HR Leave Acknowledgement":
                    begin
                        RecRef.SetTable(LVEACKNW);
                        LVEACKNW.Status := LVEACKNW.Status::Pending;
                        LVEACKNW.Modify;
                        Handled := true;
                    end;
            end;
        end
    end;

    local procedure CancelAllApprovalRequestsCode(): Code[128]
    begin
        exit(UpperCase('CancelAllApprovalRequests'))
    end;

    local procedure CancelAllApprovalRequests(Variant: Variant; WorkflowStepInstance: Record "Workflow Step Instance")
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        RecRef: RecordRef;
        ApprovalEntry: Record "Approval Entry";
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    RecRef.Get(ApprovalEntry."Record ID to Approve");
                    CancelAllApprovalRequests(RecRef, WorkflowStepInstance);
                end;
            else
                ApprovalsMgmt.CancelApprovalRequestsForRecord(RecRef, WorkflowStepInstance);
        end
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        Variant: Variant;
        TargetRecRef: RecordRef;
        LVE: Record "HR Leave Application";
        LVEACKNW: Record "HR Leave Acknowledgement";

    begin

        case RecRef.Number of

            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(LVE);
                    // LVE.Status := LVE.Status::"Approved";
                    LVE.Validate(LVE.Status, LVE.Status::Approved);
                    LVE.Modify;
                    Handled := true;
                end;

            DATABASE::"HR Leave Acknowledgement":
                begin
                    RecRef.SetTable(LVEACKNW);
                    LVEACKNW.Status := LVEACKNW.Status::Approved;
                    LVEACKNW.Modify;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        TargetRecRef: RecordRef;
        LVE: Record "HR Leave Application";
        LVEACKNW: Record "HR Leave Acknowledgement";
    BEGIN
        case RecRef.Number of
            DATABASE::"HR Leave Application":
                begin
                    RecRef.SetTable(LVE);
                    LVE.Status := LVE.Status::"Pending Approval";
                    LVE.Modify;
                    IsHandled := true;
                end;

            DATABASE::"HR Leave Acknowledgement":
                begin
                    RecRef.SetTable(LVEACKNW);
                    LVEACKNW.Status := LVEACKNW.Status::"Pending Approval";
                    LVEACKNW.Modify;
                    IsHandled := true;
                end;
        end;
    END;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "Workflow Event Handling Ext.";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    //Leave Application
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                             WorkflowEventHandlingCust.RunWorkflowOnSendLeaveForApprovalCode());

                    // Leave Acknowledgement
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                   WorkflowEventHandlingCust.RunWorkflowOnSendLeaveAcknwForApprovalCode());

                end;
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:

                begin
                    //Leave Application
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                             WorkflowEventHandlingCust.RunWorkflowOnSendLeaveForApprovalCode());

                    // Leave Acknowledgement
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                   WorkflowEventHandlingCust.RunWorkflowOnSendLeaveAcknwForApprovalCode());

                end;
            CancelAllApprovalRequestsCode:
                begin
                    // HR Leave
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledLeaveForApprovalCode());

                    // Leave Acknowledgement
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                  WorkflowEventHandlingCust.RunWorkflowOnSendLeaveAcknwForApprovalCode());

                end;
            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    // Leave Application
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledLeaveForApprovalCode());

                    // Leave Acknowledgement
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledLeaveAcknwForApprovalCode());

                end;
        end;
    end;


    local procedure ReleaseDocument(var Variant: Variant)
    var
        ApprovalEntry: Record "Approval Entry";
        ReleasePurchaseDocument: Codeunit "Release Purchase Document";
        ReleaseSalesDocument: Codeunit "Release Sales Document";
        ReleaseIncomingDocument: Codeunit "Release Incoming Document";
        RecRef: RecordRef;
        TargetRecRef: RecordRef;
        LVE: Record "HR Leave Application";
        LVEACKNW: Record "HR Leave Acknowledgement";

    begin
        RecRef.GetTable(Variant);

        case RecRef.Number of
            DATABASE::"Approval Entry":
                begin
                    ApprovalEntry := Variant;
                    TargetRecRef.Get(ApprovalEntry."Record ID to Approve");
                    Variant := TargetRecRef;
                    ReleaseDocument(Variant);
                end;

            DATABASE::"HR Leave Application":
                begin
                    LVE := Variant;
                    //with VoucherHeader do begin
                    if LVE.Status = LVE.Status::Approved then
                        exit;
                    //  LVE.Status := LVE.Status::Approved;
                    LVE.Validate(LVE.Status, LVE.Status::Approved);
                    LVE.Modify(true);

                end;

            DATABASE::"HR Leave Acknowledgement":
                begin
                    LVEACKNW := Variant;
                    if LVEACKNW.Status = LVEACKNW.Status::Approved then
                        exit;
                    LVEACKNW.Status := LVEACKNW.Status::Approved;
                    LVEACKNW.Modify(true);
                end;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    local procedure ReleaseDocumentCode(): Code[128]
    begin
        exit(UpperCase('OnReleaseDocument'))
    end;



}
