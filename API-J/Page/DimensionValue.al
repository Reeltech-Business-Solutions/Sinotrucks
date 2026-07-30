page 50601 "dimension value"
{
    APIGroup = 'departmentcode';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'department code';
    DelayedInsert = true;
    EntityName = 'departmentcode';
    EntitySetName = 'departmentcodes';
    PageType = API;
    SourceTable = "Dimension Value";
    ODataKeyFields = SystemId;
    Editable = false;
    InsertAllowed = false;
    SourceTableView = WHERE("Global Dimension No." = CONST(7));

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    Caption = 'image';
                    //Type = Media;  

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