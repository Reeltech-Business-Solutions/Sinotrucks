// tableextension 54401 AccountExt extends "G/L Account"
// {
//     fields
//     {
//         // Add changes to table fields here
//         field(50000; "Expense Code"; Code[20])
//         {
//             Caption = 'Expense Code';
//             //TableRelation = "Expense Code";
//             DataClassification = ToBeClassified;
//         }
//         field(50001; "Budget Controlled"; Boolean)
//         {
//             Caption = 'Budget Controlled';
//             //TableRelation = "Expense Code";
//             DataClassification = ToBeClassified;
//         }
//         field(50002; Status; Option)
//         {
//             Description = 'Stores the status of the record in the database';
//             OptionMembers = Pending, "1st Approval", "2nd Approval", "Cheque Printing", Posted, Cancelled, Checking, VoteBook, "Pending Approval", Approved;
//         }
//         field(50003; "Change of Ownership"; Boolean)
//         {
//         }
//     }
//     var myInt: Integer;
// }
