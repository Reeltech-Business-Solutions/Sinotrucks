page 54978 "HR Interviewer Comment2"
{
    PageType = ListPart;
    SourceTable = "HR Interviewer Comment";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Interview No."; Rec."Interview No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Interviewer No."; Rec."Interviewer No.")
                {
                    ApplicationArea = all;
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                }
                field(Recommendation; rec.Recommendation)
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
