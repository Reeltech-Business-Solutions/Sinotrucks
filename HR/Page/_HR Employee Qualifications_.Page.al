page 54502 "HR Employee Qualifications"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Qualification';
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field(FullName; rec.FullName)
                {
                    Caption = 'Name';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = false;
                    StyleExpr = TRUE;
                }
                field(Gender; rec.Gender)
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
            }
            part("Employee Qualifications"; "HR Employee Qualification Line")
            {
                Caption = 'Employee Qualifications';
                SubPageLink = "Employee No."=FIELD("No.");
                ApplicationArea = All;
            }
            systempart(Control1102755011; Outlook)
            {
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Control1102755012; "HR Employees Factbox")
            {
                SubPageLink = "No."=FIELD("No.");
                ApplicationArea = All;
            }
            systempart(Control1102755010; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("Q&ualification")
            {
                Caption = 'Q&ualification';

                action("Q&ualification Overview")
                {
                    Caption = 'Q&ualification Overview';
                    Image = TaskQualityMeasure;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Qualification Overview";
                }
            }
        }
    }
}
