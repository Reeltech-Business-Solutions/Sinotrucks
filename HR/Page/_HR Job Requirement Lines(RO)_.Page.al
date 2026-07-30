page 54543 "HR Job Requirement Lines(RO)"
{
    Caption = '<HR Job Requirements';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Job Requirements";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = All;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = All;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Priority; rec.Priority)
                {
                    ApplicationArea = All;
                }
                field("Desired Score"; Rec."Desired Score")
                {
                    ApplicationArea = All;
                }
                field(Mandatory; rec.Mandatory)
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
