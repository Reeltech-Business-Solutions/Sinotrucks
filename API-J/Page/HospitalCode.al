page 50118 "Hospital Code"
{
    PageType = API;
    Caption = 'Hospitalcode';
    APIPublisher = 'Reeltech';
    APIGroup = 'Hospitalcode';
    APIVersion = 'v1.0';
    EntityName = 'Hospitalcode';
    EntitySetName = 'Hospitalcodes';
    SourceTable = "HR HMO Hospital";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec.Name)
                {


                }
            }
        }
    }
}