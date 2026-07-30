// page 54985 "Bank Receipt  List"
// {
//     CardPageID = "Bank Receipt Voucher";
//     Editable = false;
//     ApplicationArea = all;
//     PageType = List;
//     SourceTable = "Voucher Header";
//     AdditionalSearchTerms = 'Bank Receipt List';
//     SourceTableView = SORTING("Voucher Type", "No.")WHERE("Voucher Type"=CONST(BRV));
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
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Customer No."; rec."Customer No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Customer Name"; rec."Customer Name")
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
//             systempart(Links; Links)
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
//                     Caption = 'A&pprovals';
//                     ApplicationArea = all;

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
//                     Promoted = true;
//                     ApplicationArea = all;
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
//                     Caption = 'Send A&pproval Request';
//                     ApplicationArea = all;
//                     Image = SendApprovalRequest;

//                     trigger OnAction()
//                     begin
//                     //IF ApprovalMgt.SendVoucherApprovalRequest(Rec) THEN;
//                     end;
//                 }
//                 action("Cancel Approval Re&quest")
//                 {
//                     Caption = 'Cancel Approval Re&quest';
//                     ApplicationArea = all;
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
//                     ApplicationArea = all;
//                     Image = PostPrint;
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
//                     ApplicationArea = all;
//                     Image = Print;
//                 }
//             }
//         }
//     }
//     var VoucherPost: Codeunit "Voucher Post";
//     ApprovalEntries: Page "Approval Entries";
//     ReleaseVoucher: Codeunit "Voucher Release";
//     UserMgt: Codeunit "User Setup Management";
// }
