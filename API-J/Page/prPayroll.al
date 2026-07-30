

page 50350 "payroll periods"
{
    PageType = API;
    Caption = 'periods';
    APIPublisher = 'Reeltech';
    APIGroup = 'period';
    APIVersion = 'v1.0';
    EntityName = 'period';
    EntitySetName = 'periods';
    SourceTable = "prPayroll Periods";
    DelayedInsert = true;
    ODataKeyFields = SystemId;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'SystemId';

                }

                field("date_opened"; Rec."Date Opened")
                {
                    Caption = 'date_opened';

                }
            }
        }
    }
}