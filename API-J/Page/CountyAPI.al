page 50114 "County"
{
    PageType = API;
    Caption = 'County';
    APIPublisher = 'Reeltech';
    APIGroup = 'county';
    APIVersion = 'v1.0';
    EntityName = 'county';
    EntitySetName = 'counties';
    SourceTable = "HR Lookup Values";
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
                field(Description; Rec.Description)
                {


                }
            }
        }
    }
}