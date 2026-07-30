page 50622 "job"
{
    APIGroup = 'job';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'job';
    DelayedInsert = true;
    EntityName = 'job';
    EntitySetName = 'jobs';
    PageType = API;
    SourceTable = Job;
    ODataKeyFields = SystemId;
    Editable = false;
    InsertAllowed = false;
    SourceTableView = WHERE(Status = CONST(Open));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(SystemId; Rec.SystemId)
                {

                }
                field("job_no"; Rec."No.")
                {


                }
                field(job_name; Rec.Description)
                {

                }

                field(customer_no; Rec."Bill-to Customer No.")
                {

                }

                field(customer_name; Rec."Bill-to Name")
                {

                }

                field(location; Rec."Location Codes")
                {

                }


            }
        }
    }
}