// page 54997 "Voucher Subform"
// {
//     AutoSplitKey = true;
//     PageType = ListPart;
//     SourceTable = "Voucher Line";
//     ApplicationArea = All;

//     layout
//     {
//         area(content)
//         {
//             repeater(New)
//             {
//                 field(Account; rec.Account)
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
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Currency Code"; rec."Currency Code")
//                 {
//                     ApplicationArea = All;

//                     trigger OnAssistEdit()
//                     begin
//                         ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", rec."Posting Date");
//                         If ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
//                             rec.VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
//                         END;
//                         CLEAR(ChangeExchangeRate);
//                     end;
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
//                 field("Bal. Account Type"; rec."Bal. Account Type")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Bal. Account No."; rec."Bal. Account No.")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
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
//                 field("FA Posting Type"; rec."FA Posting Type")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 7 Code"; rec."Shortcut Dimension 7 Code")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 8 Code"; rec."Shortcut Dimension 8 Code")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Posting Group"; rec."Posting Group")
//                 {
//                     ApplicationArea = all;
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
//         }
//     }
//     trigger OnAfterGetRecord()
//     begin
//         rec.ShowShortcutDimCode(ShortcutDimCode);
//     end;
//     trigger OnNewRecord(BelowxRec: Boolean)
//     begin
//         CLEAR(ShortcutDimCode);
//     end;
//     var CurrentJnlBatchName: Code[10];
//     ChangeExchangeRate: Page "Change Exchange Rate";
//     ShortcutDimCode: array[15]of Code[20];
//     VoucherHeader: Record "Voucher Header";
//     [Scope('Cloud')]
//     procedure ShowDimensions()
//     begin
//         Rec.ShowDimensions;
//     end;
// }
