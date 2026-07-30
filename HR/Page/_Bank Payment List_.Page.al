// page 54982 "Bank Payment List"
// {
//     CardPageID = "Bank Payment Voucher";
//     Editable = false;
//     ApplicationArea = all;
//     PageType = List;
//     SourceTable = "Voucher Header";
//     AdditionalSearchTerms = 'Bank Payment List';
//     SourceTableView = WHERE("Voucher Type"=CONST(BPV));
//     UsageCategory = Lists;

//     layout
//     {
//         area(content)
//         {
//             repeater(Group)
//             {
//                 field("Voucher Type"; rec."Voucher Type")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("No."; rec."No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Account Type"; rec."Account Type")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Posting Date"; rec."Posting Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Created By"; rec."Created By")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Created Date"; rec."Created Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Account No."; rec."Account No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Account Name"; rec."Account Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Amount; rec.Amount)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Amount (LCY)"; rec."Amount (LCY)")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
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
//                 field(Narration; rec.Narration)
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
//                     ApplicationArea = all;
//                     Promoted = true;
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
//                     Caption = 'Send A&pproval Request';
//                     ApplicationArea = all;
//                     Image = SendApprovalRequest;

//                     trigger OnAction()
//                     var
//                     //ApprovalMgt: Codeunit "Approval Mgmt. ExtCal";
//                     begin
//                     //IF ApprovalMgt.SendVoucherApprovalRequest(Rec) THEN;
//                     //ApprovalMgt.OnSendVouchHeaderForApproval(Rec)RBS DEnnis
//                     end;
//                 }
//                 action("Cancel Approval Re&quest")
//                 {
//                     Caption = 'Cancel Approval Re&quest';
//                     ApplicationArea = all;
//                     Image = Cancel;

//                     trigger OnAction()
//                     var
//                     //ApprovalMgt: Codeunit "Approval Mgmt. ExtCal";
//                     begin
//                     //ApprovalMgt.OnCancelVouchHeaderForApproval(Rec) RBS Dennis
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
//                     Promoted = true;
//                     ApplicationArea = all;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'F9';

//                     trigger OnAction()
//                     begin
//                         VoucherPost.RUN(Rec);
//                     end;
//                 }
//                 action("Post and &Print")
//                 {
//                     Caption = 'Post and &Print';
//                     Ellipsis = true;
//                     Image = PostPrint;
//                     ApplicationArea = all;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F9';

//                     trigger OnAction()
//                     begin
//                         VoucherPost.RUN(Rec);
//                     end;
//                 }
//             }
//             group("&Print")
//             {
//                 Caption = '&Print';

//                 action(Voucher)
//                 {
//                     Caption = 'Voucher';
//                     Ellipsis = true;
//                     Image = Print;
//                     ApplicationArea = all;

//                     trigger OnAction()
//                     var
//                         VoucherHeader: Record "Voucher Header";
//                     begin
//                         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                         VoucherHeader.SETRANGE("No.", rec."No.");
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50052, TRUE, FALSE, VoucherHeader);
//                         VoucherPost.RUN(Rec);
//                     end;
//                 }
//             }
//         }
//     }
//     trigger OnOpenPage()
//     begin
//     /*IF UserMgt.GetGenJnLFilter() <> '' THEN BEGIN
//           FILTERGROUP(2);
//           SETRANGE("Responsibility Center",UserMgt.GetGenJnLFilter());
//           FILTERGROUP(0);
//         END;
//         */
//     end;
//     var VoucherPost: Codeunit "Voucher Post";
//     ApprovalEntries: Page "Approval Entries";
//     ReleaseVoucher: Codeunit "Voucher Release";
//     UserMgt: Codeunit "User Management";
// }
