page 50320 PostedLeave
{
    PageType = API;
    Caption = 'postedleave';
    APIPublisher = 'Reeltech';
    APIGroup = 'leave';
    APIVersion = 'v1.0';
    EntityName = 'postedLeave';
    EntitySetName = 'postedLeaves';
    SourceTable = "HR Leave Application";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    SourceTableView = where(Status = const(Posted));
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
                field("application_code"; Rec."Application Code")
                {


                }
                field("job_title"; Rec."Job Title")
                {


                }
                field("company_email"; Rec."Company Email")
                {


                }
                field("leave_period"; Rec."Leave Period")
                {


                }
                field("leave_type"; Rec."Leave Type")
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
            }
        }
    }
}