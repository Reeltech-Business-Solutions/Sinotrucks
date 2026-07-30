page 54706 "HR Appraisal Development Plan"
{
    AutoSplitKey = false;
    PageType = ListPart;
    SaveValues = false;
    SourceTable = "HR Training Development PlanL1";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key Development Area"; Rec."Key Development Area")
                {
                    ApplicationArea = all;
                }
                field("KDA Description"; Rec."KDA Description")
                {
                    ApplicationArea = all;
                }
                field("Purpose of Training"; Rec."Purpose of Training")
                {
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = all;
                }
                field(Duration; rec.Duration)
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
