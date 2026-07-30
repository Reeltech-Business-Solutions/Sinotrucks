page 54411 "Hr Applicant Test Card"
{
    PageType = Card;
    SourceTable = "HR Applicant Test";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Test Code"; rec."Test Code")
                {
                    ApplicationArea = all;
                }
                field("Requsition Number"; rec."Requsition Number")
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
                field(Time; Time)
                {
                    ApplicationArea = all;
                }
                field("Pass Mark"; rec."Pass Mark")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
