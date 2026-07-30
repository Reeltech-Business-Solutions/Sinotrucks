// tableextension 54402 GenLedgerSetup extends "General Ledger Setup"
// {
//     fields
//     {
//         field(51534; "Journal Voucher Nos."; Code[10])
//         {
//             Caption = 'Journal Voucher Nos.';
//             TableRelation = "No. Series";
//         }
//         field(51535; "Cash Payment Voucher No"; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51536; "Cash Receipt Voucher No"; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51537; "Bank Payment Voucher No"; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51538; "Bank Receipt Voucher No"; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51539; "Requisition No."; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51540; "Petty Cash No."; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51541; "Retirement No."; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51542; "Loan Number Series"; Code[20])
//         {
//             TableRelation = "No. Series".Code;
//         }
//         field(51543; "Bank Transfer No"; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51544; "Refund Receipt No."; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51545; "Payment Request"; Code[10])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51546; "Expense Request Nos."; Code[20])
//         {
//         }
//         field(51547; "Bank Balances"; Decimal)
//         {
//             AutoFormatType = 1;
//             CalcFormula = Sum("Bank Account Ledger Entry"."Amount (LCY)" WHERE("Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Posting Date" = FIELD("Date Filter")));
//             Caption = 'Bank Balances';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(51548; "GjnlBatch Approval No"; Code[20])
//         {
//             TableRelation = "No. Series".Code;
//         }
//         field(51549; "LCY Code Decimals"; Code[10])
//         {
//         }
//         field(51550; "Pending L.O.P"; Decimal)
//         {
//             CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE("Shortcut Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Shortcut Dimension 2 Code" = FIELD("Global Dimension 2 Filter"), "Expected Receipt Date" = FIELD("Date Filter"), Amount = FILTER(<> 0), "Document Type" = FILTER(<> Quote)));
//             FieldClass = FlowField;
//         }
//         field(51551; "Base No. Series"; Option)
//         {
//             OptionCaption = ' ,Responsibility Center,Shortcut Dimension 1,Shortcut Dimension 2,Shortcut Dimension 3,Shortcut Dimension 4';
//             OptionMembers = " ","Responsibility Center","Shortcut Dimension 1","Shortcut Dimension 2","Shortcut Dimension 3","Shortcut Dimension 4","Shortcut Dimension 5","Shortcut Dimension 6","Shortcut Dimension 7","Shortcut Dimension 8";
//         }
//         field(51552; "Expense Code"; Code[20])
//         {
//         }
//         field(51553; "Stores Requisition No"; Code[20])
//         {
//         }
//         field(51554; "Default SA Code"; Code[20])
//         {
//             Caption = 'Default SA Code';
//             DataClassification = ToBeClassified;
//         }
//         field(51555; "Posted Contra Voucher Nos."; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51556; "Posted Journal Voucher Nos."; Code[20])
//         {
//             TableRelation = "No. Series";
//             //ApplicationArea = all;
//         }
//         field(51557; "Posted Cash Payment Voucher No"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51558; "Posted Cash Receipt Voucher No"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51559; "Posted Bank Payment Voucher No"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51560; "Posted Bank Receipt Voucher No"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51561; "Contra Voucher Nos."; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51562; "Petty Cash Voucher No"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51563; "Posted Petty Cash No"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(51564; "Default Posting Date"; Option)
//         {
//             OptionMembers = "Work Date","No Date";
//         }
//         field(50018; "Act. Emp Lia No."; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(50019; "Staff Claim No."; Code[20])
//         {
//             Caption = 'Staff Claim No';
//             TableRelation = "No. Series";
//         }
//         field(50020; "Staff Advance No."; Code[20])
//         {
//             Caption = 'Other Staff Advance No';
//             TableRelation = "No. Series";
//         }
//         field(50021; "Staff Advance Surrender No."; Code[20])
//         {
//             Caption = 'Staff Adv. Surrender No';
//             TableRelation = "No. Series";
//         }
//         field(50022; "Rent Code Nos."; Code[20])
//         {
//             Caption = 'Staff Adv. Surrender No';
//             TableRelation = "No. Series";
//         }
//         field(50016; Mandatory; Boolean)
//         {
//         }
//         field(50023; "Budget Controlled"; Boolean)
//         {


//         }
//         field(50024; "Status"; Boolean)
//         {
//         }
//         field(50025; "Change of Ownership"; Boolean)
//         {
//         }


//     }
// }
