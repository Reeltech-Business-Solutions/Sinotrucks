page 50500 currenciesAPI
{
    APIGroup = 'currency';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'currency';
    DelayedInsert = true;
    EntityName = 'currency';
    EntitySetName = 'currencies';
    PageType = API;
    SourceTable = "currency";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(code; Rec.code)
                {


                }
                field(description; Rec.Description)
                {


                }
                field(system_id; Rec.SystemId)
                {


                }
            }
        }
    }
}