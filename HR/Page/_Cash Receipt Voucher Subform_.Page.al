// page 54993 "Cash Receipt Voucher Subform"
// {
//     ApplicationArea = All;
//     AutoSplitKey = true;
//     PageType = ListPart;
//     SourceTable = "Voucher Line";
//     SourceTableView = SORTING("Voucher Type", "Document No.", "Line No.")WHERE("Voucher Type"=FILTER(CRV));

//     layout
//     {
//         area(content)
//         {
//             repeater(New)
//             {
//                 field(Account; rec.Account)
//                 {
//                     ApplicationArea = All;

//                     trigger OnValidate()
//                     begin
//                         //ShowShortcutDimCode(ShortcutDimCode);
//                         Clear(rec."Account No.");
//                         Clear(rec."Account Name");
//                     end;
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
//                     caption = 'Receipt No.';
//                     ApplicationArea = All;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Teller / Cheque No."; rec."Teller / Cheque No.")
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
//                 field("Amount (LCY)"; rec."Amount (LCY)")
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
//                 field("Shortcut Dimension 3 Code"; rec."Shortcut Dimension 3 Code")
//                 {
//                     // Visible = false;
//                     ApplicationArea = All;
//                 }
//                 field("Shortcut Dimension 4 Code"; rec."Shortcut Dimension 4 Code")
//                 {
//                     // Visible = false;
//                     ApplicationArea = All;
//                 }
//                 field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Posting Group"; rec."Posting Group")
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
//             group("&Line")
//             {
//                 Caption = '&Line';

//                 action(Dimensions)
//                 {
//                     Caption = 'Dimensions';
//                     ApplicationArea = All;

//                     trigger OnAction()
//                     begin
//                         ShowDimensions;
//                     end;
//                 }
//             }
//             action("Apply Entries")
//             {
//                 Caption = 'Apply Entries';
//                 ApplicationArea = all;
//                 RunObject = Codeunit "Voucher Apply Entries";
//             }
//         }
//     }
//     var JVHeader: Record "Voucher Header";
//     GenJrnlLine: Record "Gen. Journal Line";
//     ReportPrint: Codeunit "Test Report-Print";
//     CurrentJnlBatchName: Code[10];
//     ChangeExchangeRate: Page "Change Exchange Rate";
//     [Scope('Cloud')]
//     procedure ShowDimensions()
//     begin
//         Rec.ShowDimensions;
//     end;
// }
