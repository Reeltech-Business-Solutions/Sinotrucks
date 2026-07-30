page 50319 LeaveAck
{
    PageType = API;
    Caption = 'leave';
    APIPublisher = 'Reeltech';
    APIGroup = 'leaveAck';
    APIVersion = 'v1.0';
    EntityName = 'LeaveAck';
    EntitySetName = 'LeaveAcks';
    SourceTable = "HR Leave Acknowledgement";
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
                field("leave_no"; Rec."Leave No.")
                {


                }
                field("actual_days_spent"; Rec."Actual Days Spent")
                {


                }
                field("actual_return_day"; Rec."Actual Return Day")
                {


                }
                field(comment; Rec.Comment)
                {


                }

            }
        }
    }
}