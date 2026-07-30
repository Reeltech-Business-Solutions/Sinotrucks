// page 54983 "Bank Payment Voucher"
// {
//     ApplicationArea = all;
//     Caption = 'Bank Payment Voucher';
//     PageType = Card;
//     RefreshOnActivate = true;
//     SourceTable = "Voucher Header";
//     SourceTableView = SORTING("Voucher Type", "No.")WHERE("Voucher Type"=CONST(BPV));

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
//                     Editable = false;
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
//                 field(Status; rec.Status)
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     Caption = 'Payeee';
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     Caption = 'Voucher No.';
//                     Editable = false;
//                     ApplicationArea = all;
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
//                 field("Debit Amount"; rec."Debit Amount")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Amount (LCY)"; rec."Amount (LCY)")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Budget; rec.Budget)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Expended Value"; rec."Expended Value")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//             part(Lines; "Bank Payment Voucher Subform")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Lines';
//                 SubPageLink = "Document No."=FIELD("No.");
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
//                     Caption = 'Send A&pproval Request';
//                     ApplicationArea = all;
//                     Image = SendApprovalRequest;

//                     trigger OnAction()
//                     var
//                         //ApprovalMgt: Codeunit "Approval Mgmt. ExtCal";
//                         Status1: Option Approved;
//                         PayLine: record "Voucher Line";
//                     begin
//                         //Validate(Status, Status1::Approved);
//                         /*if ApprovalMgt.CheckVouchHeaderApprovalsWorkflowEnable(Rec) then
//                             ApprovalMgt.OnSendVouchHeaderForApproval(Rec);

//                         //IF ApprovalMgt.SendVoucherApprovalRequest(Rec) THEN;
//                         VALIDATE(Status, Status::"Pending Approval");*/
//                         rec.TestField(Status, rec.Status::Open);
//                         if not LinesExists then Error('There are no Lines created for this Document');
//                         //Ensure No Items That should be committed that are not
//                         //if LinesCommitmentStatus then
//                         //  Error('There are some lines that have not been committed');
//                         //PayLine.RESET;
//                         PayLine.SetRange(PayLine."Document No.", rec."No.");
//                         if PayLine.Find('-')then begin
//                             repeat // PayLine.TESTFIELD("Applies-to Doc. No."); HABA
//                             until PayLine.Next = 0;
//                         end;
//                     //Release the PV for Approval
//                     //if ApprovalMgt.CheckVouchHeaderApprovalsWorkflowEnable(Rec) then
//                     // ApprovalMgt.OnSendVouchHeaderForApproval(Rec);RBS Dennis
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
//                     //IF ApprovalMgt.CancelVoucherApprovalRequest(Rec,TRUE,TRUE) THEN;
//                     // ApprovalMgt.OnCancelVouchHeaderForApproval(Rec);
//                     ///VALIDATE(Status, Status::Open); RBS Dennis 
//  end;
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
//                     ApplicationArea = all;
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
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50052, TRUE, FALSE, VoucherHeader);
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
//                     Promoted = false;

//                     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
//                     //PromotedIsBig = false;
//                     trigger OnAction()
//                     begin
//                         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                         VoucherHeader.SETRANGE("No.", rec."No.");
//                         IF VoucherHeader.FINDFIRST THEN REPORT.RUN(50052, TRUE, FALSE, VoucherHeader);
//                     end;
//                 }
//             }
//         }
//     }
//     procedure LinesExists(): Boolean var
//         VoucherLines: Record "Voucher Line";
//         HasLines: Boolean;
//     begin
//         HasLines:=false;
//         VoucherLines.Reset;
//         VoucherLines.SetRange(VoucherLines."Document No.", rec."No.");
//         if VoucherLines.Find('-')then begin
//             HasLines:=true;
//             exit(HasLines);
//         end;
//     end;
//     var VoucherPost: Codeunit "Voucher Post";
//     ApprovalEntries: Page "Approval Entries";
//     ReleaseVoucher: Codeunit "Voucher Release";
//     VoucherHeader: Record "Voucher Header";
// }
