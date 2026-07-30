// page 54990 "Cash Payment Voucher Subform"
// {
//     AutoSplitKey = true;
//     PageType = ListPart;
//     SourceTable = "Voucher Line";
//     ApplicationArea = All;

//     layout
//     {
//         area(content)
//         {
//             repeater(new)
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
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("FA Posting Type"; rec."FA Posting Type")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                 }
//                 field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Currency Code"; rec."Currency Code")
//                 {
//                     Editable = false;
//                     ApplicationArea = all;

//                     trigger OnAssistEdit()
//                     begin
//                         ChangeExchangeRate.SetParameter(rec."Currency Code", rec."Currency Factor", rec."Posting Date");
//                         IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
//                             rec.VALIDATE(rec."Currency Factor", ChangeExchangeRate.GetParameter);
//                         END;
//                         CLEAR(ChangeExchangeRate);
//                     end;
//                 }
//                 field("Exchange Rate"; rec."Exchange Rate")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Currency Factor"; rec."Currency Factor")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
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
//                 field("Shortcut Dimension 7 Code"; rec."Shortcut Dimension 7 Code")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                 }
//                 field("Expat Name"; rec."Expat Name")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                 }
//                 field("Shortcut Dimension 8 Code"; rec."Shortcut Dimension 8 Code")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                 }
//                 field("Responsibility Center"; rec."Responsibility Center")
//                 {
//                     Editable = false;
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

//                 action(Dimension)
//                 {
//                     Caption = 'Dimension';
//                     ApplicationArea = all;

//                     trigger OnAction()
//                     begin
//                         ShowDimensions;
//                     end;
//                 }
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
//     [Scope('Cloud')]
//     procedure UpdateSubform()
//     begin
//         CurrPage.UPDATE(FALSE);
//     end;
// }
