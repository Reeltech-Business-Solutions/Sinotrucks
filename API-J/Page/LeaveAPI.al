page 50315 Leave
{
    PageType = API;
    Caption = 'leave';
    APIPublisher = 'Reeltech';
    APIGroup = 'leave';
    APIVersion = 'v1.0';
    EntityName = 'leave';
    EntitySetName = 'leaves';
    SourceTable = "HR Leave Application";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("application_code"; Rec."Application Code")
                {


                }
                field("job_title"; Rec."Job Title")
                {


                }
                field("company_email"; Rec."Company Email")
                {

                    trigger OnValidate()
                    begin
                        Rec."Company Email" := LowerCase(Rec."Company Email");
                    end;
                }

                field("leave_type"; Rec."Leave Type")
                {


                }
                field("leave_period"; Rec."Leave Period")
                {


                }

                field("start_date"; Rec."Start Date")
                {


                }
                field("days_applied"; Rec."Days Applied")
                {


                }
                field("employee_reliver"; Rec."Employee Reliver")
                {
                    trigger OnValidate()
                    begin
                        Rec.validate("Employee Reliver");
                    end;

                }
                field("cell_phone_number"; Rec."Cell Phone Number")
                {


                }
                field("date_of_exam"; Rec."Date of Exam")
                {


                }
                field("details_of_examination"; Rec."Details of Examination")
                {


                }

                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }


            }


        }


    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Company Email" := LowerCase(Rec."Company Email");

        Rec.status := Rec.status::Approved;
        // Rec.Validate("Company Email");
        // Rec.Validate("Leave Type");
        // Rec.Validate("Start Date");
        // Rec.Validate("Days Applied");

        exit(true);
        // Rec.status := Rec.status::Approved;
    end;
}