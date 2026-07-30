// page 54968 "Posted CRV List"
// {
//     CardPageID = "Posted CRV";
//     DeleteAllowed = false;
//     Editable = false;
//     InsertAllowed = false;
//     ModifyAllowed = false;
//     ApplicationArea = all;
//     PageType = List;
//     SourceTable = "Posted Voucher Header";
//     UsageCategory = Lists;
//     SourceTableView = WHERE("Voucher Type"=FILTER(CRV));

//     layout
//     {
//         area(content)
//         {
//             repeater(New)
//             {
//                 field("Posting Date"; rec."Posting Date")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("No."; rec."No.")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field("Reference Voucher No."; rec."Reference Voucher No.")
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
//                     ApplicationArea = all;
//                     Editable = false;
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
//                 field("Line Account No."; rec."Line Account No.")
//                 {
//                     Caption = 'Credit Account No';
//                     ApplicationArea = all;
//                 }
//                 field("Line Account Name"; rec."Line Account Name")
//                 {
//                     Caption = 'Credit Account Name';
//                     ApplicationArea = all;
//                 }
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

//                 action(Card)
//                 {
//                     Caption = 'Card';
//                     Image = EditLines;
//                     ShortCutKey = 'Shift+F7';
//                     ApplicationArea = all;

//                     trigger OnAction()
//                     begin
//                     /*IF PostedVoucherHeader.GET("Voucher Type","No.") THEN
//                          BEGIN
//                            CASE "Voucher Type"  OF
//                              "Voucher Type"::JV :
//                                PAGE.RUN(PAGE::"Posted Journal Voucher",PostedVoucherHeader);
//                              "Voucher Type" :: CPV :
//                                PAGE.RUN(PAGE::Page50065,PostedVoucherHeader);
//                              "Voucher Type" :: CRV :
//                                PAGE.RUN(PAGE::Page50067,PostedVoucherHeader);
//                              "Voucher Type" :: BRV :
//                                PAGE.RUN(PAGE::Page50069,PostedVoucherHeader);
//                              "Voucher Type" :: BPV :
//                                PAGE.RUN(PAGE::"Purchase Request List",PostedVoucherHeader);
//                            END;
//                          END;
//                         */
//                     end;
//                 }
//             }
//         }
//     }
//     var PostedVoucherHeader: Record "Posted Voucher Header";
// }
