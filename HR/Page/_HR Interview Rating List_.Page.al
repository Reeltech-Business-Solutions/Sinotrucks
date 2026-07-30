page 54443 "HR Interview Rating List"
{
    ApplicationArea = All;
    Caption = 'HR Interview Rating List';
    PageType = List;
    SourceTable = "Hr Interview Evaluation";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Interview No."; Rec."Interview No.")
                {
                    ApplicationArea = All;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = All;
                }
                field(Email; rec.Email)
                {
                    ApplicationArea = All;
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Offer Status"; Rec."Offer Status")
                {
                    ApplicationArea = All;
                }
                field("Stage 1 Score"; Rec."Stage 1 Score")
                {
                    Visible = false;
                }
                field("Stage 2 Score"; Rec."Stage 2 Score")
                {
                    Visible = false;
                }
                field("Stage 3 Score"; Rec."Stage 3 Score")
                {
                    Visible = false;
                }
                field("Recommend for Stage 2"; Rec."Recommend for Stage 2")
                {
                    ApplicationArea = All;
                }
                field("Recommend for Stage 3"; Rec."Recommend for Stage 3")
                {
                    ApplicationArea = All;
                }
                field("Recommendation for Hire"; Rec."Recommendation for Hire")
                {
                    ApplicationArea = All;
                }
                field("Job Acceptance"; Rec."Job Acceptance")
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
            group("Interview Recomendation Mail")
            {
                Caption = '&Interview Recomendation Mail';

                action("&Recommend For Stage 2 Mail")
                {
                    Caption = '&Recommend For Stage 2 Mail';
                }
                action("&Recommend for Stage 3 Mail")
                {
                    Caption = '&Recommend for Stage 3 Mail';
                }
                action("&Recommend For Hire Mail")
                {
                    Caption = '&Recommend For Hire Mail';
                }
                action("&Messages & Venue Setup")
                {
                    Caption = '&Messages & Venue Setup';
                }
            }
            group("&MD Approval")
            {
                Caption = '&MD Approval';

                action(Approvals)
                {
                    Caption = 'Approvals';
                }
                action("Send For MD Approval")
                {
                    Caption = 'Send For MD Approval';
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                }
            }
        }
    }
    var EmailAdd: List of[Text];
    Emailmessage: codeunit "Email Message";
    Emailobj: codeunit Email;
    HRJobApplications: Record "HR Job Applications";
    HrIntMessage: Record "Hr Interview Evaluatn Message";
    //ApprovalMgt: codeunit "Approval Mgmt. ExtCal";
    CompInfo: Record "Company Information";
}
