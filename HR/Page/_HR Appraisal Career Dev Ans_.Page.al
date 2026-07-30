page 54942 "HR Appraisal Career Dev Ans"
{
    PageType = CardPart;
    SourceTable = "HR Appraisal Career Dev";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Line No."; Rec."Line No.")
            {
                Caption = 'Question No.';
                Enabled = false;
                ApplicationArea = All;
            }
            field("Appraisal Code"; Rec."Appraisal Code")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field(Answer; rec.Answer)
            {
                MultiLine = true;
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
