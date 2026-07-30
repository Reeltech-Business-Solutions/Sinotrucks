// page 54973 "Posted Cash Pay Vou. Subform"
// {
//     AutoSplitKey = true;
//     PageType = ListPart;
//     SourceTable = "Posted Voucher Line";
//     ApplicationArea = all;

//     layout
//     {
//         area(content)
//         {
//             repeater(New)
//             {
//                 field("Posting Date"; rec."Posting Date")
//                 {
//                     Visible = false;
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
//                 field(Narration; rec.Narration)
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     Caption = 'Voucher No.';
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
//                 field(Amount; rec.Amount)
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
//                 field("Currency Code"; rec."Currency Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Exchange Rate"; rec."Exchange Rate")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Currency Factor"; rec."Currency Factor")
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
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 4 Code"; rec."Shortcut Dimension 4 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 5 Code"; rec."Shortcut Dimension 5 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 6 Code"; rec."Shortcut Dimension 6 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 7 Code"; rec."Shortcut Dimension 7 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Responsibility Center"; rec."Responsibility Center")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//         }
//     }
//     actions
//     {
//     }
//     [Scope('Cloud')]
//     procedure ShowLineDimension()
//     begin
//         Rec.ShowDimensions;
//     end;
// }
