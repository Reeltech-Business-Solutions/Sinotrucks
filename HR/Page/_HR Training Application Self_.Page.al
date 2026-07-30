page 54943 "HR Training Application Self"
{
    CardPageID = "HR Training Application Card";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Training Applications";
    SourceTableView = WHERE(Type=CONST(Staff));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Application No"; Rec."Application No")
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
                field("Course Title"; Rec."Course Title")
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Reason for Training"; Rec."Reason for Training")
                {
                    ApplicationArea = all;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    Caption = 'Estimated Cost';
                    ApplicationArea = All;
                }
                field("Approved Cost"; Rec."Approved Cost")
                {
                    ApplicationArea = all;
                }
                field(Provider; rec."Provider Name")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755002; "HR Trainings Factbox")
            {
                SubPageLink = "Application No"=FIELD("Application No");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(reporting)
        {
            action("Training Applications List")
            {
                Caption = 'Training Applications List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Training Applications List";
                ApplicationArea = All;
            }
            action("Training Applications")
            {
                Caption = 'Training Applications';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Payroll Components Variance";
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.FilterGroup(2);
        rec.SetFilter("User ID", UserId);
        rec.FilterGroup(0);
    end;
}
