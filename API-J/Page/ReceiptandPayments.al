page 50604 "Receipts and payment"
{
    APIGroup = 'receipt';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'Receipt and payment';
    DelayedInsert = true;
    EntityName = 'paymentType';
    EntitySetName = 'paymentTypes';
    PageType = API;
    SourceTable = "Receipts and Payment Types";
    ODataKeyFields = SystemId;
    Editable = false;
    InsertAllowed = false;
    SourceTableView = where(Type = const(Advance));


    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {


                }
                field(description; Rec.Description)
                {

                }

                field(type; Rec.Type)
                {

                }

                field(system_id; Rec.SystemId)
                {

                }

            }
        }
    }
}