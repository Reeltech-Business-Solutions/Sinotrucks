page 54577 "Hr Interview Evaluatn Msg Card"
{
    Caption = 'Interview Evaluation Message  Card';
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Hr Interview Evaluatn Message";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Stages; rec.Stages)
                {
                    ApplicationArea = all;
                }
                field(Subject; rec.Subject)
                {
                    ApplicationArea = all;
                }
                field(Message; rec.Message)
                {
                    ApplicationArea = all;
                }
                field(Venue; rec.Venue)
                {
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
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
