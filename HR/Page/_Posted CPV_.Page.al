// page 54971 "Posted CPV"
// {
//     DeleteAllowed = false;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     PageType = Card;
//     SourceTable = "Posted Voucher Header";
//     ApplicationArea = all;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("No."; rec."No.")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Document Date"; rec."Document Date")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Posting Date"; rec."Posting Date")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Account Type"; rec."Account Type")
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
//                 field(Status; rec.Status)
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Reference Voucher No."; rec."Reference Voucher No.")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Debit Amount"; rec."Debit Amount")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Credit Amount"; rec."Credit Amount")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;
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
//             }
//             part(PostedVoucherList; "Posted Cash Pay Vou. Subform")
//             {
//                 ApplicationArea = all;
//                 Caption = 'Lines';
//                 Editable = false;
//                 SubPageLink = "Voucher Type"=FIELD("Voucher Type"), "Document No."=FIELD("No.");
//             }
//             group(Usertrail)
//             {
//                 Editable = false;

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
//                 field("Posted By"; rec."Posted By")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Posted By Name"; rec."Posted By Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Posted Date"; rec."Posted Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Posted Time"; rec."Posted Time")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//         }
//     }
//     actions
//     {
//         area(processing)
//         {
//             action(Print)
//             {
//                 ApplicationArea = all;

//                 trigger OnAction()
//                 begin
//                     pVoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                     pVoucherHeader.SETRANGE("No.", rec."No.");
//                     IF pVoucherHeader.FINDFIRST THEN REPORT.RUN(50056, TRUE, FALSE, pVoucherHeader);
//                 end;
//             }
//             action(Navigate)
//             {
//                 Caption = 'Navigate';
//                 Image = Navigate;
//                 ApplicationArea = all;
//                 Promoted = true;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     rec.Navigate;
//                 end;
//             }
//         }
//     }
//     var pVoucherHeader: Record "Posted Voucher Header";
// }
