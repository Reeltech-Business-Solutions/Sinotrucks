page 50608 "Receipts and payment Claim"
{
    APIGroup = 'receipt';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'Receipt and payment';
    DelayedInsert = true;
    EntityName = 'paymentTypeClaim';
    EntitySetName = 'paymentTypeClaims';
    PageType = API;
    SourceTable = "Receipts and Payment Types";
    ODataKeyFields = SystemId;
    Editable = false;
    InsertAllowed = false;
    SourceTableView = where(Type = const(Claim));


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