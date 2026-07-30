codeunit 50038 "Req Workflow EventHandl.ext"
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
        Requisition: Record "HR Employee Requisitions";

    begin
        begin
            case RecRef.Number of

                DATABASE::"HR Employee Requisitions":
                    begin
                        RecRef.SetTable(Requisition);
                        Requisition.Status := Requisition.Status::New;
                        Requisition.Modify;
                        Handled := true;
                    end;


            end;
        end;
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
                end
            else
                ApprovalsMgmt.CancelApprovalRequestsForRecord(RecRef, WorkflowStepInstance);
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        Variant: Variant;
        TargetRecRef: RecordRef;
        Requisitions: Record "HR Employee Requisitions";

    begin

        case RecRef.Number of

            DATABASE::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Requisitions);
                    Requisitions."Status" := Requisitions.Status::Approved;
                    Requisitions.Modify;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        TargetRecRef: RecordRef;
        Requisition: Record "HR Employee Requisitions";

    begin
        case RecRef.Number of
            DATABASE::"HR Employee Requisitions":
                begin
                    RecRef.SetTable(Requisition);
                    Requisition.Status := Requisition.Status::"Pending Approval";
                    Requisition.Modify;
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkResponsePredeccorsToLibrary(ResponseFunctionName: Code[128])

    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "Req Workflow EventHandling Ext";

    begin
        case ResponseFunctionName of
            workflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                        WorkflowEventHandlingCust.RunWorkflowOnSendRequisitionForApprovalsCodes())
                end;
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                        WorkflowEventHandlingCust.RunWorkflowOnSendRequisitionForApprovalsCodes());
                end;
            CancelAllApprovalRequestsCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                    workflowEventHandlingCust.RunWorkflowOnCanceledRequisitionsForApprovalCode());
                end;

            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                        WorkflowEventHandlingCust.RunWorkflowOnCanceledRequisitionsForApprovalCode());


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
        Requisition: Record "HR Employee Requisitions";

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

            DATABASE::"HR Employee Requisitions":
                begin
                    Requisition := Variant;

                    if Requisition.Status = Requisition.Status::Approved then
                        exit;
                    Requisition.Status := Requisition.Status::Approved;
                    Requisition.Modify(true);
                end else
                        Error(UnsupportedRecordTypeErr, RecRef.Caption)
        end;
    end;

    local procedure ReleaseDocumentCode(): Code[128]
    begin
        exit(UpperCase('OnReleaseDocument'))
    end;

}