// page 54996 "Voucher List"
// {
//     CardPageID = "Journal Voucher";
//     Editable = false;
//     UsageCategory = Lists;
//     ApplicationArea = all;
//     PageType = List;
//     SourceTable = "Voucher Header";
//     AdditionalSearchTerms = 'Voucher List';
//     SourceTableView = WHERE("Voucher Type"=CONST(JV));

//     layout
//     {
//         area(content)
//         {
//             repeater(New)
//             {
//                 field("Created By"; rec."Created By")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Created Time"; rec."Created Time")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Shortcut Dimension 2 Code"; rec."Shortcut Dimension 2 Code")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("External Document No."; rec."External Document No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("No."; rec."No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Posting Date"; rec."Posting Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Status; rec.Status)
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
//                 field(Amount; Amount)
//                 {
//                     Visible = false;
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//             }
//         }
//     }
//     actions
//     {
//     }
//     trigger OnAfterGetRecord()
//     begin
//         CalcTotals;
//     end;
//     var Amount: Decimal;
//     TotalAmount: Decimal;
//     VoucherHeader: Record "Voucher Header";
//     TotalCredit: Decimal;
//     [Scope('Cloud')]
//     procedure CalcTotals()
//     begin
//         VoucherHeader.COPY(Rec);
//         TotalAmount:=0;
//         TotalCredit:=0;
//         VoucherHeader.SETRANGE("Voucher Type", rec."Voucher Type");
//         IF VoucherHeader.FINDSET THEN REPEAT VoucherHeader.CALCFIELDS("Debit Amount");
//                 VoucherHeader.CALCFIELDS("Credit Amount");
//                 TotalAmount:=TotalAmount + VoucherHeader."Debit Amount";
//                 TotalCredit:=TotalCredit + VoucherHeader."Credit Amount";
//             UNTIL VoucherHeader.NEXT = 0;
//     end;
// }
