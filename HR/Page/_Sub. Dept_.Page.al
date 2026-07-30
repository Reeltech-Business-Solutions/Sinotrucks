page 54450 "Sub. Dept"
{
    ApplicationArea = All;
    Caption = 'Sub. Dept';
    PageType = List;
    SourceTable = "Sub. Department";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Dept. Code"; Rec."Dept. Code")
                {
                    Caption = 'Division Code';
                    ApplicationArea = All;
                }
                field(Code; Rec.Code)
                {
                    Caption = 'Unit Code';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Unit Description';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
            }
        }
    }
}
