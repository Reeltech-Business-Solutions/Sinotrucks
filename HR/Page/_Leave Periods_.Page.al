page 54548 "Leave Periods"
{
    RefreshOnActivate = true;
    SourceTable = "HR Leave Periods";

    layout
    {
        area(content)
        {
            repeater(Control1102755005)
            {
                ShowCaption = false;

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = all;
                }
                field("Period Description"; Rec."Period Description")
                {
                    ApplicationArea = all;
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = all;
                }
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
                field("Date Locked"; Rec."Date Locked")
                {
                    ApplicationArea = all;
                }
                field("Reimbursement Clossing Date"; Rec."Reimbursement Clossing Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("&Create Year")
            {
                Caption = '&Create Year';
                Ellipsis = true;
                Image = CreateYear;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Report Report39005925;
                ApplicationArea = All;
            }
            action("C&lose Year")
            {
                Caption = 'C&lose Year';
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Codeunit  "Leave Year-Close";
                ApplicationArea = All;
            }
        }
    }
}
