page 54589 "Keep In-view Evaluation List"
{
    CardPageID = "Keep In-View Evaluation Card";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Hr Interview Evaluation";
    SourceTableView = WHERE("Offer Status"=FILTER("Keep In-view"));
    AdditionalSearchTerms = 'Keep In-view Evaluation List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Interview No."; Rec."Interview No.")
                {
                    ApplicationArea = all;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    ApplicationArea = all;
                }
                field(Email; rec.Email)
                {
                    ApplicationArea = all;
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Stage 1 Score"; Rec."Stage 1 Score")
                {
                    ApplicationArea = all;
                }
                field("Stage 2 Score"; Rec."Stage 2 Score")
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
                    ApplicationArea = all;
                }
                field("Job Acceptance"; Rec."Job Acceptance")
                {
                    ApplicationArea = all;
                }
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
}
