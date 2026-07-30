page 54496 "HR Transport Requests List"
{
    CardPageID = "HR Staff Transport Requisition";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Transport Requisition";
    AdditionalSearchTerms = 'HR Transport Requests List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Application Code"; Rec."Application Code")
                {
                    Style = Strong;
                    StyleExpr = TRUE;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field(Names; rec.Names)
                {
                    ApplicationArea = all;
                }
                field("Job Tittle"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    ApplicationArea = all;
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
            action("Transport Requests")
            {
                Caption = 'Transport Requests';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Transport Requests";
                ApplicationArea = all;
            }
        }
    }
}
