page 50302 "HR Successful Candidates"
{
    CardPageID = "HR Interview Evaluation Card";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Hr Interview Evaluation";
    SourceTableView = WHERE(Status = CONST(Approved));
    AdditionalSearchTerms = 'HR Successful Candidates';

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
                field("Offer Status"; Rec."Offer Status")
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
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Applicant)
            {
                Caption = 'Applicant';

                action("Generate Offer Letter")
                {
                    Caption = 'Generate Offer Letter';
                    Image = Document;
                    ApplicationArea = all;
                    Promoted = true;
                    RunObject = Report "HR Employement Letter";
                    Visible = true;
                }
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = FIELD("Application No.");
                }
                action(Referees)
                {
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Referees";
                    RunPageLink = "Job Application No" = FIELD("Application No.");
                }
                action(Hobbies)
                {
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Hobbies";
                    RunPageLink = "Job Application No" = FIELD("Application No.");
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = History;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HR Employment History Lines";
                    RunPageLink = "Employee No." = FIELD("Application No."), Status = CONST(Applicant);
                }
            }
        }
    }
    var
        HRJobApplications: Record "HR Job Applications";
        HREmpApplication: Record "HR Employee Requisitions";
        CompInfo: Record "Company Information";
        HrIntMessage: Record "Receipts and Payment Types";
    //SMTP: Codeunit "SMTP Mail";
}
