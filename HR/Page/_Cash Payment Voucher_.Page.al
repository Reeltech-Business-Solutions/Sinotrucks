// page 54989 "Cash Payment Voucher"
// {
//     ApplicationArea = all;
//     Caption = 'Cash Payment Voucher';
//     PageType = Card;
//     RefreshOnActivate = true;
//     SourceTable = "Voucher Header";
//     SourceTableView = SORTING("Voucher Type", "No.")WHERE("Voucher Type"=CONST(CPV));

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
//                 field("Account Type"; rec."Account Type")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
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
//                 field("Expense Request No."; rec."Expense Request No.")
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
//                 field("Responsibility Center"; rec."Responsibility Center")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                 }
//                 field(Status; rec.Status)
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
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
//                 field("Currency Code"; rec."Currency Code")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Exchange Rate"; rec."Exchange Rate")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//             part(voucherline; "Cash Payment Voucher Subform")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Voucher Lines';
//                 SubPageLink = "Voucher Type"=FIELD("Voucher Type"), "Document No."=FIELD("No.");
//             }
//             group(Usertrail)
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
//                     ApplicationArea = all;
//                     Caption = 'Dimensions';
//                     Image = Dimensions;
//                     Promoted = true;
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
//                     ApplicationArea = all;
//                     Caption = 'Re&lease';
//                     Image = ReleaseDoc;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     ShortCutKey = 'Ctrl+F9';

//                     trigger OnAction()
//                     begin
//                         //ReleaseVoucher.PerformManualRelease(Rec);
//                         rec.VALIDATE(Status, rec.Status::Released);
//                     end;
//                 }
//                 action(Reopen)
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Re&open';
//                     Image = ReOpen;
//                     Promoted = true;
//                     PromotedCategory = Process;

//                     trigger OnAction()
//                     begin
//                         //ReleaseVoucher.PerformManualReopen(Rec);
//                         rec.VALIDATE(Status, rec.Status::Open);
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
//                         // IF ApprovalsMgmt.CheckVoucherApprovalPossible(Rec) THEN
//                         //  ApprovalsMgmt.OnSendVoucherDocForApproval(Rec);
//                         rec.VALIDATE(Status, rec.Status::"Pending Approval");
//                     end;
//                 }
//                 action("Cancel Approval Re&quest")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Cancel Approval Re&quest';
//                     Image = Cancel;

//                     trigger OnAction()
//                     begin
//                         //IF ApprovalMgt.CancelVoucherApprovalRequest(Rec,TRUE,TRUE) THEN;
//                         rec.VALIDATE(rec.Status, rec.Status::Open);
//                     end;
//                 }
//                 action("Get Request Line")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Get Cash Request';
//                     Image = CopyDocument;

//                     trigger OnAction()
//                     begin
//                     //ExpReqMgt.GetExpenseReqLine(Rec);
//                     //CurrPage.voucherline.PAGE.UpdateSubform;
//                     end;
//                 }
//             }
//             group("P&osting")
//             {
//                 Caption = 'P&osting';

//                 action("Test Report")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Test Report';
//                     Ellipsis = true;
//                     Image = TestReport;
//                     Visible = false;
//                 }
//                 action("P&ost")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'P&ost';
//                     Ellipsis = false;
//                     Image = Post;
//                     Promoted = false;
//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = false;
//                     ShortCutKey = 'F9';

//                     trigger OnAction()
//                     begin
//                         /*Usersetup.GET(USERID);
//                         IF NOT Usersetup."Post Voucher" THEN
//                           ERROR('You do not have permision to post the Voucher....!');*/
//                         IF NOT CONFIRM('Are you sure you want to post the voucher')THEN EXIT;
//                         VoucherPost.RUN(Rec);
//                     end;
//                 }
//                 action("Post and &Print")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Post and &Print';
//                     Ellipsis = true;
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

//                 action("Print Voucher")
//                 {
//                     ApplicationArea = all;
//                     Caption = 'Print Voucher';
//                     Promoted = false;

//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = false;
//                     trigger OnAction()
//                     begin
//                         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                         VoucherHeader.SETRANGE("No.", rec."No.");
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50054, TRUE, FALSE, VoucherHeader);
//                     end;
//                 }
//             }
//         }
//     }
//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         //"Responsibility Center" := UserMgt.GetGenJnLFilter();
//         rec."Account Type":=rec."Account Type"::"Bank Account";
//     end;
//     trigger OnOpenPage()
//     begin
//         rec."Account Type":=rec."Account Type"::"Bank Account";
//     end;
//     var VoucherPost: Codeunit "Voucher Post";
//     ApprovalEntries: Page "Approval Entries";
//     ReleaseVoucher: Codeunit "Voucher Release";
//     VoucherHeader: Record "Voucher Header";
//     UserMgt: Codeunit "User Setup Management";
//     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
// //: Codeunit "ExpenseReqMgt";
// }
