page 54421 "HR Confirmation List (HR)"
{
    Caption = 'HR Confirmation List (HR)';
    CardPageID = "HR Confirmation Header";
    DeleteAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Employee Confirmation";
    SourceTableView = WHERE("Send to Hr"=CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Date of Employment"; Rec."Date of Employment")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        rec.SETRANGE("Send to Hr", TRUE);
    end;
}
