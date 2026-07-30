codeunit 50089 "EmpWorkflowRespEventHand.ext"
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
        EMP: Record "HR Employees";

    begin
        begin
            case RecRef.Number of
                DATABASE::"HR Employees":
                    begin
                        RecRef.SetTable(EMP);
                        EMP."Approval Status" := EMP."Approval Status"::NEW;
                        EMP.Modify;
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
        EMP: Record "HR Employees";

    begin

        case RecRef.Number of

            DATABASE::"HR Employees":
                begin
                    RecRef.SetTable(EMP);
                    EMP."Approval Status" := EMP."Approval Status"::"Approved";
                    EMP.Modify;
                    Handled := true;
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, 1535, 'OnSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var
        ApprovalEntry: Record "Approval Entry";
        TargetRecRef: RecordRef;
        EMP: Record "HR Employees";
    BEGIN
        case RecRef.Number of
            DATABASE::"HR Employees":
                begin
                    RecRef.SetTable(EMP);
                    EMP."Approval Status" := EMP."Approval Status"::"Pending Approval";
                    EMP.Modify;
                    IsHandled := true;
                end;
        end;
    END;

    [EventSubscriber(ObjectType::Codeunit, 1521, 'OnAddWorkflowResponsePredecessorsToLibrary', '', false, false)]
    local procedure OnAddWorkflowResponsePredecessorsToLibrary(ResponseFunctionName: Code[128])
    var
        WorkflowResponseHandling: Codeunit "Workflow Response Handling";
        WorkflowEventHandlingCust: Codeunit "Emp Workflow EventHandlng Ext";
    begin
        case ResponseFunctionName of
            WorkflowResponseHandling.SetStatusToPendingApprovalCode:
                begin
                    //Employee Application
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SetStatusToPendingApprovalCode,
                             WorkflowEventHandlingCust.RunWorkflowOnSendEmployeeForApprovalCode());
                end;
            WorkflowResponseHandling.SendApprovalRequestForApprovalCode:

                begin
                    //Employee Application
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.SendApprovalRequestForApprovalCode,
                             WorkflowEventHandlingCust.RunWorkflowOnSendEmployeeForApprovalCode());
                end;
            CancelAllApprovalRequestsCode:
                begin
                    // HR Employee
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.CancelAllApprovalRequestsCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledEmployeeForApprovalCode());
                end;
            WorkflowResponseHandling.OpenDocumentCode:
                begin
                    // Employee Application
                    WorkflowResponseHandling.AddResponsePredecessor(WorkflowResponseHandling.OpenDocumentCode,
                              WorkflowEventHandlingCust.RunWorkflowOnCanceledEmployeeForApprovalCode());
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
        EMP: Record "HR Employees";

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

            DATABASE::"HR Employees":
                begin
                    EMP := Variant;
                    
                    if EMP."Approval Status" = EMP."Approval Status"::Approved then
                        exit;
                    EMP."Approval Status" := EMP."Approval Status"::Approved;
                    EMP.Modify(true);
                   
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

