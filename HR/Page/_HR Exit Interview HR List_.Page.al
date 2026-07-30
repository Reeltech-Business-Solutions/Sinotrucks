page 54693 "HR Exit Interview HR List"
{
    CardPageID = "HR Employee Exit Interviews";
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Exit Interview HR List';
    SourceTable = "HR Employee Exit Interviews";
    SourceTableView = WHERE(Status=FILTER("Pending Approval"));

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
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
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
                    ApplicationArea = All;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
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
                PromotedCategory = "Report";
                ApplicationArea = All;
            //RunObject = Report Report39005594;
            }
            action("Send to Employee")
            {
                Image = Return;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    rec.Status:=rec.Status::Released;
                    rec.Modify;
                    Message('Document has been sent to Employee');
                end;
            }
        }
    }
}
