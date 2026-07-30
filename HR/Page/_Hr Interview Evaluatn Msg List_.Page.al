page 54576 "Hr Interview Evaluatn Msg List"
{
    Caption = 'Interview Evaluation  Message List';
    CardPageID = "Hr Interview Evaluatn Msg Card";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Interview Evaluation  Message List';
    SourceTable = "Hr Interview Evaluatn Message";

    layout
    {
        area(content)
        {
            repeater(Group)
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
