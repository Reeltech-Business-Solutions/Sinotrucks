// report 50002 TempWorkflowUpdate
// {
//     Caption = 'TempWorkflowUpdate';
//     ProcessingOnly = true;


//     dataset
//     {
//         dataitem(WorkflowEvent; "Workflow Event")
//         {

//             trigger OnAfterGetRecord()
//             begin
//                 if "Table ID" = 54656 then begin
//                     WorkflowEvent."Table ID" := 54578;
//                     WorkflowEvent.Modify();
//                 end;
//             end;

//             trigger OnPreDataItem()
//             begin
//                 SetFilter("Table ID", '%1', 54656);
//             end;
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
// }
