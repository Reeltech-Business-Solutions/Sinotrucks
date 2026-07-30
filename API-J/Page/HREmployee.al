page 50128 "HR Employees"
{
    APIGroup = 'Employee';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'HREmployee';
    DelayedInsert = true;
    EntityName = 'HREmployee';
    EntitySetName = 'HREmployees';
    PageType = API;
    SourceTable = "HR Employees";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }

                field("generated_id"; Rec."No.")
                {
                    Caption = 'Generated ID';
                }
                field("first_name"; Rec."First Name")
                {
                    Caption = 'First_Name';

                }

                field("middle_name"; Rec."Middle Name")
                {
                    Caption = 'Middle_Name';

                }

                field("last_name"; Rec."Last Name")
                {
                    Caption = 'Last_Name';

                }
                field("employee_id_number"; Rec."ID Number")
                {
                    // Caption = 'id_number';

                }

                field("passport_number"; Rec."Passport Number")
                {
                    Caption = 'Passport_Number';

                }

                field(citizenship; Rec.Citizenship)
                {
                    Caption = 'citizenship';

                }


                field("department"; Rec."Shorcut Dimension 7")
                {
                    Caption = 'Department';

                }

                field("area_code"; Rec."Shortcut Dimension 5 Code")
                {
                    Caption = 'area_code';

                }

                field(title; Rec.Title)
                {
                    Caption = 'Title';

                }

                field("post_code"; Rec."Post Code")
                {
                    Caption = 'Post_Code';

                }


                field("postal_address"; Rec."Postal Address")
                {
                    Caption = 'Postal_Address';

                }

                field("residential_address"; Rec."Residential Address")
                {
                    Caption = 'Residential_Address';

                }

                field(city; Rec.City)
                {
                    Caption = 'City';

                }

                field("last_date_modified"; Rec."Last Date Modified")
                {
                    Caption = 'Last_Date_Modified';

                }

                // field(Images; GetPicture(Rec."No."))
                // {
                //     Caption = 'Images';

                // }
                // field(picture; Rec.picture)
                // {

                // }

                field("employee_type"; Rec."Employee Type")
                {
                    Caption = 'Employee_Type';

                }

                field(supervisor; Rec.Supervisor)
                {
                    Caption = 'Supervisor';

                }

                field("supervisor_or_manager"; Rec."Supervisor/Manager")
                {
                    Caption = 'Supervisor_or_Manager';

                }

                field(supervisor_name; Rec.SupervisorName)
                {
                    Caption = 'Supervisor_Name';

                }

                field("supervisors_job_title"; Rec."Supervisor's Job Title")
                {
                    Caption = 'Supervisors_Job_Title';

                }

                field("job_title"; Rec."Job Title")
                {


                }

                field("job_level"; Rec."Job Level")
                {


                }



                field("second_line_supervisor_id"; Rec."Second Line Supervisor ID")
                {
                    Caption = 'Second_Line_Supervisor_ID';

                }

                field(status; Rec.Status)
                {
                    Caption = 'Status';

                }



                field(available; Rec.Available)
                {
                    Caption = 'Available';

                }

                field("date_of_last_promotion"; Rec."Alt. Address Start Date")
                {
                    Caption = 'Date of Last Promotion';

                }


                field("home_phone_number"; Rec."Home Phone Number")
                {

                }
                field("cell_phone_number"; Rec."Cell Phone Number")
                {

                }

                field("work_phone_number"; Rec."Work Phone Number")
                {

                }

                field("personal_email"; Rec."Personal E-Mail")
                {

                }
                field("company_email"; Rec."Company E-Mail")
                {

                }
                field("date_of_joining_the_company"; Rec."Date Of Joining the Company")
                {

                }
                field("alt_address_code"; Rec."Alt. Address Code")
                {

                }
                field("alt_address_end_date"; Rec."Alt. Address End Date")
                {

                }



                field(gender; rec.Gender)
                {

                }
                field("marital_status"; Rec."Marital Status")
                {

                }
                field(religion; rec.Religion)
                {

                }
                field(disabled; rec.Disabled)
                {

                }
                field("disability_details"; Rec."Disability Details")
                {

                }
                field("health_assesment"; Rec."Health Assesment?")
                {

                }
                field("medical_scheme_no"; Rec."Medical Scheme No.")
                {


                }
                field("Medical_Scheme_Plan"; Rec."Medical Scheme Plan")
                {


                }
                field("medical_sch_hospital_code"; Rec."Medical Sch. Hospital Code")
                {

                }
                field("medical_scheme_hospital"; Rec."Medical Scheme Hospital")
                {


                }
                field("Number_Of_Dependants"; Rec."Number Of Dependants")
                {


                }
                field("Cause_of_Inactivity_Code"; Rec."Cause of Inactivity Code")
                {

                }

                // field("d"; Rec."-")
                // {
                //     ApplicationArea = all;
                // }

                field("main_bank"; Rec."Main Bank")
                {

                }
                field("branch_bank"; Rec."Branch Bank")
                {

                }
                field("bank_account_number"; Rec."Bank Account Number")
                {

                }

                field("date_of_birth"; Rec."Date Of Birth")
                {



                }

                field("employment_type"; Rec."Employment Type")
                {

                }

                field("contract_end_date"; Rec."Contract End Date")
                {

                }
                field("notice_period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                }

                field("full_part_time"; Rec."Full / Part Time")
                {
                    Importance = Promoted;
                    Visible = true;
                    ApplicationArea = all;
                }

                field("pIN_number"; Rec."PIN Number")
                {

                }
                field("pension_fund_administrator"; Rec."Pension Fund Administrator")
                {
                    ApplicationArea = all;
                }
                field("nssf_no"; Rec."NSSF No.")
                {

                }
                field("nhif_no"; Rec."NHIF No.")
                {

                }
                field("tax_id_no"; Rec."Social Security No.")
                {
                    ApplicationArea = all;
                }

                field("date_of_leaving_the_company"; Rec."Date Of Leaving the Company")
                {

                }
                field("termination_grounds"; Rec."Termination Grounds")
                {

                }
                field("exit_interview_date"; Rec."Exit Interview Date")
                {

                }
                field("exit_interview_done_by"; Rec."Exit Interview Done by")
                {

                }


                field("acrued_leave_days"; Rec."Acrued Leave Days")
                {

                }







            }
        }
    }

    local procedure GetPicture(EmployeeNo: code[20]): Text
    var
        InStreamPic: Instream;
        TenantMedia: Record "Tenant Media";
        Base64: Codeunit "Base64 Convert";
        ToBase64: Codeunit "Base64 Convert";
        tempBlob: Codeunit "Temp Blob";
        Ostream: OutStream;
        RecRef: RecordRef;
        Pstream: InStream;
        EmpPicture: record 54578;
        HREmployee: record 54578;
        VarHREmployee: record 54548;
        PictureB64: text;
        FromIntegration: Boolean;
        RemoveStr: text[20];
        PaySlipB64: text;
    begin

        if HREmployee.Get(EmployeeNo) then begin


            HREmployee.CalcFields(Picture);
            if HREmployee.Picture.HasValue then begin
                TempBlob.FromRecord(HREmployee, HREmployee.FieldNo(Picture));
                TempBlob.CreateInstream(InstreamPic);

                PaySlipB64 := Tobase64.ToBase64(InStreamPic);
                exit(PaySlipB64);
            end;

        end;

    end;
}