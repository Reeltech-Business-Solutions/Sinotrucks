page 50113 "Post Code"
{
    PageType = API;
    Caption = 'Post Code';
    APIPublisher = 'Reeltech';
    APIGroup = 'Postcode';
    APIVersion = 'v1.0';
    EntityName = 'Postcode';
    EntitySetName = 'Postcodes';
    SourceTable = "Post Code";
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
                field(City; Rec.City)
                {


                }
                field("Country_Region_Code"; Rec."Country/Region Code")
                {


                }
                field(County; Rec.County)
                {


                }
            }
        }
    }
}