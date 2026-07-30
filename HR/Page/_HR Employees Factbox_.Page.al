page 54521 "HR Employees Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(PersonalDetails; PersonalDetails)
            {
                Style = StrongAccent;
                StyleExpr = TRUE;
                ApplicationArea = all;
            }
            field("No."; Rec."No.")
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
            field("Personal E-Mail"; Rec."Personal E-Mail")
            {
                ApplicationArea = all;
            }
            field("Company E-Mail"; Rec."Company E-Mail")
            {
                ApplicationArea = all;
            }
            field(Status; rec.Status)
            {
                ApplicationArea = all;
            }
            field(JobDetails; JobDetails)
            {
                Style = StrongAccent;
                StyleExpr = TRUE;
                ApplicationArea = all;
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = all;
            }
            field("Job Description"; Rec."Job Description")
            {
                ApplicationArea = all;
            }
            field(Grade; rec.Grade)
            {
                ApplicationArea = all;
            }
            field(LeaveDetails; LeaveDetails)
            {
                Style = StrongAccent;
                StyleExpr = TRUE;
                ApplicationArea = all;
            }
            field("Leave Balance"; Rec."Leave Balance")
            {
                ApplicationArea = all;
            }
            field("Total Leave Taken"; Rec."Total Leave Taken")
            {
                ApplicationArea = all;
            }
            field("Allocated Leave Days"; Rec."Allocated Leave Days")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
    var PersonalDetails: Label 'Personal Details';
    BankDetails: Label 'Bank Details';
    JobDetails: Label 'Job Details';
    LeaveDetails: Label 'Leave Details';
}
