page 54684 "HR Confirmation KPI D"
{
    PageType = ListPart;
    SourceTable = "HR Confirmation KPI";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Objectives; rec.Objectives)
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Weight; rec.Weight)
                {
                    ApplicationArea = All;
                }
                field("Behavioural Group"; Rec."Behavioural Group")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Ratings; rec.Ratings)
                {
                    ApplicationArea = All;
                }
                field(Score; rec.Score)
                {
                    ApplicationArea = All;
                }
                field("KPI Weighting"; Rec."KPI Weighting")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Target Score %"; Rec."Target Score %")
                {
                    Caption = 'Weight';
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Behavioural Group":='LEARNING GROWTH';
    end;
}
