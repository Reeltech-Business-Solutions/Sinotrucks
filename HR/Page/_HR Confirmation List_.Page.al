page 54416 "HR Confirmation List"
{
    Caption = 'Staff Probation/Confirmation';
    CardPageID = "HR Confirmation Header";
    DeleteAllowed = true;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Employee Confirmation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Date of Employment"; rec."Date of Employment")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Type"; rec."Appraisal Type")
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
        //SETFILTER("User ID",USERID);
        rec.FILTERGROUP(2);
        rec.SETFILTER("User ID", USERID);
        rec.FILTERGROUP(0);
    end;
}
