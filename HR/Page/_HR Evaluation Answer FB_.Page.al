page 54601 "HR Evaluation Answer FB"
{
    Caption = 'Answer';
    PageType = CardPart;
    SourceTable = "Hr Traing Eval. Quest. Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Question; rec."Evaluation question No")
            {
                Editable = false;
                ApplicationArea = all;
                Visible = true;
            }
            group(Answer)
            {
                field("Emp Code"; Rec."Emp Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Training Evaluation Category"; Rec."Training Evaluation Category")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Employee Answer"; Rec."Employee Answer")
                {
                    MultiLine = true;
                    Editable = false;
                    ApplicationArea = all;
                    ShowCaption = false;
                }
                field("Training Code"; Rec."Training Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
            }
        }
    }
    actions
    {
    }
}
