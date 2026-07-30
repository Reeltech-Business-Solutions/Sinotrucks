page 50316 "Leave Type"
{
    PageType = API;
    Caption = 'leaveTypes';
    APIPublisher = 'Reeltech';
    APIGroup = 'leaveType';
    APIVersion = 'v1.0';
    EntityName = 'leaveType';
    EntitySetName = 'leaveTypes';
    SourceTable = "HR Leave Types";
    DelayedInsert = true;
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

                field(type; Rec.Code)
                {

                }

                field(description; Rec.Description)
                {

                }

                field(days; Rec.Days)
                {

                }

                field(gender; Rec.Gender)
                {

                }

            }
        }
    }
}