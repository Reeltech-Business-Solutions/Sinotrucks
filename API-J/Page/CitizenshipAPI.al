page 50071 "Citizenship"
{
    PageType = API;
    Caption = 'Citizenship';
    APIPublisher = 'Reeltech';
    APIGroup = 'citizenship';
    APIVersion = 'v1.0';
    EntityName = 'citizenship';
    EntitySetName = 'citizenships';
    SourceTable = "Country/Region";
    DelayedInsert = true;

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
            }
        }
    }
}