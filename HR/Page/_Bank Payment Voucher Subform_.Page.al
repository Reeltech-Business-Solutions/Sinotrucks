// page 54984 "Bank Payment Voucher Subform"
// {
//     ApplicationArea = all;
//     AutoSplitKey = true;
//     PageType = ListPart;
//     SourceTable = "Voucher Line";
//     MultipleNewLines = true;
//     SourceTableView = SORTING("Voucher Type", "Document No.", "Line No.")WHERE("Voucher Type"=FILTER(BPV));

//     layout
//     {
//         area(content)
//         {
//             repeater(BPVS)
//             {
//                 field(Account; rec.Account)
//                 {
//                     ApplicationArea = all;

//                     trigger OnValidate()
//                     begin
//                         //ShowShortcutDimCode(ShortcutDimCode);
//                         Clear(rec."Account No.");
//                         Clear(rec."Account Name");
//                     end;
//                 }
//                 field("Account Type"; rec."Account Type")
//                 {
//                     Visible = false;
//                     Editable = false;
//                     ApplicationArea = all;
//                 }
//                 field("Account No."; rec."Account No.")
//                 {
//                     //Visible = False;
//                     ApplicationArea = all;
//                 }
//                 field("Account Name"; rec."Account Name")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Currency Code"; rec."Currency Code")
//                 {
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
//                     ApplicationArea = all;
//                     Visible = false;
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
//                 field("Teller / Cheque No."; rec."Teller / Cheque No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Applies-to Doc. No."; rec."Applies-to Doc. No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Customer No."; rec."Customer No.")
//                 {
//                     Caption = 'Client No.';
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Customer Name"; rec."Customer Name")
//                 {
//                     Caption = 'Client Name';
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 1 Code"; rec."Shortcut Dimension 1 Code")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
//                 {
//                     //  Visible = false;
//                     ApplicationArea = all;
//                 }
//                 field("Shortcut Dimension 3 Code"; rec."Shortcut Dimension 3 Code")
//                 {
//                     ApplicationArea = all;
//                 // Visible = false;
//                 }
//                 field("Shortcut Dimension 4 Code"; rec."Shortcut Dimension 4 Code")
//                 {
//                     ApplicationArea = all;
//                 // Visible = false;
//                 }
//                 field("No. Series"; rec."No. Series")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("Posting No. Series"; rec."Posting No. Series")
//                 {
//                     ApplicationArea = all;
//                     Visible = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     caption = 'Voucher No.';
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
// }
