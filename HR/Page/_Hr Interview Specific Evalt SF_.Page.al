page 54573 "Hr Interview Specific Evalt SF"
{
    PageType = ListPart;
    SourceTable = "Hr Interview Specific Evaluatn";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Code"; Rec."Evaluation Code")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Description"; Rec."Evaluation Description")
                {
                    ApplicationArea = all;
                }
                field("Interview Rating"; Rec."Interview Rating")
                {
                    Visible = false;
                }
                field("Interview1 Stage 1 Score"; Rec."Interview1 Stage 1 Score")
                {
                    ApplicationArea = all;
                }
                field("Interview1 Stage 2 Score"; Rec."Interview1 Stage 2 Score")
                {
                    ApplicationArea = all;
                }
                field("Interview1 Stage 3 Score"; Rec."Interview1 Stage 3 Score")
                {
                    ApplicationArea = all;
                }
                field("Total Target"; Rec."Total Target")
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
