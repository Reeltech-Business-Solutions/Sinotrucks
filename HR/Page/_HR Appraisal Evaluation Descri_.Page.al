page 54564 "HR Appraisal Evaluation Descri"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Evaluation Descri";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Description"; Rec."Evaluation Description")
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
