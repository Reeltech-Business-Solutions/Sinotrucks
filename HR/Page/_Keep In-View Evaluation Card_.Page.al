page 54590 "Keep In-View Evaluation Card"
{
    PageType = Card;
    SourceTable = "Hr Interview Evaluation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Interview No."; rec."Interview No.")
                {
                    ApplicationArea = all;
                }
                field("Application No."; rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field(Initial; rec.Initial)
                {
                    ApplicationArea = all;
                }
                field("Date Applied"; rec."Date Applied")
                {
                    ApplicationArea = all;
                }
                field(Email; rec.Email)
                {
                    ApplicationArea = all;
                }
                field("Interview Date"; rec."Interview Date")
                {
                    ApplicationArea = all;
                }
                field("Interview Done By"; rec."Interview Done By")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Interviewer Name"; rec."Interviewer Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Job Title"; rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Job Position"; rec."Job Position")
                {
                    ApplicationArea = all;
                }
                field("Current Salary (N) P/A"; rec."Current Salary (N) P/A")
                {
                    ApplicationArea = all;
                }
                field("Expected Salary (N) P/A"; Rec."Expected Salary (N) P/A")
                {
                    ApplicationArea = all;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Stage 1 Pass Mark"; Rec."Stage 1 Pass Mark")
                {
                    AutoFormatExpression = 'Stage 1 Pass Mark';
                    AutoFormatType = 100;
                    ApplicationArea = All;
                }
                field("Stage 1 Score"; Rec."Stage 1 Score")
                {
                    ApplicationArea = all;
                }
                field("Stage 2 Pass Mark"; Rec."Stage 2 Pass Mark")
                {
                    ApplicationArea = all;
                }
                field("Stage 2 Score"; Rec."Stage 2 Score")
                {
                    ApplicationArea = all;
                }
                field("Stage 3 Pass Mark"; Rec."Stage 3 Pass Mark")
                {
                    ApplicationArea = all;
                }
                field("Stage 3 Score"; Rec."Stage 3 Score")
                {
                    ApplicationArea = all;
                }
                field("Recommend for Stage 2"; Rec."Recommend for Stage 2")
                {
                    ApplicationArea = all;
                }
                field("Recommend for Stage 3"; Rec."Recommend for Stage 3")
                {
                    ApplicationArea = all;
                }
                field("Recommendation for Hire"; Rec."Recommendation for Hire")
                {
                    Caption = 'Recommend for Hire';
                    ApplicationArea = All;
                }
                field("HMO Stage"; Rec."HMO Stage")
                {
                    Caption = 'Recommend for Medical Test Stage';
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field("Offer Status"; Rec."Offer Status")
                {
                    ApplicationArea = all;
                }
                field("Job Acceptance"; Rec."Job Acceptance")
                {
                    ApplicationArea = all;
                }
            }
            part("INTERVIEW SPECIFIC EVALUATION AREA -STAGE 1"; "Hr Interview Evaluation Stage1")
            {
                ApplicationArea = All;
                Caption = 'INTERVIEW SPECIFIC EVALUATION AREA -STAGE 1';
                SubPageLink = "Interview No."=FIELD("Interview No."), Stage=CONST(Stage2);
            }
            part("INTERVIEW SPECIFIC EVALUATION AREA -STAGE 2"; "HR Interview Evaluation Stage2")
            {
                ApplicationArea = All;
                Caption = 'INTERVIEW SPECIFIC EVALUATION AREA -STAGE 2';
                SubPageLink = "Interview No."=FIELD("Interview No."), Stage=CONST(Stage3);
            }
            part("INTERVIEW SPECIFIC EVALUATION AREA -STAGE 3"; "HR Interview Evaluation Stage3")
            {
                ApplicationArea = All;
                Caption = 'INTERVIEW SPECIFIC EVALUATION AREA -STAGE 3';
                SubPageLink = "Interview No."=FIELD("Interview No."), Stage=CONST("Stage3");
            }
            part(INTERVIEWER; "HR Interviewer Details")
            {
                Caption = 'INTERVIEWER';
                SubPageLink = "Interview No."=FIELD("Interview No.");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
    var HRJobApplications: Record "HR Job Applications";
    HrIntMessage: Record "Receipts and Payment Types";
    //SMTP: Codeunit "SMTP Mail";
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    CompInfo: Record "Company Information";
    HREmpApplication: Record "HR Employee Requisitions";
    LinesRec: Record "Hr Interview Specific Evaluatn";
    //Areas: Record "Cash Office User Template";
    IntEv: Record "Hr Interview Evaluation"; 
}
