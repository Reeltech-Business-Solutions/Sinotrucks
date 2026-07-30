// page 54988 "Bank Receipt Voucher"
// {
//     Caption = 'Bank Receipt Voucher';
//     ApplicationArea = All;
//     PageType = Card;
//     RefreshOnActivate = false;
//     SourceTable = "Voucher Header";
//     SourceTableView = SORTING("Voucher Type", "No.")WHERE("Voucher Type"=CONST(BRV));

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; rec."No.")
//                 {
//                     ApplicationArea = All;

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
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Account No."; rec."Account No.")
//                 {
//                     Caption = 'Account Code';
//                     ApplicationArea = all;
//                 }
//                 field("Account Name"; rec."Account Name")
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
//                     Editable = false;
//                 }
//                 field("Currency Code"; rec."Currency Code")
//                 {
//                     ApplicationArea = All;

//                     trigger OnAssistEdit()
//                     begin
//                         ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", rec."Posting Date");
//                         IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
//                             rec.VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
//                         END;
//                         CLEAR(ChangeExchangeRate);
//                     end;
//                 }
//                 field(Status; rec.Status)
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     caption = 'Payee';
//                     ApplicationArea = all;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     Caption = 'BRV No.';
//                     ApplicationArea = all;
//                 }
//                 field("Debit Amount"; rec."Debit Amount")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Credit Amount"; rec."Credit Amount")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Posting No. Series"; rec."Posting No. Series")
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//             part(voucherline; "Bank Receipt Voucher Subform")
//             {
//                 Caption = 'Voucher Lines';
//                 SubPageLink = "Document No."=FIELD("No.");
//                 ApplicationArea = All;
//             }
//             group(Usertrail)
//             {
//                 field("Created By"; rec."Created By")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Created By Name"; rec."Created By Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Created Date"; rec."Created Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Created Time"; rec."Created Time")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Modified By"; rec."Modified By")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Modified By Name"; rec."Modified By Name")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Modified Date"; rec."Modified Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Modified Time"; rec."Modified Time")
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             part(ApprovalStatus; "Approval Status")
//             {
//                 ApplicationArea = All;
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
//                     ApplicationArea = all;
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
//                     Caption = 'A&pprovals';
//                     ApplicationArea = all;

//                     trigger OnAction()
//                     var
//                         ApprovalEntries: Page "Approval Entries";
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
//                         //ReleaseVoucher.PerformManualRelease(Rec);
//                         rec.VALIDATE(Status, rec.Status::Released);
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
//                     ApplicationArea = All;
//                     Caption = 'Send A&pproval Request';
//                     Image = SendApprovalRequest;

//                     trigger OnAction()
//                     begin
//                         //IF ApprovalMgt.SendVoucherApprovalRequest(Rec) THEN;
//                         rec.VALIDATE(Status, rec.Status::"Pending Approval");
//                     end;
//                 }
//                 action("Cancel Approval Re&quest")
//                 {
//                     ApplicationArea = All;
//                     Caption = 'Cancel Approval Re&quest';
//                     Image = Cancel;

//                     trigger OnAction()
//                     begin
//                         //IF ApprovalMgt.CancelVoucherApprovalRequest(Rec,TRUE,TRUE) THEN;
//                         rec.VALIDATE(Status, rec.Status::Open);
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
//                     Ellipsis = false;
//                     Image = Post;
//                     ApplicationArea = all;
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
//                     Caption = 'Post and &Print';
//                     Ellipsis = true;
//                     Image = PostPrint;
//                     ApplicationArea = all;
//                     Promoted = true;
//                     PromotedCategory = Process;
//                     PromotedIsBig = true;
//                     ShortCutKey = 'Shift+F9';
//                     Visible = false;

//                     trigger OnAction()
//                     begin
//                         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                         VoucherHeader.SETRANGE("No.", rec."No.");
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50051, TRUE, FALSE, VoucherHeader);
//                         VoucherPost.RUN(Rec);
//                     end;
//                 }
//             }
//             group("&Print")
//             {
//                 Caption = '&Print';

//                 action("Print Voucher")
//                 {
//                     Caption = 'Print Voucher';
//                     ApplicationArea = all;
//                     Promoted = false;

//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = false;
//                     trigger OnAction()
//                     begin
//                         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                         VoucherHeader.SETRANGE("No.", rec."No.");
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50051, TRUE, FALSE, VoucherHeader);
//                     end;
//                 }
//             }
//         }
//     }
//     var VoucherPost: Codeunit "Voucher Post";
//     ApprovalEntries1: Page "Approval Entries";
//     ReleaseVoucher: Codeunit "Voucher Release";
//     VoucherHeader: Record "Voucher Header";
//     ChangeExchangeRate: Page "Change Exchange Rate";
// }
