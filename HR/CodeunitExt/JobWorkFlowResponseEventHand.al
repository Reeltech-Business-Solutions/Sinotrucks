codeunit 50032 "Job Workflow EventHandl.ext"
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
        Job: Record "HR Jobs";

    begin
        begin
            case RecRef.Number of

                DATABASE::"HR Jobs":
                    begin
                        RecRef.SetTable(Job);
                        Job.Status := Job.Status::New;
                        Job.Modify;
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
        Job: Record "HR Jobs";

    begin

        case RecRef.Number of

            DATABASE::"HR Jobs":
                begin
                    RecRef.SetTable(Job);
                    Job."Status" := Job.Status::Approved;
                    Job.Modify;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        TargetRecRef: RecordRef;
        Job: Record "HR Jobs";

    begin
        case RecRef.Number of
            DATABASE::"HR Jobs":
                begin
                    RecRef.SetTable(Job);
                    Job.Status := Job.Status::"Pending Approval";
                    Job.Modify;
                    IsHandled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]

    local procedure OnAddWorkResponsePredeccorsToLibrary(ResponseFunctionName: Code[128])

    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "Job Workflow EventHandling Ext";

    begin
        case ResponseFunctionName of
            workflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                        WorkflowEventHandlingCust.RunWorkflowOnSendJobForApprovalsCodes())
                end;
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                        WorkflowEventHandlingCust.RunWorkflowOnSendJobForApprovalsCodes());
                end;
            CancelAllApprovalRequestsCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                    workflowEventHandlingCust.RunWorkflowOnCanceledJobsForApprovalCode());
                end;

            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                        WorkflowEventHandlingCust.RunWorkflowOnCanceledJobsForApprovalCode());


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
        Job: Record "HR Jobs";

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

            DATABASE::"HR Jobs":
                begin
                    Job := Variant;

                    if Job.Status = Job.Status::Approved then
                        exit;
                    Job.Status := Job.Status::Approved;
                    Job.Modify(true);
                end else
                        Error(UnsupportedRecordTypeErr, RecRef.Caption)
        end;
    end;

    local procedure ReleaseDocumentCode(): Code[128]
    begin
        exit(UpperCase('OnReleaseDocument'))
    end;




}