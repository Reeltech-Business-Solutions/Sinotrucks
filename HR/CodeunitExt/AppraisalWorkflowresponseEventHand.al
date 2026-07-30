codeunit 50081 "App Workflow EventHandl.ext"
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
        APP: Record "HR Appraisal Goal Setting H";
        APP2: Record "HR Appraisal Goal Setting L";
    begin
        begin
            case RecRef.Number of

                DATABASE::"HR Appraisal Goal Setting H":
                    begin
                        RecRef.SetTable(APP);
                        APP.Status := APP.Status::Open;
                        APP.Modify;
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
        APP: Record "HR Appraisal Goal Setting H";

    begin

        case RecRef.Number of

            DATABASE::"HR Appraisal Goal Setting H":
                begin
                    RecRef.SetTable(APP);
                    APP."Status" := APP.Status::Approved;
                    APP.Modify;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        TargetRecRef: RecordRef;
        APP: Record "HR Appraisal Goal Setting H";

    begin
        case RecRef.Number of
            DATABASE::"HR Appraisal Goal Setting H":
                begin
                    RecRef.SetTable(APP);
                    APP.Status := APP.Status::"Pending Approval";
                    APP.Modify;
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkResponsePredeccorsToLibrary(ResponseFunctionName: Code[128])

    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "App Workflow EventHandling Ext";

    begin
        case ResponseFunctionName of
            workflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                        WorkflowEventHandlingCust.RunWorkflowOnSendAppraisalForApprovalsCodes())
                end;
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                        WorkflowEventHandlingCust.RunWorkflowOnSendAppraisalForApprovalsCodes());
                end;
            CancelAllApprovalRequestsCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                    workflowEventHandlingCust.RunWorkflowOnCanceledAppraisalsForApprovalCode());
                end;

            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                        WorkflowEventHandlingCust.RunWorkflowOnCanceledAppraisalsForApprovalCode());


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
        APP: Record "HR Appraisal Goal Setting H";

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

            DATABASE::"HR Appraisal Goal Setting H":
                begin
                    APP := Variant;

                    if APP.Status = APP.Status::Approved then
                        exit;
                    APP.Status := APP.Status::Approved;
                    APP.Modify(true);
                end else
                        Error(UnsupportedRecordTypeErr, RecRef.Caption)
        end;
    end;

    local procedure ReleaseDocumentCode(): Code[128]
    begin
        exit(UpperCase('OnReleaseDocument'))
    end;



}