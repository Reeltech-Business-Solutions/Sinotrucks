// page 54962 "Posted Approval Status"
// {
//     PageType = Card;
//     SourceTable = "Posted Approval Entry";
//     ApplicationArea = all;

//     layout
//     {
//         area(content)
//         {
//             repeater(New)
//             {
//                 Editable = false;

//                 field("Approver ID"; rec."Approver ID")
//                 {
//                     ApplicationArea = all;
//                     Editable = false;
//                 }
//                 field(Status; rec.Status)
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
// }
