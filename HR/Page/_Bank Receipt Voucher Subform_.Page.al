// page 54986 "Bank Receipt Voucher Subform"
// {
//     AutoSplitKey = true;
//     ApplicationArea = All;
//     PageType = ListPart;
//     SourceTable = "Voucher Line";
//     SourceTableView = SORTING("Voucher Type", "Document No.", "Line No.")WHERE("Voucher Type"=FILTER(BRV));

//     layout
//     {
//         area(content)
//         {
//             repeater(BRVS)
//             {
//                 field(Account; rec.Account)
//                 {
//                     ApplicationArea = All;

//                     trigger OnValidate()
//                     begin
//                         rec.ShowShortcutDimCode(ShortcutDimCode);
//                         Clear(rec."Account No.");
//                         Clear(rec."Account Name");
//                     end;
//                 }
//                 field("Account No."; rec."Account No.")
//                 {
//                     ApplicationArea = All;

//                     trigger OnValidate()
//                     begin
//                         rec.ShowShortcutDimCode(ShortcutDimCode);
//                     end;
//                 }
//                 field("Account Name"; rec."Account Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     caption = 'Receipt No.';
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
//                 field("Teller / Cheque No."; rec."Teller / Cheque No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Credit Amount"; rec."Credit Amount")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Debit Amount"; rec."Debit Amount")
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Amount (LCY)"; rec."Amount (LCY)")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
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
//                 field("Shortcut Dimension 5 Code"; rec."Shortcut Dimension 5 Code")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Responsibility Center"; rec."Responsibility Center")
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
//                     ApplicationArea = all;

//                     trigger OnAction()
//                     begin
//                         ShowDimensions;
//                     end;
//                 }
//             }
//             action("Apply Entries")
//             {
//                 Caption = 'Apply Entries';
//                 Image = ApplyEntries;
//                 Promoted = true;
//                 ApplicationArea = all;
//                 PromotedIsBig = true;
//                 RunObject = Codeunit "Voucher Apply Entries";
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
//     var JVHeader: Record "Voucher Header";
//     GenJrnlLine: Record "Gen. Journal Line";
//     ReportPrint: Codeunit "Test Report-Print";
//     CurrentJnlBatchName: Code[10];
//     ChangeExchangeRate: Page "Change Exchange Rate";
//     ShortcutDimCode: array[8]of Code[20];
//     [Scope('Cloud')]
//     procedure ShowDimensions()
//     begin
//         Rec.ShowDimensions;
//     end;
// }
