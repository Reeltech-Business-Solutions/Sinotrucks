// page 50133 "Employee Status Chart"
// {
//     PageType = Card;
//     Caption = 'Employee Status Chart';
//     UsageCategory = Administration;
//     ApplicationArea = All;

//     layout
//     {
//         area(Content)
//         {
//             usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
//             {
//                 ApplicationArea = All;

//                 trigger AddInReady()
//                 var
//                     Buffer: Record "Business Chart Buffer" temporary;
//                     Employee: Record "HR Employees";
//                     i: Integer;
//                     ActiveCount: Integer;
//                     InactiveCount: Integer;
//                     LastDate: Text;
//                 begin
//                     Buffer.Initialize();

//                     // Define two measures for Active and Inactive employees
//                     Buffer.AddMeasure('Active Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);
//                     Buffer.AddMeasure('Inactive Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);

//                     Buffer.SetXAxis('Date', Buffer."Data Type"::String);

//                     // Loop through employees grouped by date
//                     if Employee.FindSet then
//                         repeat
//                             LastDate := Format(Employee.SystemCreatedAt); // Assuming this field exists

//                             // Count active and inactive employees for each date
//                             if Employee.Status = Employee.Status::Active then
//                                 ActiveCount += 1
//                             else
//                                 InactiveCount += 1;

//                             // Store data in chart buffer
//                             Buffer.AddColumn(LastDate);
//                             Buffer.SetValueByIndex(0, i, ActiveCount);
//                             Buffer.SetValueByIndex(1, i, InactiveCount);

//                             i += 1;
//                         until Employee.Next() = 0;

//                     Buffer.Update(CurrPage.Chart);
//                 end;
//             }
//         }
//     }
// }

// page 50133 "Employee Status Chart"
// {
//     PageType = Card;
//     Caption = 'Employee Status Chart';
//     UsageCategory = Administration;
//     ApplicationArea = All;

//     layout
//     {
//         area(Content)
//         {
//             usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
//             {
//                 ApplicationArea = All;

//                 trigger AddInReady()
//                 var
//                     Buffer: Record "Business Chart Buffer" temporary;
//                     Employee: Record "HR Employees";
//                     i: Integer;
//                     ActiveCount: Integer;
//                     InactiveCount: Integer;
//                     LastDateTime: DateTime;
//                 begin
//                     Buffer.Initialize();

//                     // Define two measures for Active and Inactive employees
//                     Buffer.AddMeasure('Active Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);
//                     Buffer.AddMeasure('Inactive Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);

//                     Buffer.SetXAxis('Date', Buffer."Data Type"::DateTime); // Keep DateTime for grouping

//                     // Loop through employees grouped by creation date (or change date)
//                     if Employee.FindSet then
//                         repeat
//                             LastDateTime := Employee."SystemCreatedAt"; // Use SystemCreatedAt or another date field

//                             // Count active and inactive employees for each date
//                             if Employee.Status = Employee.Status::Active then
//                                 ActiveCount += 1
//                             else
//                                 InactiveCount += 1;

//                             // Add data to the buffer at each iteration for the same date
//                             Buffer.AddColumn(LastDateTime); // Group by DateTime
//                             Buffer.SetValueByIndex(0, i, ActiveCount); // Set active employee count for this date
//                             Buffer.SetValueByIndex(1, i, InactiveCount); // Set inactive employee count for this date

//                             i += 1;
//                         until Employee.Next() = 0;

//                     Buffer.Update(CurrPage.Chart);
//                 end;
//             }
//         }
//     }
// }

// page 50133 "Employee Status Chart"
// {
//     PageType = Card;
//     Caption = 'Employee Status Chart';
//     UsageCategory = Administration;
//     ApplicationArea = All;

//     layout
//     {
//         area(Content)
//         {
//             usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
//             {
//                 ApplicationArea = All;

//                 trigger AddInReady()
//                 var
//                     Buffer: Record "Business Chart Buffer" temporary;
//                     Employee: Record "HR Employees";
//                     i: Integer;
//                     ActiveCount: Integer;
//                     InactiveCount: Integer;
//                     EmployeeName: Text;
//                 begin
//                     Buffer.Initialize();

//                     // Define two measures for Active and Inactive employees
//                     Buffer.AddMeasure('Active Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);
//                     Buffer.AddMeasure('Inactive Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);

//                     Buffer.SetXAxis('Employee Name', Buffer."Data Type"::String); // Use employee name for X-axis

//                     // Loop through employees and count by name
//                     if Employee.FindSet then
//                         repeat
//                             EmployeeName := Employee.FullName(); // Use the employee's name

//                             // Count active and inactive employees for each employee
//                             if Employee.Status = Employee.Status::Active then
//                                 ActiveCount += 1
//                             else
//                                 InactiveCount += 1;

//                             // Store data in chart buffer for each employee
//                             Buffer.AddColumn(EmployeeName); // Use employee name for the X-axis
//                             Buffer.SetValueByIndex(0, i, ActiveCount); // Set active employee count for this employee
//                             Buffer.SetValueByIndex(1, i, InactiveCount); // Set inactive employee count for this employee

//                             i += 1;
//                         until Employee.Next() = 0;

//                     Buffer.Update(CurrPage.Chart);
//                 end;
//             }
//         }
//     }
// }

// page 50133 "Employee Status Chart"
// {
//     PageType = Card;
//     Caption = 'Employee Status Chart';
//     UsageCategory = Administration;
//     ApplicationArea = All;

//     layout
//     {
//         area(Content)
//         {
//             usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
//             {
//                 ApplicationArea = All;

//                 trigger AddInReady()
//                 var
//                     Buffer: Record "Business Chart Buffer" temporary;
//                     Employee: Record "HR Employees";
//                     i: Integer;
//                     ActiveCount: Integer;
//                     InactiveCount: Integer;
//                     EmployeeName: Text;
//                 begin
//                     Buffer.Initialize();

//                     // Define two measures for Active and Inactive employees
//                     Buffer.AddMeasure('Active Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);
//                     Buffer.AddMeasure('Inactive Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);

//                     Buffer.SetXAxis('Employee Name', Buffer."Data Type"::String); // Use employee name for X-axis

//                     // Loop through the first 50 employees
//                     if Employee.FindSet then
//                         repeat
//                             // Limit the records to 50 employees by checking the counter
//                             if i >= 50 then
//                                 break;

//                             EmployeeName := Employee.FullName(); // Use the employee's name

//                             // Count active and inactive employees for each employee
//                             if Employee.Status = Employee.Status::Active then
//                                 ActiveCount += 1
//                             else
//                                 InactiveCount += 1;

//                             // Store data in chart buffer for each employee
//                             Buffer.AddColumn(EmployeeName); // Use employee name for the X-axis
//                             Buffer.SetValueByIndex(0, i, ActiveCount); // Set active employee count for this employee
//                             Buffer.SetValueByIndex(1, i, InactiveCount); // Set inactive employee count for this employee

//                             i += 1;
//                         until Employee.Next() = 0;

//                     Buffer.Update(CurrPage.Chart);
//                 end;
//             }
//         }
//     }
// }

// page 50133 "Employee Status Chart"
// {
//     PageType = Card;
//     Caption = 'Employee Status Chart';
//     UsageCategory = Administration;
//     ApplicationArea = All;

//     layout
//     {
//         area(Content)
//         {
//             usercontrol(Chart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
//             {
//                 ApplicationArea = All;

//                 trigger AddInReady()
//                 var
//                     Buffer: Record "Business Chart Buffer" temporary;
//                     Employee: Record "HR Employees";
//                     i: Integer;
//                     EmployeeName: Text;
//                 begin
//                     Buffer.Initialize();

//                     // Define a measure for Active Employees
//                     Buffer.AddMeasure('Active Employees', 1, Buffer."Data Type"::Integer, Buffer."Chart Type"::Column);

//                     Buffer.SetXAxis('Employee Name', Buffer."Data Type"::String); // Use employee name for X-axis

//                     // Loop through the first 50 active employees
//                     if Employee.FindSet then
//                         repeat
//                             // Only consider active employees
//                             if Employee.Status = Employee.Status::Active then begin
//                                 EmployeeName := Employee.FullName(); // Use employee's name

//                                 // Store data in the chart buffer for each active employee
//                                 Buffer.AddColumn(EmployeeName); // Use employee name for the X-axis
//                                 Buffer.SetValueByIndex(0, i, 1); // Set 1 for each active employee

//                                 i += 1;

//                                 // Stop after 50 employees
//                                 if i >= 50 then
//                                     break;
//                             end;
//                         until Employee.Next() = 0;

//                     Buffer.Update(CurrPage.Chart);
//                 end;
//             }
//         }
//     }
// }


