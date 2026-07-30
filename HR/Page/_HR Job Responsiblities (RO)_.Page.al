page 54544 "HR Job Responsiblities (RO)"
{
    Caption = '<HR Job Responsiblities';
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Job Responsiblities";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Responsibility Code"; Rec."Responsibility Code")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Description"; Rec."Responsibility Description")
                {
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
