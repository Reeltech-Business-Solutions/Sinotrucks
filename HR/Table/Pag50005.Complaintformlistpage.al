page 50150 "Complaint form list page"
{
    CardPageId = "Complaint Form Card";
    ApplicationArea = All;
    Caption = 'Complaint form list page';
    PageType = List;
    SourceTable = "Complaint Form";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ToolTip = 'Specifies the value of the Complaint No. field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Company Email"; Rec."Company Email")
                {
                    ToolTip = 'Specifies the value of the Company Email field.';
                }
                field("Employee  Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Applicant Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }



                field("Complaint Details"; Rec."Complaint Details")
                {
                    ToolTip = 'Specifies the value of the Complaint Details field.';
                }
                field("Nature of Complaint"; Rec."Nature of Complaint")
                {
                    ToolTip = 'Specifies the value of the Nature of Complaint field.';
                }
                field("Date of incident"; Rec."Date of incident")
                {
                    ToolTip = 'Specifies the value of the Date of incident field.';
                }
                field("Description of complaint"; Rec."Description of complaint")
                {
                    ToolTip = 'Specifies the value of the Description of complaint field.';

                }
                field("Details of Incident"; Rec."Details of Incident")
                {
                    ToolTip = 'Specifies the value of the Details of Incident field.';
                }

            }
        }
    }
}
