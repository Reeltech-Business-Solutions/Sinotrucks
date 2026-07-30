// codeunit 50191 "Approval Mgmt. ExtCal stLoan"
// {
//     Permissions = TableData "Approval Entry" = rimd,
//                   TableData "Approval Comment Line" = rimd,
//                   TableData "Posted Approval Entry" = rimd,
//                   TableData "Posted Approval Comment Line" = rimd,
//                   TableData "Overdue Approval Entry" = rimd,
//                   TableData "Notification Entry" = rimd;

//     trigger OnRun()
//     begin
//     end;

//     var
//         UserIdNotInSetupErr: Label 'User ID %1 does not exist in the Approval User Setup window.', Comment = 'User ID NAVUser does not exist in the Approval User Setup window.';
//         ApproverUserIdNotInSetupErr: Label 'You must set up an approver for user ID %1 in the Approval User Setup window.', Comment = 'You must set up an approver for user ID NAVUser in the Approval User Setup window.';
//         WFUserGroupNotInSetupErr: Label 'The workflow user group member with user ID %1 does not exist in the Approval User Setup window.', Comment = 'The workflow user group member with user ID NAVUser does not exist in the Approval User Setup window.';
//         SubstituteNotFoundErr: Label 'There is no substitute, direct approver, or approval administrator for user ID %1 in the Approval User Setup window.', Comment = 'There is no substitute for user ID NAVUser in the Approval User Setup window.';
//         NoSuitableApproverFoundErr: Label 'No qualified approver was found.';
//         DelegateOnlyOpenRequestsErr: Label 'You can only delegate open approval requests.';
//         ApproveOnlyOpenRequestsErr: Label 'You can only approve open approval requests.';
//         RejectOnlyOpenRequestsErr: Label 'You can only reject open approval entries.';
//         ApprovalsDelegatedMsg: Label 'The selected approval requests have been delegated.';
//         NoReqToApproveErr: Label 'There is no approval request to approve.';
//         NoReqToRejectErr: Label 'There is no approval request to reject.';
//         NoReqToDelegateErr: Label 'There is no approval request to delegate.';
//         PendingApprovalMsg: Label 'An approval request has been sent.';
//         NoApprovalsSentMsg: Label 'No approval requests have been sent, either because they are already sent or because related workflows do not support the journal line.';
//         PendingApprovalForSelectedLinesMsg: Label 'Approval requests have been sent.';
//         PendingApprovalForSomeSelectedLinesMsg: Label 'Approval requests have been sent.\\Requests for some journal lines were not sent, either because they are already sent or because related workflows do not support the journal line.';
//         PurchaserUserNotFoundErr: Label 'The salesperson/purchaser user ID %1 does not exist in the Approval User Setup window for %2 %3.', Comment = 'Example: The salesperson/purchaser user ID NAVUser does not exist in the Approval User Setup window for Salesperson/Purchaser code AB.';
//         NoApprovalRequestsFoundErr: Label 'No approval requests exist.';
//         NoWFUserGroupMembersErr: Label 'A workflow user group with at least one member must be set up.';
//         DocStatusChangedMsg: Label '%1 %2 has been automatically approved. The status has been changed to %3.', Comment = 'Order 1001 has been automatically approved. The status has been changed to Released.';
//         UnsupportedRecordTypeErr: Label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
//         SalesPrePostCheckErr: Label 'Sales %1 %2 must be approved and released before you can perform this action.', Comment = '%1=document type, %2=document no., e.g. Sales Order 321 must be approved...';
//         WorkflowEventHandling: Codeunit "Workflow Event Handling";
//         WorkflowManagement: Codeunit "Workflow Management";
//         ApprovalMgmt: codeunit "Approvals Mgmt.";
//         PurchPrePostCheckErr: Label 'Purchase %1 %2 must be approved and released before you can perform this action.', Comment = '%1=document type, %2=document no., e.g. Purchase Order 321 must be approved...';
//         NoWorkflowEnabledErr: Label 'No approval workflow for this record type is enabled.';
//         ApprovalReqCanceledForSelectedLinesMsg: Label 'The approval request for the selected record has been canceled.';
//         PendingJournalBatchApprovalExistsErr: Label 'An approval request already exists.', Comment = '%1 is the Document No. of the journal line';
//         ApporvalChainIsUnsupportedMsg: Label 'Only Direct Approver is supported as Approver Limit Type option for %1. The approval request will be approved automatically.', Comment = 'Only Direct Approver is supported as Approver Limit Type option for Gen. Journal Batch DEFAULT, CASH. The approval request will be approved automatically.';
//         RecHasBeenApprovedMsg: Label '%1 has been approved.', Comment = '%1 = Record Id';
//         NoPermissionToDelegateErr: Label 'You do not have permission to delegate one or more of the selected approval requests.';
//         NothingToApproveErr: Label 'There is nothing to approve.';
//         ApproverChainErr: Label 'No sufficient approver was found in the approver chain.';
//         DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,VOR,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Express Pv",JV,Capex,"Employee Requisition","Leave Application","Transport Requisition","Training Requisition","Job Approval","Disciplinary Approvals",Lease,Budget,InterBranch,SOrder,CPV,CRV,BPV,BRV,IOUV,IOURV,FAGLJV,SJV,PJV,RJV,BTV,IOUVA,RRV;
//         WorkflowEventHandlingCust: Codeunit "Workflow Event Handling ExtCal";


//     //---------------------------------->> STAFF CLAIM

//     // [IntegrationEvent(false, false)]
//     // procedure OnSendStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
//     // begin
//     // end;

//     // procedure CheckStaffClaimApprovalsWorkflowEnable(StaffClaim: Record "Staff Claims Header"): Boolean
//     // begin
//     //     if not IsStaffClaimDocApprovalsWorkflowEnable(StaffClaim) then
//     //         Error(NoworkflowEnabledErr);
//     //     exit(true);
//     // end;

//     // procedure IsStaffClaimDocApprovalsWorkflowEnable(var StaffClaim: Record "Staff Claims Header"): Boolean
//     // begin
//     //     if StaffClaim.Status <> StaffClaim.Status::Pending then
//     //         exit(false);
//     //     exit(WorkflowManagement.CanExecuteWorkflow(StaffClaim, WorkflowEventHandlingCust.RunWorkflowOnSendStaffClaimForApprovalCode()))
//     // end;

//     // [IntegrationEvent(false, false)]
//     // procedure OnCancelStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
//     // begin
//     // end;

//     //---------------------------------->> STAFF CLAIM


//     local procedure "-------HR Employee-------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendHREmployeeForApproval(var EmpRec: Record "HR Employee")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelEmpTransferForApproval(var EmpRec: Record "HR Employee")
//     begin
//     end;

//     procedure CheckHREmployeeWorkflowEnabled(var EmpRec: Record "HR Employee"): Boolean
//     begin
//         if not IsHREmployeeWorkflowEnabled(EmpRec) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowHREmployeeApprovalStatus(EmpREc: Record "HR Employee"): Boolean
//     begin
//         EmpREc.Find;
//         case EmpREc.Status of
//             EmpREc.Status::Resigned:
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(EmpREc.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckHREmployeeApprovalPossible(EmpREc: Record "HR Employee"): Boolean
//     begin
//         if not IsHREmployeeWorkflowEnabled(EmpREc) then
//             Error(NoWorkflowEnabledErr);

//         //IF NOT EmpREc.EmployerLinesExist THEN
//         //ERROR(NothingToApproveErr);   

//         exit(true);
//     end;

//     procedure IsHREmployeeWorkflowEnabled(var EmpREc: Record "HR Employee"): Boolean
//     begin
//         EXIT(WorkflowManagement.CanExecuteWorkflow(EmpRec, WorkflowEventHandlingCust.RunWorkflowOnSendHREmployeeForApprovalCode));
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckHREmployeeApprovalPossible(var EmpREc: Record "HR Employee")
//     // begin
//     // end;

//     local procedure "-------Imprest-------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendImprestForApproval(var Imprest: Record "Imprest Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectImprestForApproval(var Imprest: Record "Imprest Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelImprestForApproval(var Imprest: Record "Imprest Header")
//     begin
//     end;


//     procedure IsImprestWorkflowEnabled(var Imprest: Record "Imprest Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(Imprest, WorkflowEventHandlingCust.RunWorkflowOnSendImprestForApprovalCode));
//     end;


//     procedure CheckImprestWorkflowEnabled(var Imprest: Record "Imprest Header"): Boolean
//     begin
//         if not IsImprestWorkflowEnabled(Imprest) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowImprestApprovalStatus(var Imprest: Record "Imprest Header"): Boolean
//     begin
//         Imprest.Find;
//         case Imprest.Status of
//             Imprest.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(Imprest.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckImprestApprovalPossible(var Imprest: Record "Imprest Header"): Boolean
//     begin
//         if not IsImprestWorkflowEnabled(Imprest) then
//             Error(NoWorkflowEnabledErr);

//         if not Imprest.ImpLinesExist then
//             Error(NothingToApproveErr);

//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckImprestApprovalPossible(var Imprest: Record "Imprest Header")
//     // begin
//     // end;

//     local procedure "------------------Store Requisition------------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendStoreReqForApproval(var StoreReq: Record "Store Requistion Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectStoreReqForApproval(var StoreReq: Record "Store Requistion Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelStoreReqForApproval(var StoreReq: Record "Store Requistion Header")
//     begin
//     end;


//     procedure IsStoreReqWorkflowEnabled(var StoreReq: Record "Store Requistion Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(StoreReq, WorkflowEventHandlingCust.RunWorkflowOnSendStoreReqForApprovalCode));
//     end;

//     procedure CheckStoreReqWorkflowEnabled(var StoreReq: Record "Store Requistion Header"): Boolean
//     begin
//         if not IsStoreReqWorkflowEnabled(StoreReq) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowStoreReqApprovalStatus(var StoreReq: Record "Store Requistion Header"): Boolean
//     begin
//         StoreReq.Find;
//         case StoreReq.Status of
//             StoreReq.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(StoreReq.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckStoreReqApprovalPossible(var StoreReq: Record "Store Requistion Header"): Boolean
//     begin
//         if not IsStoreReqWorkflowEnabled(StoreReq) then
//             Error(NoWorkflowEnabledErr);

//         //IF NOT StoreReq."Function Name" THEN
//         //ERROR(NothingToApproveErr);

//         OnAfterCheckStoreReqApprovalPossible(StoreReq);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCheckStoreReqApprovalPossible(var StoreReq: Record "Store Requistion Header")
//     begin
//     end;

//     local procedure "--------------JVHeader------------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendJVHeaderForApproval(var JVHeader: Record "JV Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectJVHeaderForApproval(var JVHeader: Record "JV Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelJVHeaderForApproval(var JVHeader: Record "JV Header")
//     begin
//     end;


//     procedure IsJVHeaderWorkflowEnabled(var JVHeader: Record "JV Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(JVHeader, WorkflowEventHandlingCust.RunWorkflowOnSendJVHeaderForApprovalCode));
//     end;

//     procedure CheckJVHeaderWorkflowEnabled(var JVHeader: Record "JV Header"): Boolean
//     begin
//         if not IsJVHeaderWorkflowEnabled(JVHeader) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowJVHeaderApprovalStatus(var JVHeader: Record "JV Header"): Boolean
//     begin
//         JVHeader.Find;
//         case JVHeader.Status of
//             JVHeader.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(JVHeader.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckJVHeaderApprovalPossible(var JVHeader: Record "JV Header"): Boolean
//     begin
//         if not IsJVHeaderWorkflowEnabled(JVHeader) then
//             Error(NoWorkflowEnabledErr);

//         // IF NOT JVHeader.CheckLines THEN
//         //  ERROR(NothingToApproveErr); //Dennis

//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckJVHeaderApprovalPossible(var JVHeader: Record "JV Header")
//     // begin
//     // end;

//     local procedure "--------------PaymentHeader------------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendPaymentVoucherForApproval(var PaymentVoucher: Record "Payments Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectPaymentVoucherForApproval(var PaymentVoucher: Record "Payments Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelPaymentVoucherForApproval(var PaymentVoucher: Record "Payments Header")
//     begin
//     end;

//     procedure IsPaymentVoucherWorkflowEnabled(var PaymentVoucher: Record "Payments Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(PaymentVoucher, WorkflowEventHandlingCust.RunWorkflowOnSendPaymentVoucherForApprovalCode));
//     end;

//     procedure CheckPaymentVoucherWorkflowEnabled(var PaymentVoucher: Record "Payments Header"): Boolean
//     begin
//         if not IsPaymentVoucherWorkflowEnabled(PaymentVoucher) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowPaymentVoucherApprovalStatus(var PaymentVoucher: Record "Payments Header"): Boolean
//     begin
//         PaymentVoucher.Find;
//         case PaymentVoucher.Status of
//             PaymentVoucher.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(PaymentVoucher.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckPaymentVoucherApprovalPossible(var PaymentVoucher: Record "Payments Header"): Boolean
//     begin
//         if not IsPaymentVoucherWorkflowEnabled(PaymentVoucher) then
//             Error(NoWorkflowEnabledErr);

//         IF NOT PaymentVoucher.PayLinesExist THEN
//             ERROR(NothingToApproveErr);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCheckPaymentVoucherApprovalPossible(var PaymentVoucher: Record "Payments Header")
//     begin
//     end;

//     local procedure "--------------ItemJnlBatch------------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendItemJnlBatchForApproval(var ItemJnlBatch: Record "Item Journal Batch")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectItemJnlBatchForApproval(var ItemJnlBatch: Record "Item Journal Batch")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelItemJnlBatchForApproval(var ItemJnlBatch: Record "Item Journal Batch")
//     begin
//     end;

//     procedure IsItemJnlBatchWorkflowEnabled(var ItemJnlBatch: Record "Item Journal Batch"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(ItemJnlBatch, WorkflowEventHandlingCust.RunWorkflowOnSendItemJnlBatchForApprovalCode));
//     end;

//     procedure CheckItemJnlBatchWorkflowEnabled(var ItemJnlBatch: Record "Item Journal Batch"): Boolean
//     begin
//         if not IsItemJnlBatchWorkflowEnabled(ItemJnlBatch) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowItemJnlBatchApprovalStatus(var ItemJnlBatch: Record "Item Journal Batch"): Boolean
//     begin
//         /*ItemJnlBatch.FIND;
//         CASE ItemJnlBatch.Status OF
//           ItemJnlBatch.Status::"Pending Approval":
//             IF HasOpenOrPendingApprovalEntries(ItemJnlBatch.RECORDID) THEN
//               MESSAGE(PendingApprovalMsg)
//             END;
//             */

//     end;

//     procedure CheckItemJnlBatchApprovalPossible(var ItemJnlBatch: Record "Item Journal Batch"): Boolean
//     begin
//         if not IsItemJnlBatchWorkflowEnabled(ItemJnlBatch) then
//             Error(NoWorkflowEnabledErr);

//         //IF NOT ItemJnlBatch.PayLinesExist THEN
//         //''ERROR(NothingToApproveErr);
//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckItemJnlBatchApprovalPossible(var ItemJnlBatch: Record "Item Journal Batch")
//     // begin
//     // end;

//     local procedure "--------------InterbankTransfer------------------"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendinterbankTransferForApproval(var interbankTransfer: Record "InterBank Transfers")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectinterbankTransferForApproval(var interbankTransfer: Record "InterBank Transfers")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelinterbankTransferForApproval(var interbankTransfer: Record "InterBank Transfers")
//     begin
//     end;

//     procedure IsinterbankTransferWorkflowEnabled(var interbankTransfer: Record "InterBank Transfers"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(interbankTransfer, WorkflowEventHandlingCust.RunWorkflowOnSendInterBankTransferForApprovalCode));
//     end;

//     procedure CheckinterbankTransferWorkflowEnabled(var interbankTransfer: Record "InterBank Transfers"): Boolean
//     begin
//         if not IsinterbankTransferWorkflowEnabled(interbankTransfer) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowinterbankTransferApprovalStatus(var InterBankTransfer: Record "InterBank Transfers"): Boolean
//     begin
//         InterBankTransfer.Find;
//         case InterBankTransfer.Status of
//             InterBankTransfer.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(InterBankTransfer.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckinterbankTransferApprovalPossible(var interbankTransfer: Record "InterBank Transfers"): Boolean
//     begin
//         if not IsinterbankTransferWorkflowEnabled(interbankTransfer) then
//             Error(NoWorkflowEnabledErr);

//         //IF NOT interbankTransfer.PayLinesExist THEN
//         //ERROR(NothingToApproveErr);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCheckinterbankTransferApprovalPossible(var interbankTransfer: Record "InterBank Transfers")
//     begin
//     end;

//     local procedure "------------------------->>>StaffAdvance"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelStaffAdvanceForApproval(var StaffAdvance: Record "Staff Advance Header")
//     begin
//     end;

//     procedure IsStaffAdvanceWorkflowEnabled(var StaffAdvance: Record "Staff Advance Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(StaffAdvance, WorkflowEventHandlingCust.RunWorkflowOnSendStaffAdvanceForApprovalCode));
//     end;

//     procedure CheckStaffAdvanceWorkflowEnabled(var StaffAdvance: Record "Staff Advance Header"): Boolean
//     begin
//         if not IsStaffAdvanceWorkflowEnabled(StaffAdvance) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowStaffAdvanceApprovalStatus(var StaffAdvance: Record "Staff Advance Header"): Boolean
//     begin
//         StaffAdvance.Find;
//         case StaffAdvance.Status of
//             StaffAdvance.Status::Approved:
//                 Message(DocStatusChangedMsg, StaffAdvance."No.", StaffAdvance.Status);
//             StaffAdvance.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(StaffAdvance.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckStaffAdvanceApprovalPossible(var StaffAdvance: Record "Staff Advance Header"): Boolean
//     begin
//         if not IsStaffAdvanceWorkflowEnabled(StaffAdvance) then
//             Error(NoWorkflowEnabledErr);

//         //IF NOT StaffAdvance.ImpLinesExist THEN
//         // ERROR(NothingToApproveErr);

//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckStaffAdvanceApprovalPossible(var StaffAdvance: Record "Staff Advance Header")
//     // begin
//     // end;

//     local procedure "------------------------->>>StaffClaim"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelStaffClaimForApproval(var StaffClaim: Record "Staff Claims Header")
//     begin
//     end;

//     procedure IsStaffClaimWorkflowEnabled(var StaffClaim: Record "Staff Claims Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(StaffClaim, WorkflowEventHandlingCust.RunWorkflowOnSendStaffClaimForApprovalCode));
//     end;

//     procedure CheckStaffClaimWorkflowEnabled(var StaffClaim: Record "Staff Claims Header"): Boolean
//     begin
//         if not IsStaffClaimWorkflowEnabled(StaffClaim) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowStaffClaimApprovalStatus(var StaffClaim: Record "Staff Claims Header"): Boolean
//     begin
//         StaffClaim.Find;
//         case StaffClaim.Status of
//             StaffClaim.Status::Approved:
//                 Message(DocStatusChangedMsg, StaffClaim."No.", StaffClaim.Status);
//             StaffClaim.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(StaffClaim.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckStaffClaimApprovalPossible(var StaffClaim: Record "Staff Claims Header"): Boolean
//     begin
//         if not IsStaffClaimWorkflowEnabled(StaffClaim) then
//             Error(NoWorkflowEnabledErr);


//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckStaffClaimApprovalPossible(var StaffClaim: Record "Staff Claims Header")
//     // begin
//     // end;

//     local procedure "------------------------->>>StaffAdvanceSurrender"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendStaffAdvanceSurrenderForApproval(var Advance: Record "Staff Advance Surrender Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectStaffAdvanceSurrenderForApproval(var Advance: Record "Staff Advance Surrender Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelStaffAdvanceSurrenderForApproval(var Advance: Record "Staff Advance Surrender Header")
//     begin
//     end;

//     procedure IsStaffAdvanceSurrenderWorkflowEnabled(var Advance: Record "Staff Advance Surrender Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(Advance, WorkflowEventHandlingCust.RunWorkflowOnSendStaffAdvanceSurrenderForApprovalCode));
//     end;

//     procedure CheckStaffAdvanceSurrenderWorkflowEnabled(var Advance: Record "Staff Advance Surrender Header"): Boolean
//     begin
//         if not IsStaffAdvanceSurrenderWorkflowEnabled(Advance) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowStaffAdvanceSurrenderApprovalStatus(var Advance: Record "Staff Advance Surrender Header"): Boolean
//     begin
//         Advance.Find;
//         case Advance.Status of
//             Advance.Status::Approved:
//                 Message(DocStatusChangedMsg, Advance.No, Advance.Status);
//             Advance.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(Advance.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckStaffAdvanceSurrenderApprovalPossible(var Advance: Record "Staff Advance Surrender Header"): Boolean
//     begin
//         if not IsStaffAdvanceSurrenderWorkflowEnabled(Advance) then
//             Error(NoWorkflowEnabledErr);

//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckStaffAdvanceSurrenderApprovalPossible(var Advance: Record "Staff Advance Surrender Header")
//     // begin
//     // end;

//     local procedure "------------------------->>>ServiceHeader"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendServiceHeaderForApproval(var ServiceHeader: Record "Service Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectServiceHeaderForApproval(var ServiceHeader: Record "Service Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelServiceHeaderForApproval(var ServiceHeader: Record "Service Header")
//     begin
//     end;

//     procedure IsServiceHeaderWorkflowEnabled(var ServiceHeader: Record "Service Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(ServiceHeader, WorkflowEventHandlingCust.RunWorkflowOnSendServiceHeaderForApprovalCode));
//     end;

//     procedure CheckServiceHeaderWorkflowEnabled(var ServiceHeader: Record "Service Header"): Boolean
//     begin
//         if not IsServiceHeaderWorkflowEnabled(ServiceHeader) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowServiceHeaderApprovalStatus(var ServiceHeader: Record "Service Header"): Boolean
//     begin
//         ServiceHeader.Find;
//         case ServiceHeader.Status of
//             ServiceHeader.Status::Finished:
//                 Message(DocStatusChangedMsg, ServiceHeader."No.", ServiceHeader.Status);
//             ServiceHeader.Status::"In Process":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(ServiceHeader.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckServiceHeaderApprovalPossible(var ServiceHeader: Record "Service Header"): Boolean
//     begin
//         if not IsServiceHeaderWorkflowEnabled(ServiceHeader) then
//             Error(NoWorkflowEnabledErr);

//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckServiceHeaderApprovalPossible(var ServiceHeader: Record "Service Header")
//     // begin
//     // end;

//     local procedure "------------------------->>>TransferHeader"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendTransferHeaderForApproval(var TransferHeader: Record "Transfer Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectTransferHeaderForApproval(var TransferHeader: Record "Transfer Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelTransferHeaderForApproval(var TransferHeader: Record "Transfer Header")
//     begin
//     end;

//     procedure IsTransferHeaderWorkflowEnabled(var TransferHeader: Record "Transfer Header"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(TransferHeader, WorkflowEventHandlingCust.RunWorkflowOnSendTransferHeaderForApprovalCode));
//     end;

//     procedure CheckTransferHeaderWorkflowEnabled(var TransferHeader: Record "Transfer Header"): Boolean
//     begin
//         if not IsTransferHeaderWorkflowEnabled(TransferHeader) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowTransferHeaderApprovalStatus(var TransferHeader: Record "Transfer Header"): Boolean
//     begin
//         TransferHeader.Find;
//         case TransferHeader.Status of
//             TransferHeader.Status::Open:
//                 Message(DocStatusChangedMsg, TransferHeader."No.", TransferHeader.Status);
//             TransferHeader.Status::Released:
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(TransferHeader.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckTransferHeaderApprovalPossible(var TransferHeader: Record "Transfer Header"): Boolean
//     begin
//         if not IsTransferHeaderWorkflowEnabled(TransferHeader) then
//             Error(NoWorkflowEnabledErr);

//         exit(true);
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckTransferHeaderApprovalPossible(var TransferHeader: Record "Transfer Header")
//     // begin
//     // end;

//     local procedure "------------------------->>>NewStoreHeader"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendNewStoreHeaderForApproval(var NewStoreHeader: Record "New Store Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectNewStoreHeaderForApproval(var NewStoreHeader: Record "New Store Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelNewStoreHeaderForApproval(var NewStoreHeader: Record "New Store Header")
//     begin
//     end;

//     procedure IsNewStoreHeaderWorkflowEnabled(var NewStoreHeader: Record "New Store Header"): Boolean
//     begin
//         // exit(WorkflowManagement.CanExecuteWorkflow(NewStoreHeader, WorkflowEventHandlingCust.RunWorkflowOnSendNewStoreHeaderForApprovalCode));
//     end;

//     procedure CheckNewStoreHeaderWorkflowEnabled(var NewStoreHeader: Record "New Store Header"): Boolean
//     begin
//         if not IsNewStoreHeaderWorkflowEnabled(NewStoreHeader) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowNewStoreHeaderApprovalStatus(var NewStoreHeader: Record "New Store Header"): Boolean
//     begin
//         NewStoreHeader.Find;
//         case NewStoreHeader.Status of
//             NewStoreHeader.Status::"Pending Approval":
//                 Message(DocStatusChangedMsg, NewStoreHeader."Requisition No.", NewStoreHeader.Status);
//             NewStoreHeader.Status::Released:
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(NewStoreHeader.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckNewStoreHeaderApprovalPossible(var NewStoreHeader: Record "New Store Header"): Boolean
//     begin
//         if not IsNewStoreHeaderWorkflowEnabled(NewStoreHeader) then
//             Error(NoWorkflowEnabledErr);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCheckNewStoreHeaderApprovalPossible(var NewStoreHeader: Record "New Store Header")
//     begin
//     end;

//     local procedure "------------------------->>>PaymentRequest"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendPaymentRequestForApproval(var PaymentRequest: Record "Payments Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectPaymentRequestForApproval(var PaymentRequest: Record "Payments Header")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnCancelPaymentRequestForApproval(var PaymentRequest: Record "Payments Header")
//     begin
//     end;

//     procedure IsPaymentRequestWorkflowEnabled(var PaymentRequest: Record "Payments Header"): Boolean
//     begin
//     end;

//     procedure CheckPaymentRequestWorkflowEnabled(var PaymentRequest: Record "Payments Header"): Boolean
//     begin
//         if not IsPaymentRequestWorkflowEnabled(PaymentRequest) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowPaymentRequestApprovalStatus(var PaymentRequest: Record "Payments Header"): Boolean
//     begin
//         /*PaymentRequest.FIND;
//         CASE PaymentRequest.Status OF
//           PaymentRequest.Status::"Pending Approval":
//              MESSAGE(DocStatusChangedMsg,PaymentRequest."Document No.",PaymentRequest.Status);
//           PaymentRequest.Status::Released:
//             IF HasOpenOrPendingApprovalEntries(PaymentRequest.RECORDID) THEN
//               MESSAGE(PendingApprovalMsg)
//             END;
//         */

//     end;

//     procedure CheckPaymentRequestApprovalPossible(var PaymentRequest: Record "Payments Header"): Boolean
//     begin
//         if not IsPaymentRequestWorkflowEnabled(PaymentRequest) then
//             Error(NoWorkflowEnabledErr);

//         OnAfterCheckPaymentRequestApprovalPossible(PaymentRequest);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCheckPaymentRequestApprovalPossible(var PaymentRequest: Record "Payments Header")
//     begin
//     end;

//     local procedure "------------------------->>>LeaveApplication"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendLeaveAppForApproval(var LeaveRec: Record "HR Leave Application")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectLeaveAppForApproval(LeaveRec: Record "HR Leave Application")
//     begin
//     end;


//     procedure IsLeaveAppWorkflowEnabled(LeaveRec: Record "HR Leave Application"): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(LeaveRec, WorkflowEventHandlingCust.RunWorkflowOnSendLeaveAppForApprovalCode));
//     end;


//     procedure CheckLeaveAppWorkflowEnabled(LeaveRec: Record "HR Leave Application"): Boolean
//     begin
//         if not IsLeaveAppWorkflowEnabled(LeaveRec) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowLeaveAppApprovalStatus(LeaveRec: Record "HR Leave Application"): Boolean
//     begin
//         LeaveRec.Find;

//         case LeaveRec.Status of
//             LeaveRec.Status::Approved:
//                 Message(DocStatusChangedMsg, LeaveRec."Application Code", LeaveRec.Status);
//             LeaveRec.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(LeaveRec.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckLeaveAppApprovalPossible(var LeaveRec: Record "HR Leave Application"): Boolean
//     begin
//         if not IsLeaveAppWorkflowEnabled(LeaveRec) then
//             Error(NoWorkflowEnabledErr);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnCancelLeaveAppForApproval(LeaveAppRec: Record "HR Leave Application")
//     begin
//     end;

//     // [IntegrationEvent(false, false)]
//     // local procedure OnAfterCheckLeaveAppApprovalPossible(LeaveRec: Record "HR Leave Application")
//     // begin
//     // end;

//     local procedure "------------------------->>>EmployeeLoan"()
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnSendEmployeeLoanForApproval(var PREmpLoan: Record "prAssignEmployeeLoan.")
//     begin
//     end;

//     [IntegrationEvent(false, false)]

//     procedure OnRejectEmployeeLoanForApproval(var PREmpLoan: Record "prAssignEmployeeLoan.")
//     begin
//     end;


//     procedure IsEmployeeLoanWorkflowEnabled(var PREmpLoan: Record "prAssignEmployeeLoan."): Boolean
//     begin
//         exit(WorkflowManagement.CanExecuteWorkflow(PREmpLoan, WorkflowEventHandlingCust.RunWorkflowOnSendEmployeeLoanForApprovalCode));
//     end;


//     procedure CheckEmployeeLoanWorkflowEnabled(var PREmpLoan: Record "prAssignEmployeeLoan."): Boolean
//     begin
//         if not IsEmployeeLoanWorkflowEnabled(PREmpLoan) then
//             Error(NoWorkflowEnabledErr);
//         exit(true)
//     end;

//     local procedure ShowEmployeeLoanApprovalStatus(var PREmpLoan: Record "prAssignEmployeeLoan."): Boolean
//     begin
//         PREmpLoan.Find;

//         case PREmpLoan.Status of
//             PREmpLoan.Status::Approved:
//                 Message(DocStatusChangedMsg, PREmpLoan.Code, PREmpLoan.Status);
//             PREmpLoan.Status::"Pending Approval":
//                 if ApprovalMgmt.HasOpenOrPendingApprovalEntries(PREmpLoan.RecordId) then
//                     Message(PendingApprovalMsg)
//         end;
//     end;

//     procedure CheckEmployeeLoanApprovalPossible(var PREmpLoan: Record "prAssignEmployeeLoan."): Boolean
//     begin
//         if not IsEmployeeLoanWorkflowEnabled(PREmpLoan) then
//             Error(NoWorkflowEnabledErr);

//         exit(true);
//     end;

//     [IntegrationEvent(false, false)]
//     procedure OnCancelEmployeeLoanForApproval(var PREmpLoan: Record "prAssignEmployeeLoan.")
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCheckEmployeeLoanApprovalPossible(var PREmpLoan: Record "prAssignEmployeeLoan.")
//     begin
//     end;

//     //


//     [EventSubscriber(ObjectType::Codeunit, 1535, 'OnBeforeCreateApprReqForApprTypeWorkflowUserGroup', '', false, false)]
//     //  local procedure OnBeforeCreateApprReqForApprTypeWorkflowUserGroup(Var WorkflowUserGroupMember: Record "Workflow User Group Member"; WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntry: Record "Approval Entry"; SequenceNo: Integer; IsHandled: Boolean);
//     local procedure OnBeforeCreateApprReqForApprTypeWorkflowUserGroup(var WorkflowUserGroupMember: Record "Workflow User Group Member"; WorkflowStepArgument: Record "Workflow Step Argument"; ApprovalEntry: Record "Approval Entry"; SequenceNo: Integer; var IsHandled: Boolean)
//     Var
//         appmgt: Codeunit 1535;
//         ApproverId: Code[50];
//         UserSetup: Record "User Setup";
//     begin
//         WITH WorkflowUserGroupMember DO BEGIN
//             SETCURRENTKEY("Workflow User Group Code", "Sequence No.");
//             SETRANGE("Workflow User Group Code", WorkflowStepArgument."Workflow User Group Code");
//             IF NOT FINDSET THEN
//                 ERROR(NoWFUserGroupMembersErr);

//             REPEAT
//                 ApproverId := "User Name";
//                 IF NOT UserSetup.GET(ApproverId) THEN
//                     ERROR(WFUserGroupNotInSetupErr, ApproverId);
//                 IsHandled := TRUE;

//                 // Tiered AGL-RBS
//                 IF (("Minimum Amount" <> 0) AND ("Maximum Amount" <> 0)) THEN BEGIN //FOLA 05122024
//                     IF (ApprovalEntry."Amount (LCY)" >= "Minimum Amount") AND (ApprovalEntry."Amount (LCY)" <= "Maximum Amount") THEN
//                         appmgt.MakeApprovalEntry(ApprovalEntry, SequenceNo + "Sequence No.", ApproverId, WorkflowStepArgument)
//                     ELSE
//                         IF ApprovalEntry."Amount (LCY)" > "Maximum Amount" THEN
//                             appmgt.MakeApprovalEntry(ApprovalEntry, SequenceNo + "Sequence No.", ApproverId, WorkflowStepArgument)
//                 END else
//                     appmgt.MakeApprovalEntry(ApprovalEntry, SequenceNo + "Sequence No.", ApproverId, WorkflowStepArgument); //FOLA 05122024
//             //
//             UNTIL NEXT = 0;
//         END;
//         IsHandled := true;
//         //Message('This Run');
//         //exit();
//     end;

//     [EventSubscriber(ObjectType::Codeunit, 1535, 'OnPopulateApprovalEntryArgument', '', false, false)]
//     local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; WorkflowStepInstance: Record "Workflow Step Instance")
//     var
//         StaffClaim: Record "Staff Claims Header";
//         IncomingDocument: Record "Incoming Document";
//         IsHandled: Boolean;
//         JVHeader: Record "JV Header";
//         PaymentVoucher: Record "Payments Header";
//         interbankTransfer: Record "InterBank Transfers";
//         StaffAdvance: Record "Staff Advance Header";
//         StaffAdvSur: Record "Staff Advance Surrender Header";
//         StoreReq: Record "Store Requistion Header";
//         ItemJnlBatch: Record "Item Journal Batch";
//         HrEmployee: Record "HR Employee";
//         Imprest: Record "Imprest Header";
//         NewStoreHeader: Record "New Store Header";
//         TransferHeader: Record "Transfer Header";
//         ServiceHeader: Record "Service Header";
//         LeaveRec: Record "HR Leave Application";
//         PREmpLoan: Record "prAssignEmployeeLoan.";
//     begin
//         case RecRef.Number of
//             DATABASE::"JV Header":
//                 begin
//                     RecRef.SetTable(JVHeader);
//                     ApprovalEntryArgument."Document No." := JVHeader."Document No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Express Pv";
//                 end;

//             DATABASE::"Payments Header":
//                 begin
//                     RecRef.SetTable(PaymentVoucher);
//                     ApprovalEntryArgument."Document No." := PaymentVoucher."No.";

//                     if PaymentVoucher."Payment Type" = PaymentVoucher."Payment Type"::Normal then
//                         ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Payment Voucher"
//                     else
//                         if PaymentVoucher."Payment Type" = PaymentVoucher."Payment Type"::Express then
//                             ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Imprest
//                         else
//                             if PaymentVoucher."Payment Type" = PaymentVoucher."Payment Type"::"Petty Cash" then
//                                 ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Petty Cash";

//                     //Deji
//                     PaymentVoucher.CalcFields("Total Net Amount", "Total Payment Amount", "Total Payment Amount LCY");
//                     ApprovalEntryArgument.Amount := PaymentVoucher."Total Net Amount";
//                     ApprovalEntryArgument."Amount (LCY)" := PaymentVoucher."Total Payment Amount LCY";
//                     ApprovalEntryArgument."Currency Code" := PaymentVoucher."Currency Code";
//                     //
//                 end;

//             DATABASE::"InterBank Transfers":
//                 begin
//                     RecRef.SetTable(interbankTransfer);
//                     ApprovalEntryArgument."Document No." := interbankTransfer.No;
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Interbank;
//                     ApprovalEntryArgument.Amount := interbankTransfer.Amount;
//                     // ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
//                 end;

//             DATABASE::"Staff Claims Header":
//                 begin
//                     RecRef.SetTable(StaffClaim);
//                     ApprovalEntryArgument."Document No." := StaffClaim."No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Claim";
//                     StaffClaim.CalcFields("Total Net Amount", "Total Net Amount LCY", "Total Payment Amount");
//                     ApprovalEntryArgument.Amount := StaffClaim."Total Net Amount";
//                     ApprovalEntryArgument."Amount (LCY)" := StaffClaim."Total Net Amount LCY";
//                 end;

//             DATABASE::"Imprest Header":
//                 begin
//                     RecRef.SetTable(Imprest);
//                     ApprovalEntryArgument."Document No." := Imprest."No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Imprest;
//                     Imprest.CalcFields("Total Payment Amount");
//                     ApprovalEntryArgument.Amount := Imprest."Total Payment Amount";
//                 end;

//             DATABASE::"Staff Advance Header":
//                 begin
//                     RecRef.SetTable(StaffAdvance);
//                     ApprovalEntryArgument."Document No." := StaffAdvance."No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Staff Advance";
//                     StaffAdvance.CalcFields("Total Net Amount", "Total Net Amount LCY", "Total Payment Amount");
//                     ApprovalEntryArgument.Amount := StaffAdvance."Total Net Amount";
//                     ApprovalEntryArgument."Amount (LCY)" := StaffAdvance."Total Net Amount LCY";
//                 end;

//             DATABASE::"Staff Advance Surrender Header":
//                 begin
//                     RecRef.SetTable(StaffAdvSur);
//                     ApprovalEntryArgument."Document No." := StaffAdvSur.No;
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::AdvanceSurrender;
//                     // ApprovalEntryArgument.Amount := ApprovalAmount;

//                 end;

//             DATABASE::"Store Requistion Header":
//                 begin
//                     RecRef.SetTable(StoreReq);
//                     ApprovalEntryArgument."Document No." := StoreReq."No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Requisition;
//                 end;

//             DATABASE::"Service Header":
//                 begin
//                     RecRef.SetTable(ServiceHeader);
//                     //CalcPurchaseDocAmount(ServiceHeader,ApprovalAmount,ApprovalAmountLCY);
//                     ApprovalEntryArgument."Document Type" := ServiceHeader."Document Type";
//                     ApprovalEntryArgument."Document No." := ServiceHeader."No.";
//                     //      ApprovalEntryArgument."Salespers./Purch. Code" := PurchaseHeader."Purchaser Code";
//                     // ApprovalEntryArgument.Amount := ApprovalAmount;
//                     // ApprovalEntryArgument."Amount (LCY)" := ApprovalAmountLCY;
//                     ApprovalEntryArgument."Currency Code" := ServiceHeader."Currency Code";
//                 end;

//             DATABASE::"Transfer Header":
//                 begin
//                     RecRef.SetTable(TransferHeader);
//                     ApprovalEntryArgument."Document No." := TransferHeader."No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Requisition;
//                 end;

//             DATABASE::"New Store Header":
//                 begin
//                     RecRef.SetTable(NewStoreHeader);
//                     ApprovalEntryArgument."Document No." := NewStoreHeader."Requisition No.";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::Requisition;
//                 end;

//             //--->>Fola03102023
//             DATABASE::"HR Leave Application":
//                 begin
//                     RecRef.SetTable(LeaveRec);
//                     ApprovalEntryArgument."Document No." := LeaveRec."Application Code";
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Leave Application";
//                 end;

//             //06192023
//             DATABASE::"prAssignEmployeeLoan.":
//                 begin
//                     RecRef.SetTable(PREmpLoan);
//                     ApprovalEntryArgument."Document No." := PREmpLoan.Code;
//                     ApprovalEntryArgument."Document Type" := ApprovalEntryArgument."Document Type"::"Loan"; //Fola 05052024
//                     ApprovalEntryArgument."Amount (LCY)" := PREmpLoan.Balance;
//                 end;

//         end;
//     end;

//     procedure SetStatusToPendingApproval(var Variant: Variant)
//     var
//         SalesHeader: Record "Sales Header";
//         PurchaseHeader: Record "Purchase Header";
//         IncomingDocument: Record "Incoming Document";
//         RecRef: RecordRef;
//         IsHandled: Boolean;
//         JVHeader: Record "JV Header";
//         PaymentVoucher: Record "Payments Header";
//         interbankTransfer: Record "InterBank Transfers";
//         StaffClaim: Record "Staff Claims Header";
//         StaffAdvance: Record "Staff Advance Header";
//         StaffAdvSur: Record "Staff Advance Surrender Header";
//         StoreReq: Record "Store Requistion Header";
//         ItemJnlBatch: Record "Item Journal Batch";
//         HrEmployee: Record "HR Employee";
//         Imprest: Record "Imprest Header";
//         NewStoreHeader: Record "New Store Header";
//         TransferHeader: Record "Transfer Header";
//         ServiceHeader: Record "Service Header";
//         LeaveRec: Record "HR Leave Application";
//         PREmpLoan: Record "prAssignEmployeeLoan.";
//     begin
//         RecRef.GetTable(Variant);

//         case RecRef.Number of
//             DATABASE::"Purchase Header":
//                 begin
//                     RecRef.SetTable(PurchaseHeader);
//                     PurchaseHeader.Validate(Status, PurchaseHeader.Status::"Pending Approval");
//                     PurchaseHeader.Modify(true);
//                     Variant := PurchaseHeader;
//                 end;
//             DATABASE::"Sales Header":
//                 begin
//                     RecRef.SetTable(SalesHeader);
//                     SalesHeader.Validate(Status, SalesHeader.Status::"Pending Approval");
//                     SalesHeader.Modify(true);
//                     Variant := SalesHeader;
//                 end;
//             DATABASE::"Incoming Document":
//                 begin
//                     RecRef.SetTable(IncomingDocument);
//                     IncomingDocument.Validate(Status, IncomingDocument.Status::"Pending Approval");
//                     IncomingDocument.Modify(true);
//                     Variant := IncomingDocument;
//                 end;
//             DATABASE::"JV Header":
//                 begin
//                     RecRef.SetTable(JVHeader);
//                     JVHeader.Validate(Status, JVHeader.Status::"Pending Approval");
//                     JVHeader.Modify(true);
//                     Variant := JVHeader;
//                 end;

//             DATABASE::"Payments Header":
//                 begin
//                     RecRef.SetTable(PaymentVoucher);
//                     PaymentVoucher.Validate(Status, PaymentVoucher.Status::"Pending Approval");
//                     PaymentVoucher.Modify(true);
//                     Variant := PaymentVoucher;
//                 end;

//             DATABASE::"InterBank Transfers":
//                 begin
//                     RecRef.SetTable(interbankTransfer);
//                     interbankTransfer.Validate(Status, interbankTransfer.Status::"Pending Approval");
//                     interbankTransfer.Modify(true);
//                     Variant := interbankTransfer;
//                 end;

//             DATABASE::"Staff Claims Header":
//                 begin
//                     RecRef.SetTable(StaffClaim);
//                     StaffClaim.Validate(Status, StaffClaim.Status::"Pending Approval");
//                     StaffClaim.Modify(true);
//                     Variant := StaffClaim;
//                 end;

//             DATABASE::"Imprest Header":
//                 begin
//                     RecRef.SetTable(Imprest);
//                     Imprest.Validate(Status, Imprest.Status::"Pending Approval");
//                     Imprest.Modify(true);
//                     Variant := Imprest;
//                 end;

//             DATABASE::"Staff Advance Header":
//                 begin
//                     RecRef.SetTable(StaffAdvance);
//                     StaffAdvance.Validate(Status, StaffAdvance.Status::"Pending Approval");
//                     StaffAdvance.Modify(true);
//                     Variant := StaffAdvance;
//                 end;


//             // DATABASE::"HR Employee":
//             // BEGIN
//             //  RecRef.SETTABLE(HrEmployee);
//             // HrEmployee.VALIDATE(Status, HrEmployee.Status::Resigned);
//             // HrEmployee.MODIFY(TRUE);
//             // Variant := HrEmployee;
//             // END;

//             DATABASE::"Staff Advance Surrender Header":
//                 begin
//                     RecRef.SetTable(StaffAdvSur);
//                     StaffAdvSur.Validate(Status, StaffAdvSur.Status::"Pending Approval");
//                     StaffAdvSur.Modify(true);
//                     Variant := StaffAdvSur;
//                 end;

//             DATABASE::"Store Requistion Header":
//                 begin
//                     RecRef.SetTable(StoreReq);
//                     StoreReq.Validate(Status, StoreReq.Status::"Pending Approval");
//                     StoreReq.Modify(true);
//                     Variant := StoreReq;
//                 end;


//             DATABASE::"HR Leave Application":
//                 begin
//                     RecRef.SetTable(LeaveRec);
//                     LeaveRec.Validate(Status, LeaveRec.Status::"Pending Approval");
//                     LeaveRec.Modify(true);
//                     Variant := LeaveRec;
//                 end;
//             /*
//            DATABASE::"Item Journal Batch":
//              BEGIN
//                RecRef.SETTABLE(ItemJnlBatch);
//           ItemJnlBatch.VALIDATE(Status, ItemJnlBatch.Status::"Pending Approval");
//           ItemJnlBatch.MODIFY(TRUE);
//           Variant := ItemJnlBatch;
//           END;
//           */

//             DATABASE::"New Store Header":
//                 begin
//                     RecRef.SetTable(NewStoreHeader);
//                     NewStoreHeader.Validate(Status, NewStoreHeader.Status::Released);
//                     NewStoreHeader.Modify(true);
//                     Variant := NewStoreHeader;
//                 end;

//             DATABASE::"Transfer Header":
//                 begin
//                     RecRef.SetTable(TransferHeader);
//                     TransferHeader.Validate(Status, TransferHeader.Status::Released);
//                     TransferHeader.Modify(true);
//                     Variant := TransferHeader;
//                 end;

//             DATABASE::"Service Header":
//                 begin
//                     RecRef.SetTable(ServiceHeader);
//                     ServiceHeader.Validate(Status, ServiceHeader.Status::"In Process");
//                     ServiceHeader.Modify(true);
//                     Variant := ServiceHeader;
//                 end;

//             DATABASE::"prAssignEmployeeLoan.":
//                 begin
//                     RecRef.SetTable(PREmpLoan);
//                     PREmpLoan.Validate(Status, PREmpLoan.Status::"Pending Approval");
//                     PREmpLoan.Modify(true);
//                     Variant := PREmpLoan;
//                 end;

//         end;
//     end;


// }


// // end;







