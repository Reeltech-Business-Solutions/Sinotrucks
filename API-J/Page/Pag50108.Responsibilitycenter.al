page 50108 Responsibility_center
{
    APIPublisher = 'Reeltech';
    APIGroup = 'Postcode';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'responsibilityCenter';
    DelayedInsert = true;
    EntityName = 'reponsibility_center';
    EntitySetName = 'reponsibility_centers';
    PageType = API;
    SourceTable = "Responsibility Center";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {


                }

                field(Name; Rec.Name)
                {


                }
            }
        }
    }
}
