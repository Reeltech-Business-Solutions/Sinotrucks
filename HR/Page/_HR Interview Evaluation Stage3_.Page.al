page 54584 "HR Interview Evaluation Stage3"
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
                field(Stage; rec.Stage)
                {
                    ApplicationArea = all;
                }
                field("Evaluation Code"; Rec."Evaluation Code")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Description"; Rec."Evaluation Description")
                {
                    ApplicationArea = all;
                }
                field("Interview1 Stage 3 Score"; Rec."Interview1 Stage 3 Score")
                {
                    Caption = 'Interviewer 1 Stage 3 Score';
                    ApplicationArea = all;
                }
                field("Interview2 Stage 3 Score"; Rec."Interview2 Stage 3 Score")
                {
                    Caption = 'Interviewer 2 Stage 3 Score';
                    ApplicationArea = all;
                }
                field("Total Target"; Rec."Total Target")
                {
                    ApplicationArea = all;
                }
                field(Weight; rec.Weight)
                {
                    ApplicationArea = all;
                }
                field("Average Score"; Rec."Average Score")
                {
                    ApplicationArea = all;
                }
                field("Total Score"; Rec."Total Score")
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
