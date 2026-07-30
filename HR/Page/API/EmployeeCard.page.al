page 55001 "HR CardPage-API"
{
    PageType = API;
    Caption = 'HR CardPage-API';
    APIPublisher = 'RBS';
    APIGroup = 'app';
    APIVersion = 'v2.0';
    EntityName = 'HRCard';
    EntitySetName = 'HRCards';
    SourceTable = "HR Employees";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater("General Details")
            {
                field("No"; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("first_name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("last_name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("middle_name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = All;
                }
                field("country"; Rec.County)
                {
                    ApplicationArea = All;
                }
                field("department_code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                }
                field("profit_center_code"; Rec."Global Dimension 1")
                {
                    ApplicationArea = All;
                }
                field("residential_address"; Rec."Residential Address")
                {
                    ApplicationArea = All;
                }
                field(city; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("picture"; Rec.Picture)
                {
                    ApplicationArea = All;
                }
                field("employee_type"; Rec."Employee Type")
                {
                    ApplicationArea = All;
                }
                field("supervisor"; Rec.SupervisorName)
                {
                    ApplicationArea = All;
                }
                field("status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("phone"; Rec."Home Phone Number")
                {
                    ApplicationArea = All;
                }
                field("email"; Rec."Personal E-Mail")
                {
                    ApplicationArea = All;
                }
                field("company_email"; Rec."Company E-Mail")
                {
                    ApplicationArea = All;
                }
                field("gender"; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("marital_status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field(religion; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field(d_o_b; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field(age; Rec.Age)
                {
                    ApplicationArea = All;
                }
                field(date_of_joining; Rec."Date Of Joining the Company")
                {
                    ApplicationArea = All;
                }
                field("Length_Of_Service"; Rec."Length Of Service")
                {
                    ApplicationArea = All;
                }
                field("Probation_Date_3mnths"; Rec."Probation Date 3mnths")
                {
                    ApplicationArea = All;
                }
                field("Confirmation_Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = All;
                }
                field("job_title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("job_description"; Rec."Job Description")
                {
                    ApplicationArea = All;
                }
                field("job_level"; Rec."Job Level")
                {
                    ApplicationArea = All;
                }
                field("posting_group"; Rec."Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Salary_Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                }
                field("Salary_Step"; Rec."Salary Step")
                {
                    ApplicationArea = All;
                }
                field("employee_classification"; Rec."Employee Classification")
                {
                    ApplicationArea = All;
                }
                field("payroll_filter_group"; Rec."Payroll Filter Group")
                {
                    ApplicationArea = All;
                }
                field("employment_type"; Rec."Employment Type")
                {
                    ApplicationArea = All;
                }
                field("full_part_time"; Rec."Full / Part Time")
                {
                    ApplicationArea = All;
                }
                field("pin_number"; Rec."PIN Number")
                {
                    ApplicationArea = All;
                }
                field("pension_fund_administration"; Rec."Pension Fund Administrator")
                {
                    ApplicationArea = All;
                }
                field("nssf_no"; Rec."NSSF No.")
                {
                    ApplicationArea = All;
                }
                field("nhif_no"; Rec."NHIF No.")
                {
                    ApplicationArea = All;
                }
                field("social_security_no"; Rec."Social Security No.")
                {
                    ApplicationArea = All;
                }
                field("totai_leave"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = All;
                }
                field("leave_balance"; Rec."Leave Balance")
                {
                    ApplicationArea = All;
                }
                field("total_leave_taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = All;
                }
                field("leave_status"; Rec."Leave Status")
                {
                    ApplicationArea = All;
                }
                field("personal_email"; Rec."Personal E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Res_city"; Rec."City")
                {
                    ApplicationArea = All;
                }


            }


        }


    }

}