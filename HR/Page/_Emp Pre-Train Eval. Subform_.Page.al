page 54600 "Emp Pre-Train Eval. Subform"
{
    Caption = 'Questionnaire';
    MultipleNewLines = false;
    PageType = ListPart;
    RefreshOnActivate = false;
    SaveValues = false;
    SourceTable = "Hr Traing Eval. Quest. Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                FreezeColumn = "Emp Code";

                field("Emp Code"; Rec."Emp Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Training Code"; Rec."Training Code")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Training Evaluation Category"; Rec."Training Evaluation Category")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Traning Evaluation Type"; Rec."Traning Evaluation Type")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Evaluation question No"; Rec."Evaluation question No")
                {
                    ApplicationArea = all;
                }
                field("Traning Evaluation Question"; Rec."Traning Evaluation Question")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Employee Answer"; Rec."Employee Answer")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
