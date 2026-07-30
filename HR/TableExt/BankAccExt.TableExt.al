// tableextension 54406 BankAccExt extends "Bank Account" //MyTargetTableId
// {
//     fields
//     {
//         field(51534; "Bank Type"; Option)
//         {
//             Caption = 'Bank Type';
//             DataClassification = ToBeClassified;
//             OptionMembers = , Normal, Cash, "Fixed Deposit", SMPA, "Chq Collection";
//         //OptionCaption = 'Default';
//         }
//         field(51535; Cash; Boolean)
//         {
//         }
//         field(51536; "G/L Account No."; Code[20])
//         {
//         //CalcFormula = Lookup("Bank Account Posting Group"."G/L Bank Account No." WHERE(Code = FIELD("Bank Acc. Posting Group")));
//         //FieldClass = FlowField;
//         }
//         field(51537; Bank; Boolean)
//         {
//         }
//         field(51538; "Other Ledger"; Boolean)
//         {
//         }
//     }
// }
