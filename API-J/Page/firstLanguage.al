page 50117 "First Language"
{
    PageType = API;
    Caption = 'First Language';
    APIPublisher = 'ReelTech';
    APIGroup = 'Firstlanguage';
    APIVersion = 'v1.0';
    EntityName = 'Firstlanguage';
    EntitySetName = 'Firstlanguages';
    SourceTable = "HR lookup Values";
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