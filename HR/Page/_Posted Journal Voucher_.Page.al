// page 54967 "Posted Journal Voucher"
// {
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
//                 part(Approvals; "Approval Status")
//                 {
//                     Caption = 'Approvals';
//                     SubPageLink = "Document No."=FIELD("No.");
//                     SubPageView = SORTING("Table ID", "Document Type", "Document No.", "Sequence No.");
//                     ApplicationArea = All;
//                 }
//             }
//             part(PostedVoucherList; "Posted Journal Vou. Subform")
//             {
//                 Caption = 'Lines';
//                 Editable = false;
//                 SubPageLink = "Voucher Type"=FIELD("Voucher Type"), "Document No."=FIELD("No.");
//                 ApplicationArea = All;
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
//                 ApplicationArea = All;

//                 trigger OnAction()
//                 begin
//                     pVoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//                     pVoucherHeader.SETRANGE("No.", rec."No.");
//                     If pVoucherHeader.FINDFIRST THEN REPORT.RUN(50049, TRUE, FALSE, pVoucherHeader);
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
