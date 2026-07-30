// page 54995 "Journal Voucher"
// {
//     Caption = 'Journal Voucher';
//     PageType = Document;
//     RefreshOnActivate = true;
//     SourceTable = "Voucher Header";
//     SourceTableView = WHERE("Voucher Type"=CONST(JV));
//     ApplicationArea = all;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; rec."No.")
//                 {
//                     ApplicationArea = all;

//                     trigger OnAssistEdit()
//                     begin
//                         IF rec.AssistEdit(xRec)THEN CurrPage.UPDATE;
//                     end;
//                 }
//                 field("Posting Date"; rec."Posting Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Document Date"; rec."Document Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Status; rec.Status)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     ApplicationArea = all;
//                 //Caption = 'Policy No';
//                 }
//                 field("Debit Amount"; rec."Debit Amount")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Credit Amount"; rec."Credit Amount")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//             part(voucherline; "Voucher Subform")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Voucher Lines';
//                 SubPageLink = "Voucher Type"=FIELD("Voucher Type"), "Document No."=FIELD("No.");
//             }
//             group("User Trail")
//             {
//                 field("Created By"; rec."Created By")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Created By Name"; rec."Created By Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Created Date"; rec."Created Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Created Time"; rec."Created Time")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Modified By"; rec."Modified By")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Modified By Name"; rec."Modified By Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Modified Date"; rec."Modified Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Modified Time"; rec."Modified Time")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             part(ApprovalStatus; "Approval Status")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Approvals';
//                 SubPageLink = "Document No."=FIELD("No.");
//                 SubPageView = SORTING("Table ID", "Document Type", "Document No.", "Sequence No.");
//             }
//             systempart(MyNotes; MyNotes)
//             {
//                 ApplicationArea = all;
//             }
//             systempart(Notes; Notes)
//             {
//                 ApplicationArea = all;
//             }
//         }
//     }
//     actions
//     {
//         area(navigation)
//         {
//             group("&Voucher")
//             {
//                 Caption = '&Voucher';

//                 action(Dimensions)
//                 {
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     Promoted = true;
//                     ApplicationArea = all;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+Ctrl+D';

//                     trigger OnAction()
//                     begin
//                         rec.ShowDocDim;
//                     end;
//                 }
//                 action("A&pprovals")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'A&pprovals';

//                     trigger OnAction()
//                     begin
//                         ApprovalEntries.Setrecordfilters(DATABASE::"Voucher Header", 7, rec."No.");
//                         ApprovalEntries.RUN;
//                     end;
//                 }
//             }
//         }
//         area(processing)
//         {
//             group(Release1)
//             {
//                 Caption = 'Release';

//                 action(Release)
//                 {
//                     Caption = 'Re&lease';
//                     Image = ReleaseDoc;
//                     ApplicationArea = all;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ShortCutKey = 'Ctrl+F9';

//                     trigger OnAction()
//                     begin
//                         ReleaseVoucher.PerformManualRelease(Rec);
//                     end;
//                 }
//                 action(Reopen)
//                 {
//                     Caption = 'Re&open';
//                     Image = ReOpen;
//                     Promoted = true;
//                     ApplicationArea = all;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     begin
//                         ReleaseVoucher.PerformManualReopen(Rec);
//                     end;
//                 }
//             }
//             group("F&unctions")
//             {
//                 Caption = 'F&unctions';

//                 action("Send A&pproval Request")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Send A&pproval Request';
//                     Image = SendApprovalRequest;

//                     trigger OnAction()
//                     begin
//                     //IF ApprovalMgt.SendVoucherApprovalRequest(Rec) THEN;
//                     end;
//                 }
//                 action("Cancel Approval Re&quest")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Cancel Approval Re&quest';
//                     Image = Cancel;

//                     trigger OnAction()
//                     begin
//                     //IF ApprovalMgt.CancelVoucherApprovalRequest(Rec,TRUE,TRUE) THEN;
//                     end;
//                 }
//             }
//             group("P&osting")
//             {
//                 Caption = 'P&osting';

//                 action("Test Report")
//                 {
//                     Caption = 'Test Report';
//                     Ellipsis = true;
//                     ApplicationArea = all;
//                     Image = TestReport;
//                 }
//                 action("P&ost")
//                 {
//                     Caption = 'P&ost';
//                     Image = PostOrder;
//                     ApplicationArea = all;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     RunObject = codeunit "Voucher Post";
//                     ShortCutKey = 'F9';
//                 }
//                 action("Post and &Print")
//                 {
//                     Caption = 'Post and &Print';
//                     Ellipsis = true;
//                     ApplicationArea = all;
//                     Image = PostPrint;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F9';
//                     Visible = false;
//                 }
//             }
//             group("&Print")
//             {
//                 Caption = '&Print';

//                 action(Print)
//                 {
//                     Caption = 'Print';
//                     Ellipsis = true;
//                     ApplicationArea = all;
//                     Image = Print;

//                     trigger OnAction()
//                     begin
//                         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                         VoucherHeader.SETRANGE("No.", rec."No.");
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50050, TRUE, FALSE, VoucherHeader);
//                     end;
//                 }
//             }
//         }
//     }
//     var VoucherPost: Codeunit "Voucher Post";
//     ApprovalEntries: Page "Approval Entries";
//     ReleaseVoucher: Codeunit "Voucher Release";
//     VoucherHeader: Record "Voucher Header";
// }
