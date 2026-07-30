page 50602 "area code"
{
    APIGroup = 'areacode';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'area code';
    DelayedInsert = true;
    EntityName = 'areacode';
    EntitySetName = 'areacodes';
    PageType = API;
    SourceTable = "Dimension Value";
    ODataKeyFields = SystemId;
    Editable = false;
    InsertAllowed = false;
    SourceTableView = WHERE("Global Dimension No." = CONST(3));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {

                }
                field(Name; Rec.Name)
                {

                }
                field(SystemId; Rec.SystemId)
                {

                }

            }
        }
    }
}