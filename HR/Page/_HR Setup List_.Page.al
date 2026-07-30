page 54554 "HR Setup List"
{
    CardPageID = "HR Setup";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ApplicationArea = all;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Administration';
    RefreshOnActivate = false;
    SourceTable = "HR Setup";
    AdditionalSearchTerms = 'HR Setup List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
                {
                    ApplicationArea = All;
                }
                field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
                {
                    ApplicationArea = All;
                }
                field("Default Leave Posting Template"; Rec."Default Leave Posting Template")
                {
                    ApplicationArea = All;
                }
                field("Default Leave Posting Batch"; Rec."Default Leave Posting Batch")
                {
                    ApplicationArea = All;
                }
                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = All;
                }
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                    ApplicationArea = All;
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ApplicationArea = All;
                }
                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                    ApplicationArea = All;
                }
                field("Transport Req Nos"; Rec."Transport Req Nos")
                {
                    ApplicationArea = All;
                }
                field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
                {
                    ApplicationArea = All;
                }
                field("Job Application Nos"; Rec."Job Application Nos")
                {
                    ApplicationArea = All;
                }
                field("Exit Interview Nos"; Rec."Exit Interview Nos")
                {
                    ApplicationArea = All;
                }
                field("Appraisal Nos"; Rec."Appraisal Nos")
                {
                    ApplicationArea = All;
                }
                field("Company Activities"; Rec."Company Activities")
                {
                    ApplicationArea = All;
                }
                field("Job Interview Nos"; Rec."Job Interview Nos")
                {
                    ApplicationArea = All;
                }
                field("Ticket Nos"; Rec."Ticket Nos")
                {
                    ApplicationArea = All;
                }
                field("Complaint Form Nos"; Rec."Complaint Form Nos")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            action("HR Policies")
            {
                Caption = 'HR Policies';
                Image = Planning;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "HR Policies";
                ApplicationArea = All;
            }
            action("E-Mail Parameters")
            {
                Caption = 'E-Mail Parameters';
                Image = Email;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "HR E-Mail Parameters";
                ApplicationArea = All;
            }
            action(Calendar)
            {
                Caption = 'Calendar';
                Image = Calendar;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Base Calendar Card";
                ApplicationArea = All;
            }
            action("Leave Periods")
            {
                Caption = 'Leave Periods';
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Leave Periods";
                ApplicationArea = All;
            }
            action("Close Appraisal Half")
            {
                Caption = 'Close Appraisal Half';
                ApplicationArea = All;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.Reset;
        if not rec.Get then begin
            rec.Init;
            rec.Insert;
        end;
    end;
}
