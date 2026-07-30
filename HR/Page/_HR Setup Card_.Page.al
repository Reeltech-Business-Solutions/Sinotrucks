page 54546 "HR Setup Card"
{
    PageType = Card;
    SourceTable = "HR Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Leave Period")
            {
                Caption = 'Leave Period';

                field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
                {
                    ApplicationArea = all;
                }
                field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
                {
                    ApplicationArea = all;
                }
                field("Leave Template"; Rec."Leave Template")
                {
                    ApplicationArea = all;
                }
                field("Leave Batch"; Rec."Leave Batch")
                {
                    ApplicationArea = all;
                }
            }
            group("HR Number Series")
            {
                Caption = 'HR Number Series';

                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = all;
                }
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                    ApplicationArea = all;
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ApplicationArea = all;
                }
                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                    ApplicationArea = all;
                }
                field("Transport Req Nos"; Rec."Transport Req Nos")
                {
                    ApplicationArea = all;
                }
                field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
                {
                    ApplicationArea = all;
                }
                field("Job Application Nos"; Rec."Job Application Nos")
                {
                    ApplicationArea = all;
                }
                field("Exit Interview Nos"; Rec."Exit Interview Nos")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Nos"; Rec."Appraisal Nos")
                {
                    ApplicationArea = all;
                }
                field("Company Activities"; Rec."Company Activities")
                {
                    ApplicationArea = all;
                }
                field("Default Leave Posting Template"; Rec."Default Leave Posting Template")
                {
                    ApplicationArea = all;
                }
                field(s; rec."Default Leave Posting Batch")
                {
                    ApplicationArea = all;
                }
                field("Ticket Nos"; Rec."Ticket Nos")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
