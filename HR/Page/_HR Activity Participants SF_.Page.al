page 54493 "HR Activity Participants SF"
{
    Caption = 'Activity Participants';
    ApplicationArea = all;
    PageType = List;
    SaveValues = true;
    AdditionalSearchTerms = 'Activity Participants';
    SourceTable = "HR Activity Participants";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field(Notified; rec.Notified)
                {
                    ApplicationArea = all;
                }
                field(Participant; rec.Participant)
                {
                    ApplicationArea = all;
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = all;
                }
                field(Contribution; rec.Contribution)
                {
                    ApplicationArea = all;
                }
                field("Email Message"; Rec."Email Message")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnInit()
    begin
        rec."Table ID":=1;
        rec."Sequence No.":=1;
    end;
}
