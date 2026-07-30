// page 50601 "employee_picture"
// {
//     APIGroup = 'Employee_Picture';
//     APIPublisher = 'Reeltech';
//     APIVersion = 'v1.0';
//     Caption = 'employee_picture';
//     DelayedInsert = true;
//     EntityName = 'Employeepicture';
//     EntitySetName = 'Employeepictures';
//     PageType = API;
//     SourceTable = Employee;
//     ODataKeyFields = SystemId;
//     Editable = false;
//     InsertAllowed = false;

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field(Image; Rec.Image)
//                 {
//                     Caption = 'image';
//                     //Type = Media;  

//                 }
//                 field(systemId; Rec.SystemId)
//                 {
//                     Caption = 'SystemId';
//                 }

//             }
//         }
//     }
// }