page 54687 "Post Training Evaluation Sf"
{
    PageType = ListPart;
    SourceTable = "Training Evaluation Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; Rec."Request No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Question; rec.Question)
                {
                    ApplicationArea = All;
                }
                field(Answer; rec.Answer)
                {
                    ApplicationArea = All;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
