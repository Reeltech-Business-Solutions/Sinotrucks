page 54448 "Dept."
{
    ApplicationArea = All;
    Caption = 'Dept.';
    PageType = List;
    SourceTable = Department;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Division Description';
                    ApplicationArea = All;
                }
                field("Dim. Code"; Rec."Dim. Code")
                {
                    Caption = 'Department Code';
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
