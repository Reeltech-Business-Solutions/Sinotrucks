page 54534 "HR Appraisal Ratings"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Appraisal Ratings';
    SourceTable = "HR Appraisal Career Dev";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Appraisal Code"; Rec."Appraisal Code")
                {
                    ApplicationArea = all;
                }
                field(Question; rec.Question)
                {
                    ApplicationArea = all;
                }
                field(Answer; rec.Answer)
                {
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Half"; Rec."Appraisal Half")
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
