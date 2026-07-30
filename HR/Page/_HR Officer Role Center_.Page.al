page 54645 "HR Officer Role Center"
{
    ApplicationArea = All;
    Caption = 'HR Officer Role Center';
    PageType = RoleCenter;
    // SourceTable = "All Profile";

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                systempart(Control1901420308; Outlook)
                {
                }
            }
            group(Control1900724708)
            {
                part(Control17; "My Job Queue")
                {
                    Visible = false;
                }
                part(Control1907692008; "My Customers")
                {
                    Visible = false;
                }
                part(Control1902476008; "My Vendors")
                {
                    Visible = false;
                }
                systempart(Control1901377608; MyNotes)
                {
                }
            }
        }
    }
    actions
    {
        area(reporting)
        {
            action(Payslip)
            {
                Caption = 'Payslip';
                ApplicationArea = All;
                Visible = false;
                RunObject = Report "prPaySlip2 Non Taxable2";
            }
            action("Employee List")
            {
                Caption = 'Employee List';
            }
            action("Negative Pay List")
            {
                Caption = 'Payslip';
                ApplicationArea = All;
                Visible = false;
            }
            action("Payroll Summary")
            {
                Caption = 'Payroll Summary';
                ApplicationArea = All;
                RunObject = Report "Payroll Summary";
            }
            action("Basic Pay Listing")
            {
                Caption = 'Basic Pay Listing';
                ApplicationArea = All;
                RunObject = Report "Basic Pay Listing";
            }
            action("Contract Summary Analysis-Dep")
            {
                ApplicationArea = All;
            }
            action("Contract Summary Analysis")
            {
                ApplicationArea = All;
            }
            action("Transactions - Summary")
            {
                Caption = 'Transactions - Summary';
                ApplicationArea = All;
                RunObject = Report "Transactions Summary";
            }
            action("Transactions - Detailed")
            {
                Caption = 'Transactions - Detailed';
                ApplicationArea = All;
                RunObject = Report "Transactions - Detailed";
            }
            action("Employee Earnings Summary")
            {
                Caption = 'Employee Earnings Summary';
                ApplicationArea = All;
            }
            action("Employee Transaction History")
            {
                Caption = 'Employee Transaction History';
                ApplicationArea = All;
                RunObject = Report "prLoan Payment History";
            }
            action("Staff Pension Contribution")
            {
                Caption = 'Staff Pension Contribution';
                ApplicationArea = All;
                RunObject = Report "prStaff Pension Contrib";
            }
            action("Pension Advice Summary")
            {
                Caption = 'Pension Advice Summary';
                ApplicationArea = All;
                RunObject = Report "Pension Advice Summary";
            }
            action("Gross & Net Pay Schedule")
            {
                Caption = 'Gross & Net Pay Schedule';
                ApplicationArea = All;
                RunObject = Report "Gross & Net Pay Schedule";
            }
            action("NISTF Schedule")
            {
                Caption = 'NSITF Schedule';
                ApplicationArea = All;
                RunObject = Report "NSITF Schedule";
            }
            action("NHF Schedule")
            {
                Caption = 'NHF Schedule';
                ApplicationArea = All;
                RunObject = Report "NHF Schedule";
            }
            action("PAYE Schedule")
            {
                Caption = 'PAYE Schedule';
                ApplicationArea = All;
                RunObject = Report "prPaye Schedule";
            }
            action("Bank Payment Schedule")
            {
                Caption = 'Bank Payment Schedule';
                ApplicationArea = All;
            }
            action("Bank Payment Schedule - Transaction")
            {
                Caption = 'Bank Payment Schedule - Transaction';
                ApplicationArea = All;
                RunObject = Report "Bank Payment Schedule";
            }
            action("Bank Advise Summary")
            {
                Caption = 'Bank Advise Summary';
                ApplicationArea = All;
                RunObject = Report "Bank Advise Summary";
            }
            action("Overtime Report")
            {
                Caption = 'Overtime Report';
                Visible = false;
                ApplicationArea = All;
            }
            action(Loans)
            {
                Caption = 'Loans';
                Visible = false;
                ApplicationArea = All;
            }
            action("Deductions to Organizations")
            {
                Caption = 'Deductions to Organizations';
                ApplicationArea = All;
                RunObject = Report "Deductions to Organizations";
            }
            action("Other Deductions")
            {
                Caption = 'Other Deductions';
                ApplicationArea = All;
                RunObject = Report "Other Deductions";
            }
            action("Staff Pension Balance")
            {
                Caption = 'Staff Pension Balance';
                ApplicationArea = All;
                RunObject = Report "prStaff Pension Balance";
            }
            action("Generate Reconcilliation")
            {
                Caption = 'Generate Reconcilliation';
                ApplicationArea = All;
                RunObject = Page "Salary List";
            }
            action("Gross Reconcilliation")
            {
                Caption = 'Gross Reconcilliation';
                ApplicationArea = All;
                RunObject = report "Gross Reconcilliation";
            }
            action("Reconciliations - By Transactions")
            {
                Caption = 'Reconciliations - By Transactions';
                ApplicationArea = All;
            }
            action("Reconciliations - By Employee")
            {
                Caption = 'Reconciliations - By Employee';
                ApplicationArea = All;
                RunObject = Report "Reconciliation - By Employee";
            }
            action("Reconciliations - By Entry/Exits")
            {
                Caption = 'Reconciliations - By Entry/Exits';
                ApplicationArea = All;
                RunObject = Report "Reconciliation - By Entry/Exit";
            }
            action("Reconciliations - Summary")
            {
                Caption = 'Reconciliations - Summary';
                ApplicationArea = All;
                RunObject = Report "Reconciliations - Summary";
            }
            action("Reconciliations - Summary Changes")
            {
                Caption = 'Reconciliations - Summary Changes';
                ApplicationArea = All;
                RunObject = Report "Reconciliations - Summary Ch";
            }
            action("Payroll Journal")
            {
                Caption = 'Payroll Journal';
                ApplicationArea = All;
                RunObject = Report "Payroll Journal";
            }
            action(Action1102755082)
            {
                Caption = 'Overtime Report';
                ApplicationArea = All;
            }
            action("Overtime Report - By Department")
            {
                Caption = 'Overtime Report - By Department';
                ApplicationArea = All;
            }
            action("Overtime Report - By Location Summary")
            {
                Caption = 'Overtime Report - By Location Summary';
                ApplicationArea = All;
            }
            action("Payroll Summary - SUG")
            {
                Caption = 'Payroll Summary - SUG';
                ApplicationArea = All;
            }
            action("Payroll Summary - AGRO")
            {
                Caption = 'Payslip';
                ApplicationArea = All;
            }
            action("Payroll Summary - By Location")
            {
                Caption = 'Payroll Summary - By Location';
                ApplicationArea = All;
            }
            action("Payroll Summary - By Location Summary")
            {
                Caption = 'Payroll Summary - By Location Summary';
                ApplicationArea = All;
            }
            action("Detailed Payroll Summary")
            {
                Caption = 'Detailed Payroll Summary';
                ApplicationArea = All;
                RunObject = Report "Payroll Summary Detailed";
            }
            separator(Action1000000001)
            {
            }
            action("Emp. Payslip")
            {
                Caption = 'Emp. Payslip';
                ApplicationArea = All;
                RunObject = Report "prPaySlipPerEmp";
            }
        }
        area(embedding)
        {
            action("General Journals")
            {
                Caption = 'General Journals';
                Visible = false;
                ApplicationArea = All;
            }
            action(Salary)
            {
                Caption = 'Salary';
                ApplicationArea = All;
                RunObject = Page "Salary List";
            }
            action("Update Employee Transactions")
            {
                Caption = 'Update Employee Transactions';
                ApplicationArea = All;
                RunObject = Page "Employee Transaction List";
            }
            action("Salary(All)")
            {
                Caption = 'Salary(All)';
                ApplicationArea = All;
                RunObject = Page "Salary List Admin";
            }
            action("Employee Loans")
            {
                Caption = 'Employee Loans';
                Visible = false;
                ApplicationArea = All;
            }
            action("Processed Employee Loans")
            {
                Caption = 'Processed Employee Loans';
                Visible = false;
                ApplicationArea = All;
            }
            action("Staff Loan Accounts")
            {
                Caption = 'Staff Loan Accounts';
                Visible = false;
                ApplicationArea = All;
            }
            action("Staff Loans HR")
            {
                Visible = false;
                ApplicationArea = All;
            }
            action(aaa)
            {
                Caption = 'Approved Leave Applications';
                ApplicationArea = All;
                RunObject = Page "HR Leave Applications Admin";
            }
            action("Posted Leave Applications")
            {
                ApplicationArea = All;
                RunObject = Page "Posted Leave Applications";
            }
            action("Payment Journals")
            {
                Caption = 'Payment Journals';
                ApplicationArea = All;
                Visible = false;
            }
        }
        area(sections)
        {
            group("Employee Management")
            {
                Caption = 'Employee Management';

                action(Employees)
                {
                    Caption = 'Employees';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Employees Management")
                {
                    Caption = 'Employees Management';
                    ApplicationArea = All;
                    RunObject = Page "HR Employee List";
                }
                action("Employee Absence Registration")
                {
                    Caption = 'Employees Management';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Inactive Employees")
                {
                    Caption = 'Inactive Employees';
                    ApplicationArea = All;
                    RunObject = Page "HR Inactive Employees";
                }
                action("Complaint Form")
                {
                    Caption = 'Complaint Form';
                    ApplicationArea = All;
                    RunObject = Page "Complaint form list page";
                    RunPageView = where(Status = const(Open));
                }
                action("ComplaintForm")
                {
                    Caption = 'Closed Complaint Form';
                    ApplicationArea = All;
                    RunObject = Page "Complaint form list page";
                    RunPageView = where(Status = filter(Closed));
                }
                action("Dept. Level 1")
                {
                    Caption = 'Dept. Level 1';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Dept. Level 2")
                {
                    Caption = 'Dept. Level 2';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Group")
                {
                    Caption = 'Group';
                    ApplicationArea = All;
                    RunObject = Page "Dimension Values";
                    RunPageView = where("Dimension Code" = const('DEPARTMENT'));
                }
                action("Dept. Level")
                {
                    Caption = 'Deptment Level';
                    ApplicationArea = All;
                    RunObject = Page "Dept.";
                }
                action(Unit)
                {
                    Caption = 'Unit';
                    ApplicationArea = All;
                    RunObject = Page "Sub. Dept";
                }
            }
            group("Recruitment Manager")
            {
                Caption = 'Recruitment Manager';

                action(Jobs)
                {
                    Caption = 'Jobs';
                    ApplicationArea = All;
                    RunObject = Page "HR Jobs List";
                }
                action("New Employee Requisitons")
                {
                    Caption = 'New Employee Requisitons';
                    ApplicationArea = All;
                    RunObject = Page "HR Employee Requisitions List";
                    RunPageView = where(Status = const(New));
                }
                action("Employee Requisitons")
                {
                    Caption = 'Employee Requisitons';
                    ApplicationArea = All;
                    RunObject = Page "HR Employee Requisitions List";
                }
                action("Job Applications")
                {
                    Caption = 'Job Applications';
                    ApplicationArea = All;
                    RunObject = Page "HR Job Applications List";
                }
                action("Applicants Test")
                {
                    Caption = 'Applicants Test';
                    ApplicationArea = All;
                    RunObject = Page "Hr Test List";
                }
                action(Shortlisting)
                {
                    Caption = 'Shortlisting';
                    ApplicationArea = All;
                    RunObject = Page "HR Shortlisting List";
                }
                action("Shortlisted Applicants")
                {
                    Caption = 'Shortlisted Applicants';
                    ApplicationArea = All;
                    RunObject = Page "Hr Shortlisted Applicant";
                }
                action("Interview Evaluation")
                {
                    Caption = 'Interview Evaluation';
                    ApplicationArea = All;
                    RunObject = page "Hr interview Evaluation List";
                }
                action("<Page Keep In-view Evaluation ")
                {
                    Caption = 'Keep In-view';
                    ApplicationArea = All;
                    RunObject = page "Keep In-view Evaluation List";
                }
                action("HR Interview Rating List")
                {
                    Caption = 'HR Interview Rating List';
                    ApplicationArea = All;
                    RunObject = Page "HR Interview Rating List";
                }
                action("HR Oral Interview Group")
                {
                    Caption = 'HR Interview Group';
                    ApplicationArea = All;
                    RunObject = Page "HR Oral Interview Group";
                }
                action("Shortlisting List (Test)")
                {
                    Caption = 'Shortlisting List (Test)';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("HR Interview Evaluation Areas")
                {
                    Caption = 'HR Interview Evaluation Areas';
                    ApplicationArea = All;
                    RunObject = Page "Hr Interview Evaluation Areas";
                }
                action("Shortlisting List Interview")
                {
                    Caption = 'Shortlisting List Interview';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Shortlisted Candidates Interview")
                {
                    Caption = 'Shortlisted Candidates Interview';
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            group("Leave Management")
            {
                Caption = 'Leave Management';

                action("Leave Types")
                {
                    Caption = 'Leave Types';
                    ApplicationArea = All;
                    RunObject = Page "HR Leave Types";
                }
                action(" New Leave Applications")
                {
                    Caption = 'New Leave Applications';
                    ApplicationArea = All;
                    RunObject = Page "HR Leave Applications List";
                    RunPageView = where(Status = const("New"));
                }
                action("Leave Applications")
                {
                    Caption = 'Leave Applications';
                    ApplicationArea = All;
                    RunObject = Page "HR ApprovedLeaveList";
                    //  RunPageView = WHERE(Status = FILTER(Approved | "Pending Approval"));
                }
                action("Leave Acknowledgements")
                {
                    Caption = 'Leave Acknowledgements';
                    ApplicationArea = All;
                    RunObject = Page "HR Leave Acknowledgments";
                    // RunPageView = WHERE(Status = FILTER(Approved | Pending));
                    RunPageView = where(Status = filter(Updated | Pending | "Pending Approval" | Approved));
                }
                action("Leave Journal")
                {
                    Caption = 'Leave Journal';
                    ApplicationArea = All;
                    RunObject = page "HR Leave Batches";
                }

            }

            group("Benefit & Compensation")
            {
                caption = 'Benefit & Compensation';
                visible = false;

                action("Employee &List")
                {
                    caption = 'Employee List';
                    ApplicationArea = All;
                    RunObject = page "HR Employee List";
                }

                action("H&MO")
                {
                    caption = 'HMO';
                    ApplicationArea = All;
                    RunObject = page "HR HMO List";
                }


                action("NISTF")
                {
                    caption = 'NSITF Schedule';
                    ApplicationArea = All;
                    RunObject = Report "NSITF Schedule";
                }

                action("NH&F")
                {
                    caption = 'NHF Schedule';
                    ApplicationArea = All;
                    RunObject = Report "NHF Schedule";
                }

                action("Employee &List Standard")
                {
                    caption = 'Standard Employee List';
                    ApplicationArea = All;
                    RunObject = page "Employee List";
                }

                // action("Payment Journal")
                // {
                //     caption = 'Payment Journal';
                //     ApplicationArea = All;
                //     RunObject = Page "Payment Journal";
                // }


            }
            group("HR Setup")
            {
                Caption = 'HR Setup';

                action(Setup)
                {
                    Caption = 'Setup';
                    ApplicationArea = All;
                    RunObject = Page "HR Setup List";
                }
                action("LookUp Values")
                {
                    Caption = 'LookUp Values';
                    ApplicationArea = All;
                    RunObject = page "HR Lookup Values List";
                }
                action("HR Email Parameter List")
                {
                    ApplicationArea = All;
                    RunObject = Page "HR Email Parameter List";
                }
                action(Committees)
                {
                    Caption = 'Committees';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Units Of Measure")
                {
                    Caption = 'Units Of Measure';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Causes Of Abscence")
                {
                    Caption = 'Causes Of Abscence';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Causes Of Inactivity")
                {
                    Caption = 'Causes Of Inactivity';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Misc. Articles")
                {
                    Caption = 'Misc. Articles';
                    Visible = false;
                    ApplicationArea = All;
                }
                action(Confidential)
                {
                    Caption = 'Confidential';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Leave Periods")
                {
                    Caption = 'Leave Periods';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Job Requirements")
                {
                    Caption = 'Job Requirements';
                    Visible = false;
                    ApplicationArea = All;
                }
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Visible = false;
                    ApplicationArea = All;
                }
                action(prDepartment)
                {
                    Caption = 'prDepartment';
                    ApplicationArea = All;
                    RunObject = Page "prDepartment";
                }
                action(prPeriodTransaction)
                {
                    Caption = 'Period Transaction';
                    ApplicationArea = All;
                    // RunObject = Page "prPeriodTransaction";

                }
                action("HR Vital Set up")
                {
                    Caption = 'HR Vital Set up';
                    ApplicationArea = All;
                    RunObject = Page "HR Vital Set up";
                }
            }
            group("Human Resources")
            {
                Caption = 'Human Resources';

                action(HMO)
                {
                    Caption = 'HMO';
                    ApplicationArea = All;
                    RunObject = Page "HR HMO List";
                }
                action("Company Activities")
                {
                    Caption = 'Company Activities';
                    ApplicationArea = All;
                    RunObject = Page "HR Company Activities List";
                }
                action("HR Staff Activities")
                {
                    Caption = 'HR Staff Activities';
                    ApplicationArea = All;
                    RunObject = Page "HR Staff Activities List";
                }
                action("Drivers List")
                {
                    Caption = 'Drivers List';
                    ApplicationArea = All;
                    RunObject = Page "HR Drivers List";
                }
                action("HR Exit Interview List")
                {
                    Caption = 'HR Exit Interview List';
                    ApplicationArea = All;
                    RunObject = Page "HR Exit Interview HR List";
                }
                action("Exit Interview")
                {
                    Caption = 'Exit Interview';
                    ApplicationArea = All;
                    RunObject = Page "HR Exit Interview List";
                }
                action("Canteen Application")
                {
                    Caption = 'Canteen Application';
                    Visible = false;
                    ApplicationArea = All;
                }

            }
            group("Self Service")
            {
                Caption = 'Self Service';

                action("Staff Activities")
                {
                    Caption = 'Staff Activities';
                    ApplicationArea = All;
                    RunObject = Page "HR Staff Activities List";
                }
                action("Employee Details")
                {
                    Caption = 'Employee Details';
                    ApplicationArea = All;
                    RunObject = Page "HR Employee Self";
                }
                action(Action63)
                {
                    Caption = 'Training Application';
                    RunObject = Page "HR Training Application Self";
                }
                action(Action62)
                {
                    Caption = 'Staff Training Evaluation';
                    ApplicationArea = All;
                    RunObject = Page "Emp. Training Evaluation Self";
                }
                action("Leave Application")
                {
                    Caption = 'Leave Application';
                    ApplicationArea = All;
                    Visible = false;
                    // RunObject = Page "HR Leave Applications Self";
                }
                action("Leave Acknowledgment")
                {
                    Caption = 'Leave Acknowledgment';
                    ApplicationArea = All;
                    Visible = false;
                    // RunObject = Page "HR Leave Acknowledgments Self";
                }
                action("Appraisal First Half")
                {
                    Caption = 'Appraisal First Half';
                    ApplicationArea = All;
                    RunObject = Page "Appraisal First Half Self";
                }
                action("Appraisal Second Half")
                {
                    Caption = 'Appraisal Second Half';
                    ApplicationArea = All;
                    RunObject = Page "Appraisal Second Half";
                }

                action("Completed Appraisal")
                {
                    Caption = 'Completed Appraisal';
                    ApplicationArea = All;
                    RunObject = Page "Completed Appraisal";
                }
                action(Action57)
                {
                    Caption = 'HMO';
                    ApplicationArea = All;
                    RunObject = Page "HR HMO List Self";
                }
                action("Page HR Canteen Application Card")
                {
                    Caption = 'Canteen Application Card';
                    Visible = false;
                    ApplicationArea = All;
                }
                action("HR Exit Interview List Self")
                {
                    Caption = 'HR Exit Interview List Self';
                    ApplicationArea = All;
                    Visible = false;
                    //RunObject = Page "HR Exit Interview List Sel";
                }
            }
            group("Payroll Setup")
            {
                Caption = 'Payroll Setup';

                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    ApplicationArea = All;
                    RunObject = Page "Dimensions";
                }
                action("Transactions Setup")
                {
                    Caption = 'Transactions Setup';
                    ApplicationArea = All;
                    RunObject = Page "Pr Payroll Transactions Codes";
                }
                action("Salary Grades")
                {
                    Caption = 'Salary Grades';
                    ApplicationArea = All;
                    RunObject = Page "Salary Grades List";
                }
                action("<prP.A.Y.E Setup>")
                {
                    Caption = 'Page prP.A.Y.E Setup';
                    ApplicationArea = All;
                    RunObject = Page "prP.A.Y.E Setup";
                }
                action("Bank Structure")
                {
                    Caption = 'Bank Structure';
                    ApplicationArea = All;
                    RunObject = Page "prBank Structure";
                }
                action("HR User Setup")
                {
                    Caption = 'HR User Setup';
                    ApplicationArea = All;
                    RunObject = Page "HR User Setup";
                }
                action("Membership Groups")
                {
                    Caption = 'Membership Groups';
                    ApplicationArea = All;
                    RunObject = Page "prMembership Groups";
                }
                action("Payroll Type")
                {
                    Caption = 'Payroll Type';
                    ApplicationArea = All;
                    RunObject = Page "prPayroll Type";
                }
                action("Posting Groups")
                {
                    Caption = 'Posting Groups';
                    ApplicationArea = All;
                    RunObject = Page "prEmployee Posting Group";
                }
            }
            group("Training Management")
            {
                Caption = 'Training Management';

                action("Training Needs")
                {
                    ApplicationArea = All;
                    Caption = 'Training Needs';
                    RunObject = Page "HR Training Needs";
                }
                action("Training Application")
                {
                    Caption = 'Training Application';
                    ApplicationArea = All;
                    RunObject = Page "HR Training Application List";
                }
                action("HR Training Request")
                {
                    Caption = 'HR Training Request';
                    ApplicationArea = All;
                    RunObject = Page "Hr Training Request List";
                }
                action("HOD Training Request")
                {
                    Caption = 'HOD Training Request';
                    ApplicationArea = All;
                    RunObject = Page "HR HOD Training Needs";
                }
                action("Staff Training Evaluation")
                {
                    Caption = 'Staff Training Evaluation';
                    ApplicationArea = All;
                    RunObject = Page "Emp. Training Evaluation";
                }
            }
            group("Appraisal Evaluation")
            {
                Caption = 'Appraisal Evaluation';

                action("<Page Appraisal Goal Setting Lish")
                {
                    Caption = 'Page Appraisal Goal Setting First';
                    ApplicationArea = All;
                    //RunObject = Page "Appraisal Goal Setting List";
                    RunObject = page "Appraisal First Half Self";
                    RunPageView = where(Status = filter(Approved | "Pending Approval"));
                }
                action("Appraisal Goal Setting List Second ")
                {
                    Caption = 'Appraisal Goal Setting List Second ';
                    ApplicationArea = All;
                    //RunObject = Page "Appraisal Goal Setting Second";
                    RunObject = page "Appraisal Second Half";
                    RunPageView = where(Status = filter(Approved | "Pending Approval"));
                }
                action("Appraisal Goal Setting Supervisor First")
                {
                    Caption = 'Appraisal Goal Setting Supervisor First';
                    ApplicationArea = All;
                    RunObject = Page "Appraisal Goal Setting Fi";

                }
                action("Appraisal Goal Setting Supervisor Second")
                {
                    Caption = 'Appraisal Goal Setting Supervisor Second';
                    ApplicationArea = All;
                    RunObject = Page "Appraisal Goal Setting List Se";
                }
                action("Appraiser:-Evaluation & Approval")
                {
                    Caption = 'Appraiser:-Evaluation & Approval';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Appraisal:- Mngt Evaluation Form")
                {
                    Caption = 'Appraisal:- Mngt Evaluation Form';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Appraisal:- MD's Comment & Evaluation")
                {
                    Caption = 'Appraisal:- MD''s Comment & Evaluation';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Approved Appraisal")
                {
                    Caption = 'Approved Appraisal';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Appraisal History")
                {
                    Caption = 'Appraisal History';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Job Responsibilities")
                {
                    Caption = 'Job Responsibilities';
                    ApplicationArea = All;
                    Visible = false;
                }
                action("Appraisal Evaluation Areas")
                {
                    Caption = 'Appraisal Evaluation Areas';
                    ApplicationArea = All;
                    RunObject = Page "HR Appraisal Goal EV list";
                }
                action("Appraisal Rating")
                {
                    Caption = 'Appraisal Rating';
                    ApplicationArea = All;
                    RunObject = page "HR Appraisal Ratings";
                }
                action("Approval User Setup")
                {
                    Caption = 'Approver User Setup';
                    ApplicationArea = All;
                    RunObject = page "Approver User Setup List";
                }
            }
            group("Disciplinary Case Mgt")
            {
                Visible = false;
                Caption = 'Disciplinary Case Mgt';

                action("Disciplinary Cases")
                {
                    Caption = 'Disciplinary Cases';
                    ApplicationArea = All;
                    RunObject = Page "HR Disciplinary Cases List";
                }
                action(Query1)
                {
                    Caption = 'Query';
                    ApplicationArea = All;
                    RunObject = Page "HR Query List";
                }
            }
            group("Approval Entries")
            {
                Caption = 'Approval Entries';

                action(Action1102755020)
                {
                    Caption = 'Approval Entries';
                    ApplicationArea = All;
                    RunObject = Page "Approval Entries";
                }
                action("Approval Request Entries")
                {
                    Caption = 'Approval Request Entries';
                    ApplicationArea = All;
                    RunObject = Page "Approval Request Entries";
                }
            }
        }
        area(creation)
        {
            action(Employee)
            {
                Caption = 'Employee';
                Visible = false;
                ApplicationArea = All;
            }
            action(Staff)
            {
                Caption = 'Staff';
                Visible = false;
                ApplicationArea = All;
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
            }
            action("Journal Transfer")
            {
                Caption = 'Journal Transfer';
                ApplicationArea = All;
                RunObject = Report "prPayrollJournalTransfer";
            }
            action("Period Management")
            {
                Caption = 'Period Management';
                ApplicationArea = All;
                RunObject = Page "prPayroll Periods";
            }
            action("Rates & Ceilings")
            {
                Caption = 'Rates & Ceilings';
                ApplicationArea = All;
                RunObject = Page "prRates & Ceilings";
            }
            action(Action1102755036)
            {
                Caption = 'Posting Groups';
                ApplicationArea = All;
                RunObject = Page "prEmployee Posting Group";
            }
            action("Mass Update Transactions")
            {
                Caption = 'Mass Update Transactions';
                ApplicationArea = All;
                RunObject = Report "Mass Update Transactions";
            }
            action("Allowance Variations")
            {
                Caption = 'Allowance Variations';
                ApplicationArea = All;
                RunObject = Page "Allowance Var";
            }
            action("Deduction Variations")
            {
                Caption = 'Deduction Variations';
                ApplicationArea = All;
                RunObject = Page "Deductions Var";
            }
            action("Processed Allowance Variations")
            {
                Caption = 'Processed Allowance Variations';
                ApplicationArea = All;
                RunObject = Page "Processed Allowance Variations";
            }
            action("Processed Deduction Variations")
            {
                Caption = 'Processed Deduction Variations';
                ApplicationArea = All;
                RunObject = Page "Processed Deduction Variations";
            }
            action("Assign Employee Loan")
            {
                Caption = 'Assign Employee Loan';
                ApplicationArea = All;
                Visible = false;
            }
            action("Generate 13th Month")
            {
                Caption = 'Generate 13th Month';
                ApplicationArea = All;
                RunObject = report "Generate 13th Month";
            }
            separator(Reset)
            {
                Caption = 'Reset';
            }
            action("Clear Weekend OT")
            {
                Caption = 'Clear Weekend OT';
                Visible = false;
            }
            action("Clear Old Code Variations")
            {
                Caption = 'Clear Old Code Variations';
                Visible = false;
                ApplicationArea = All;
            }
            action("Up-Process Variations")
            {
                Caption = 'Up-Process Variations';
                Visible = false;
                ApplicationArea = All;
            }
            separator("PAYE Reset")
            {
                Caption = 'PAYE Reset';
            }
            action("Mark as Does Not Pay PAYE")
            {
                Caption = 'Mark as Does Not Pay PAYE';
                Visible = false;
                ApplicationArea = All;
            }
            action("Mark as Pays PAYE")
            {
                Caption = 'Mark as Pays PAYE';
                Visible = false;
                ApplicationArea = All;
            }
            action("Update Employee PAYE")
            {
                Caption = 'Update Employee PAYE';
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}
