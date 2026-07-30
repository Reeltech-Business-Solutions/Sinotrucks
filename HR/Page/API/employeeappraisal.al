page 55004 "employee appraisal"
{
    PageType = API;
    Caption = 'Employee Appraisal';
    APIPublisher = 'RBS';
    APIGroup = 'app1';
    APIVersion = 'v1.0';
    EntityName = 'appraisal';
    EntitySetName = 'appraisals';
    SourceTable = "HR Appraisal Goal Setting H";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Appraisl_No"; Rec."Appraisal No")
                {
                    ApplicationArea = All;

                }

                field("Employee_No"; Rec."Employee No")
                {
                    ApplicationArea = All;

                }

                field("Employee_Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;

                }

                field("Job_Title"; Rec."Job Title")
                {
                    ApplicationArea = All;

                }

                field("Appraisal_Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = All;

                }

                field("Appraisal_Half"; Rec."Appraisal Half")
                {
                    ApplicationArea = All;

                }

                field("Appraisal_Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = All;

                }

                field("Contract_Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;

                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = All;

                }

                field(Queried; Rec.Queried)
                {
                    ApplicationArea = All;

                }
                field("Salary_Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;

                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;

                }

                field("Current_Location"; Rec."Current Location")
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field("Evaluation_Period_Start"; Rec."Evaluation Period Start")
                {
                    ApplicationArea = All;

                }

                field("Evaluation_Period_End"; Rec."Current Location")
                {
                    ApplicationArea = All;

                }

                field("Appraisal_Date"; Rec."Appraisal Date")
                {
                    ApplicationArea = All;

                }

                field(Unit; Rec.Unit)
                {
                    ApplicationArea = All;

                }

                field("Signature_Appraisee"; Rec."Signature Appraisee")
                {
                    ApplicationArea = All;

                }

                field("Responsibility_Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;

                }

                field("Time_In_Present_Position"; Rec."Time In Present Position")
                {
                    ApplicationArea = All;

                }
                field("Membership_of_Prof_Bodies"; Rec."Membership of Prof. Bodies")
                {
                    ApplicationArea = All;

                }
                field(Qualifications; Rec.Qualifications)
                {
                    ApplicationArea = All;

                }
                field("New_Qualification_in_last_1_yr"; Rec."New Qualification in last 1 yr")
                {
                    ApplicationArea = All;

                }
                field("Desired_Department"; Rec."Desired Department")
                {
                    ApplicationArea = All;

                }
                field("Date_Of_Last_Promotion_Notch"; Rec."Date Of Last Promotion/Notch")
                {
                    ApplicationArea = All;

                }
                field(Employee_Comment; Rec.Comment1)
                {
                    ApplicationArea = All;

                }
                field(supervisor_comment; Rec.Comment2)
                {
                    ApplicationArea = All;

                }


                field(HOD_Comment; Rec.Comment3)
                {
                    ApplicationArea = All;

                }

                field(MD_Comment; Rec.Comment4)
                {
                    ApplicationArea = All;

                }

                field("Recommendations_1"; Rec."Recommendations 1")
                {
                    ApplicationArea = All;

                }

                field("Recommendation_2"; Rec."Recommendation 2")
                {
                    ApplicationArea = All;

                }

                field("Recommendation_3"; Rec."Recommendation 3")
                {
                    ApplicationArea = All;

                }



            }
        }
    }
}