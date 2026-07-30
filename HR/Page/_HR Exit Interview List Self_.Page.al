page 54643 "HR Exit Interview List Self"
{
    CardPageID = "HR Employee Exit Interviews se";
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Exit Interview List Self';
    SourceTable = "HR Employee Exit Interviews";
    SourceTableView = WHERE(Status=FILTER(<>"Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Exit Interview No"; Rec."Exit Interview No")
                {
                    Style = StrongAccent;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Interview Done By"; Rec."Interviewer Name")
                {
                    ApplicationArea = all;
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                    Importance = Promoted;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    Importance = Promoted;
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                    Importance = Promoted;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755004; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1102755006; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(reporting)
        {
            action("Exit Interviews")
            {
                Caption = 'Exit Interviews';
                Image = "Report";
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = "Report";
            //RunObject = Report Report39005594;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.FilterGroup(2);
        rec.SetRange("User Id", UserId);
        rec.FilterGroup(0);
    end;
}
