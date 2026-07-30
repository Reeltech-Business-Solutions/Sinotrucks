page 54426 "Hr Test List"
{
    AdditionalSearchTerms = 'Hr Test List';
    ApplicationArea = all;
    PageType = List;
    CardPageID = "Hr Applicant Test Card";
    SourceTable = "HR Applicant Test";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Test Code"; Rec."Test Code")
                {
                    ApplicationArea = all;
                }
                field("Requsition Number"; Rec."Requsition Number")
                {
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Venue; rec.Venue)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
