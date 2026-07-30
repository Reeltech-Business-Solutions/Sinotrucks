page 50309 "Completed Appraisal"
{
    Caption = 'Completed Appraisal';
    CardPageID = "HR Appraisal Goal Setting H";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Appraisal Goal Setting H";
    SourceTableView = WHERE(Status = CONST(Approved));

    layout
    {
        area(content)
        {
            repeater("Appraisee Information")
            {
                Caption = 'Appraisee Information';
                // field("Appraisal No"; "Appraisal No")
                field("Appraisal No"; Rec."Appraisal No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Evaluation Period Start"; Rec."Evaluation Period Start")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Period End"; Rec."Evaluation Period End")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Date"; Rec."Appraisal Date")
                {
                    ApplicationArea = all;
                }
                field(Unit; Rec.Unit)
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
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
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}