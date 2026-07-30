page 50255 "HR Job Applications Card"
{
    ApplicationArea = All;
    Caption = 'HR Job Applications';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions,Other Details';
    SourceTable = "HR Job Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Application No"; Rec."Application No")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Date Applied"; Rec."Date Applied")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Caption = 'Internal';
                    Editable = true;
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    Caption = 'Application Reff No.';
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Job Applied For"; Rec."Job Applied For")
                {
                    Caption = 'Position Applied For';
                    Enabled = true;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = all;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    Caption = '1st Language (R/W/S)';
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    Caption = '1st Language Read';
                    ApplicationArea = all;
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    Caption = '1st Language Write';
                    ApplicationArea = all;
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    Caption = '1st Language Speak';
                    ApplicationArea = all;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    Caption = '2nd Language (R/W/S)';
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = all;
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = all;
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = all;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = all;
                }
                field("Applicant Type"; Rec."Applicant Type")
                {
                    Enabled = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field(Gender; Rec.Gender)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = all;
                }
                field("Country Details"; Rec."Citizenship Details")
                {
                    Editable = false;
                    ApplicationArea = All;

                }
                group(Control7)
                {
                    ShowCaption = false;
                    Visible = SalVisible;
                    field("Current Salary"; Rec."Current Salary")
                    {
                        ApplicationArea = All;
                    }
                }
                field("Expected Salary"; Rec."Expected Salary")
                {
                    ApplicationArea = all;
                }
                label("Shortlisting Summary")
                {
                    CaptionClass = Text19064672;
                    Caption = 'Shortlisting Summary';
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Total Score"; Rec."Total Score")
                {
                    Caption = 'Test Score';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field(Qualified; Rec.Qualified)
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Qualified (Test)"; Rec."Qualified (Test)")
                {
                    //Editable = false;
                    ApplicationArea = all;
                }
                field("Qualified (Interview)"; Rec."Qualified (Interview)")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Interview Invitation Sent"; Rec."Interview Invitation Sent")
                {
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Test Invitation Sent"; Rec."Test Invitation Sent")
                {
                    ApplicationArea = all;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = all;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = all;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = all;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = all;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Editable = true;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        if Rec."Date Of Birth" >= Today then begin
                            Error('Invalid Entry');
                        end;
                        //DAge:= Dates.DetermineAge("Date Of Birth",TODAY); //Lateef  //jj070322
                        Rec.Validate(Age, DAge);
                    end;
                }
                field(Age; Rec.Age)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    Caption = 'Postal Address 2';
                    ApplicationArea = All;

                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    Caption = 'Postal Address 3';
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = all;
                }
                field("Residential Address2"; Rec."Residential Address2")
                {
                    ApplicationArea = all;
                }
                field("Residential Address3"; Rec."Residential Address3")
                {
                    ApplicationArea = all;
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    Caption = 'Post Code 2';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755009; "HR Job Applications Factbox")
            {
                SubPageLink = "Application No" = FIELD("Application No");
                ApplicationArea = all;
            }
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Other Details")
            {
                Caption = 'Other Details';
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Qualifications";
                    RunPageLink = "Application No" = FIELD("Application No");
                    ApplicationArea = all;
                }
                action(Referees)
                {
                    Caption = 'Referees';
                    Image = ContactReference;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Applicant Referees";
                    RunPageLink = "Job Application No" = FIELD("Application No");
                    ApplicationArea = all;
                }
                action(Hobbies)
                {
                    Caption = 'Hobbies';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = All;
                    //RunObject = Page "HR Applicant Hobbies";
                    //RunPageLink = "Job Application No" = FIELD ("Application No");
                }
                action("Hr Test")
                {
                    Caption = 'HR Applicant Test Result';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "HR Applicant Test Result";
                    RunPageLink = "Applicant No." = FIELD("Application No"),
                                  "Requisition No." = FIELD("Employee Requisition No");
                    ApplicationArea = all;
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    ApplicationArea = all;
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No" = FIELD("Application No"),
                                  "Document Type" = CONST(Job);

                    trigger OnAction()
                    begin
                        /*HRJobApplications.RESET;
                        HRJobApplications.SETRANGE(HRJobApplications."Application No","Application No");
                        IF HRJobApplications.FIND('-') THEN
                        REPORT.RUN(51534525,TRUE,TRUE,HRJobApplications);
                        */

                    end;
                }
                action("Generate Offer Letter")
                {
                    Caption = 'Generate Offer Letter';
                    ApplicationArea = all;
                    Image = Document;
                    Promoted = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        InterviewEvaluation.SetRange(InterviewEvaluation."Application No.", Rec."Application No");
                        if InterviewEvaluation.FindFirst then begin
                            if InterviewEvaluation."Recommendation for Hire" = false then
                                Error('Recommend for hire must be true on Interview evaluation card for the applicant');

                            Rec.Reset;
                            Rec.SetFilter("Application No", Rec."Application No");
                            REPORT.RUN(51534711, true, true, Rec);
                            Rec.Reset;

                        end;
                    end;
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    ApplicationArea = all;
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "HR Employment History Lines";
                    RunPageLink = "Employee No." = FIELD("Application No"),
                                  Status = CONST(Applicant);
                }
            }
            group("&Functions")
            {
                Caption = '&Functions';
                action("&Send Test Invitation")
                {
                    Caption = '&Send Test Invitation';
                    ApplicationArea = all;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Qualified);
                        /* HRJobApplications.SETFILTER(HRJobApplications."Application No","Application No");
                        REPORT.RUN(51534540,FALSE,FALSE,HRJobApplications);
                         */

                        //if "Test Invitation Sent" = true then
                        //  Error('Applicant has been notified');

                        // TestField(Qualified);
                        CompInfo.Get();
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
                        HRJobApplications.SetRange(HRJobApplications.Qualified, true);
                        if HRJobApplications.Find('-') then

                            //GET E-MAIL PARAMETERS FOR JOB INTERVIEW

                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Invite for Test");
                        if HrIntMessage.Find('-') then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            //     EmailAdd.Add('olajumokeo@reeltechsolution.com');
                            //     SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd, HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //    HrIntMessage.Message + ' ' + 'at' + HrIntMessage.Venue + ' ' + 'On' + Format(HrIntMessage.Date), true);
                            //     if not SMTP.Send() then begin
                            Message('Mail not sent');
                            Rec."Test Invitation Sent" := false;
                        end else begin
                            Message('Applicant has been Notified for the Invitation');
                            Rec."Test Invitation Sent" := true;
                            Rec.Modify;
                        end;
                    end;

                    // end;
                }
                action("&Send Interview Invitation")
                {
                    Caption = '&Send Interview Invitation';
                    ApplicationArea = all;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        //TestField("Qualified (Test)", true);
                        // HRJobApplications.SETFILTER(HRJobApplications."Application No", rec."Application No");
                        //REPORT.RUN(51534540, FALSE, FALSE, HRJobApplications);

                        rec.TestField(Qualified, true);

                        if rec."Interview Invitation Sent" = true then
                            Error('Applicant has been notified');


                        // TestField(Qualified);
                        CompInfo.Get();
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No");
                        if HRJobApplications.Find('-') then

                            //GET E-MAIL PARAMETERS FOR JOB INTERVIEW

                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Invite for Interview");
                        if HrIntMessage.Find('-') then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            // SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd,
                            //    HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //    HrIntMessage.Message + ' ' + 'at' + HrIntMessage.Venue + ' ' + 'On' + Format(HrIntMessage.Date), true);
                            // SMTP.Send();
                            Message('Applicant has been Notified for the Invitation');
                            Rec."Interview Invitation Sent" := true;
                            Rec.Modify;
                        end;

                    end;
                }
                action("&Upload to Employee Card")
                {
                    Caption = '&Upload to Employee Card';
                    ApplicationArea = all;
                    Image = ImportDatabase;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        InterviewEvaluation.SetRange(InterviewEvaluation."Application No.", Rec."Application No");
                        if InterviewEvaluation.FindFirst then begin
                            if InterviewEvaluation."Job Acceptance" = false then
                                Error('Job acceptance must be true on interview evaluation card')
                            else begin
                                HREmpApplication.SetRange(HREmpApplication."Requisition No.", Rec."Employee Requisition No");
                                HREmpApplication.SetRange(HREmpApplication."Job ID", Rec."Job Applied For");
                                if HREmpApplication.FindFirst then begin
                                    HREmpApplication."Turn Around Time" := (Today - HREmpApplication."Requisition Date");
                                    HREmpApplication.Modify;
                                    Commit;
                                end;
                                Rec."Employee Creation Date" := Today;

                                //IF "Employee No" = '' THEN BEGIN
                                //IF NOT CONFIRM('Are you sure you want to Upload Applicants information to the Employee Card',FALSE) THEN EXIT;
                                HRJobApplications.SetFilter(HRJobApplications."Application No", Rec."Application No");
                                REPORT.RUN(51534705, true, false, HRJobApplications);
                                //END; //ELSE BEGIN
                                //MESSAGE('This applicants information already exists in the employee card');
                            end;
                            //END;
                        end;
                    end;
                }
                action("&Interview Message Setup")
                {
                    Caption = '&Interview Message Setup';
                    ApplicationArea = all;
                    Image = Setup;
                    RunObject = Page "Hr Interview Evaluatn Msg List";
                }
                action("&Print")
                {
                    Caption = '&Print';
                    ApplicationArea = all;
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Report "HR Job Applications";

                    trigger OnAction()
                    begin
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", Rec."Application No");
                        if HRJobApplications.Find('-') then
                            REPORT.RUN(51534628, true, true, HRJobApplications);
                    end;
                }
                action("Send Mail")
                {
                    Image = Mail;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DisPCase: Record "HR Disciplinary Cases";
                        Emp: Record "HR Employees";
                    begin
                        SendMail;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Applicant Type" = Rec."Applicant Type"::Internal then
            SalVisible := false
    end;

    var
        EmailAdd: List of [Text];
        HRJobApplications: Record "HR Job Applications";
        // SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        Employee: Record "HR Employees";
        Text19064672: Label 'Shortlisting Summary';
        HREmpApplication: Record "HR Employee Requisitions";
        CompInfo: Record "Company Information";
        HrIntMessage: Record "Hr Interview Evaluatn Message";
        DAge: Text[100];
        InterviewEvaluation: Record "Hr Interview Evaluation";
        SalVisible: Boolean;

    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        // SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Emp: Record "HR Employees";
        EmpNames: Text[50];
    begin
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        if Rec."Sent to HR" then Error('Application has been sent to HR');
        Rec.TestField("Applicant Type", Rec."Applicant Type"::Internal);
        if Emp.Get(Rec."Employee No") then
            EmpNames := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";


        HrComm.Reset;
        HrComm.SetRange(HrComm.Commitee, HrComm.Commitee::"Internal job");
        if HrComm.FindSet then begin
            repeat
                HREmp.Get(HrComm."Employee No.");
                HREmp.TestField(HREmp."Company E-Mail");
                EmailAdd.Add(HREmp."Company E-Mail");
            // SMTP.CreateMessage('Job Advertisement', 'olajumokeo@reeltechsolutions.com', EmailAdd,
            //  'JOB APPLICATION', 'Application for the post of  ' + Rec."Employee Requisition No", true); //jj170222 inserted email add
            // SMTP.Send();

            until HrComm.Next = 0;
            Message('Application has been forwarded to HR');
        end;

        rec."Sent to HR" := true;
        rec.Modify;
    end;
}


