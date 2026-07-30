page 54571 "HR Interview Evaluation Card"
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
                field("Interview No."; Rec."Interview No.")
                {
                    ApplicationArea = all;
                }
                field("Interview Process"; Rec."Interview Process")
                {
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Job Position"; Rec."Job Position")
                {
                    ApplicationArea = all;
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                    /*CurrPage.UPDATE;
                        SetColumns;
                        VALIDATE("Experience Level")
                         */
                    end;
                }
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                        SetColumns;
                        rec.Validate(rec."Experience Level");
                    end;
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
                field(Initial; rec.Initial)
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
                field("Interview Done By"; Rec."Interview Done By")
                {
                    Visible = false;
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Current Salary (N) P/A"; Rec."Current Salary (N) P/A")
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
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Technical Knowledge/Competence"; Rec."Technical Knowledge/Competence")
                {
                    ApplicationArea = all;
                }
                field("Culture Fit"; Rec."Culture Fit")
                {
                    ApplicationArea = all;
                }
                field("Communication & Oral Presentat"; Rec."Communication & Oral Presentat")
                {
                    ApplicationArea = all;
                }
                field("Personal Value"; Rec."Personal Value")
                {
                    ApplicationArea = all;
                }
                field("Total Evaluation Score"; Rec."Total Evaluation Score")
                {
                    Style = Strong;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Recommend for Stage 2"; Rec."Recommend for Stage 2")
                {
                    Caption = 'Recommend To ED';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Recommend for Stage 3"; Rec."Recommend for Stage 3")
                {
                    Caption = 'Recommend To MD';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("HMO Stage"; Rec."HMO Stage")
                {
                    Caption = 'Recommend for Medical Test Stage';
                    ApplicationArea = all;
                }
                field("Recommendation for Hire"; Rec."Recommendation for Hire")
                {
                    Caption = 'Recommend for Hire';
                    ApplicationArea = All;
                }
                field("Interview Assessment"; Rec."Interview Assessment")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    Caption = 'ED Comment';
                    Editable = CommentEditable;
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field(Comment2; rec.Comment2)
                {
                    Caption = 'MD Comment';
                    Editable = CommentEditable;
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Offer Status"; Rec."Offer Status")
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                field("Pass Mark (%)"; Rec."Pass Mark (%)")
                {
                    ApplicationArea = all;
                }
                field("Experience Level"; Rec."Experience Level")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if rec."Experience Level" = rec."Experience Level"::"0-4 Years" then begin
                            PageVisible:=false;
                            PageVisibleA:=true;
                        end
                        else if rec."Experience Level" = rec."Experience Level"::"5 Years & Above" then begin
                                PageVisible:=true;
                                PageVisibleA:=false;
                            end;
                        CurrPage.Update;
                    end;
                }
                field("Job Acceptance"; Rec."Job Acceptance")
                {
                    ApplicationArea = all;
                }
            }
            part(Communication; "HR Oral Interview Evaluation")
            {
                ApplicationArea = All;
                Caption = 'COMMUNICATION/ORAL PRESENTATION';
                SubPageLink = "Interview No."=FIELD("Interview No.");
                SubPageView = WHERE("Interview Group"=CONST('COMMUNICATION/ORAL PRESENTATION'), "Experience Level"=CONST("5 Years & Above"));
                Visible = PageVisible;
            }
            part(LeadwayPensure; "HR Oral Interview Evaluation")
            {
                ApplicationArea = All;
                Caption = 'LEADWAY PENSURE CULTURE FIT';
                SubPageLink = "Interview No."=FIELD("Interview No.");
                SubPageView = WHERE("Interview Group"=CONST('LEADWAY PENSURE CULTURE FIT'), "Experience Level"=CONST("5 Years & Above"));
                Visible = PageVisible;
            }
            part(TechnicalKnow; "HR Oral Interview Evaluation")
            {
                ApplicationArea = All;
                Caption = 'TECHNICAL KNOWLEDGE/COMPETENCY';
                SubPageLink = "Interview No."=FIELD("Interview No.");
                SubPageView = WHERE("Interview Group"=CONST('TECHNICAL KNOWLEDGE/COMPETENCY'), "Experience Level"=CONST("5 Years & Above"));
                Visible = PageVisible;
            }
            part(PersonalValues; "HR Oral Interview Evaluation")
            {
                ApplicationArea = All;
                Caption = 'PERSONAL VALUES';
                SubPageLink = "Interview No."=FIELD("Interview No.");
                SubPageView = WHERE("Interview Group"=CONST('PERSONAL VALUES'), "Experience Level"=CONST("5 Years & Above"));
                Visible = PageVisible;
            }
            part(AppAssessment; "HR Oral Interview A")
            {
                ApplicationArea = All;
                Caption = 'Applicant Assessment';
                SubPageLink = "Interview No."=FIELD("Interview No.");
                SubPageView = WHERE("Experience Level"=CONST("0-4 Years"));
                Visible = PageVisibleA;
            }
            part("Interviewers' Comment"; "HR Interviewer Comment2")
            {
                ApplicationArea = All;
                Caption = 'Interviewers'' Comment';
                SubPageLink = "Interview No."=FIELD("Interview No."), "Requisition No"=FIELD("Requisition No.");
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
                Image = SendMail;

                action("&Recommend to ED  Mail")
                {
                    Caption = '&Recommend to ED  Mail';
                    ApplicationArea = all;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        //TESTFIELD("Recommend for Stage 2") ;
                        if rec."Interview Invitation (Stage 2)" = true then Error('Applicant has been notified');
                        CompInfo.Get();
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Recommend for Stage 2");
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EmailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for the Invitation');
                        //"Interview Invitation (Stage 2)" := true;
                        //Modify;
                        end;
                    end;
                }
                action("&Recommend to MD Mail")
                {
                    Caption = '&Recommend to MD Mail';
                    ApplicationArea = all;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        rec.TestField("Recommend for Stage 3");
                        CompInfo.Get();
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Recommend for Stage 3");
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EmailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message + ' ' + 'at' + HrIntMessage.Venue + ' ' + 'On' + Format(HrIntMessage.Date), true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for the Invitation');
                        end;
                    end;
                }
                action("&Recommend For Hire Mail")
                {
                    Caption = '&Recommend For Hire Mail';
                    ApplicationArea = all;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        CompInfo.Get();
                        rec.TestField("Recommendation for Hire");
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Recommend for Hire");
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EmailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for the Job Employment');
                        end;
                    end;
                }
                action("Recommend for HMO Stage")
                {
                    Caption = '&Recommend for Medical Test Stage';
                    ApplicationArea = all;
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        rec.TestField("HMO Stage");
                        CompInfo.Get();
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Recommend for HMO");
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EmailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            rec."HMO Stage":=true;
                            rec.Modify;
                            Message('Applicant has been Notified of Medical Test');
                        end;
                    end;
                }
                action("Successful Candidate")
                {
                    Caption = 'Successful Mail';
                    ApplicationArea = all;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        CompInfo.Get();
                        rec.TestField(Status, rec.Status::Approved);
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::Successful);
                        HrIntMessage.Reset;
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EmailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for the Job Employment');
                        end;
                        rec.TestField(Status, rec.Status::Approved);
                        rec."Offer Status":=rec."Offer Status"::Successful;
                    end;
                }
                action("Not Successful Candidates")
                {
                    Caption = 'Not Successful Mail';
                    ApplicationArea = all;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        CompInfo.Get();
                        rec.TestField(Status, rec.Status::Approved);
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Not Successful");
                        HrIntMessage.Reset;
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EMailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for not being successful');
                        end;
                    end;
                }
                action("&Messages & Venue Setup")
                {
                    Caption = '&Messages & Venue Setup';
                    Image = Setup;
                    ApplicationArea = all;
                    RunObject = Page "Hr Interview Evaluatn Msg List";
                }
                action("&Keep In-View")
                {
                    Caption = '&Keep In-View';
                    Image = History;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to keep this Applicant In-View?', true) = false then exit
                        else
                            rec."Offer Status":=rec."Offer Status"::"Keep In-view";
                        CompInfo.Get();
                        //TESTFIELD(Status,Status<>Approved);
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::Pending);
                        HrIntMessage.Reset;
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            rec."Offer Status":=rec."Offer Status"::"Keep In-view";
                            Message('The applicant has been duly notified of status of the Job Application %1', rec."Job Position");
                        end;
                    end;
                }
                action("Revisit Candidate")
                {
                    Caption = 'Revisit Candidate';
                    Image = Reuse;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to revisit this Applicant Job Application?', true) = false then exit
                        else
                            rec."Offer Status":=rec."Offer Status"::Revisited;
                    end;
                }
            }
            group("&MD Approval")
            {
                Caption = '&MD Approval';

                action("Send For ED/MD Approval")
                {
                    Caption = 'Send For ED/MD Approval';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //TESTFIELD("Recommendation for Hire");
                        rec.TestField("Interview Process", rec."Interview Process"::"Requires ED & MD Approval");
                        CommentExist;
                        If Confirm('Send this Applicant for Approval?', true) = false then exit;
                    //ApprovalMgt.SendInterviewEvalApprovalReq(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                    //ApprovalMgt.CancelInterviewEvalRequest(Rec,TRUE,TRUE);
                    end;
                }
                action("Get Evaluation Areas")
                {
                    Caption = 'Get Evaluation Areas';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        LinesRec.Reset;
                        LinesRec.SetRange("Interview No.", rec."Interview No.");
                        If LinesRec.FindSet then if Confirm('Do you want to overwrite the existing lines?', false) = true then begin
                                LinesRec.DeleteAll;
                                IntAreas.Reset;
                                IntAreas.SetRange(IntAreas.Job, rec."Job Title");
                                If IntAreas.Find('-')then begin
                                    repeat LinesRec.Init;
                                        LinesRec."Evaluation Code":=IntAreas."Requisition No.";
                                        LinesRec."Interview No.":=rec."Interview No.";
                                        LinesRec."Evaluation Description":=IntAreas."Evaluation Description";
                                        LinesRec."Total Target":=IntAreas."Pass Mark";
                                        LinesRec.Stage:=IntAreas.Stage;
                                        If Areas.Get(IntAreas."Requisition No.")then LinesRec.Weight:=Areas."Evaluation Score";
                                        LinesRec.Insert;
                                    Until IntAreas.Next = 0;
                                end;
                            end;
                    end;
                }
                action("Skip MD & ED")
                {
                    Image = StepOver;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        UserSetup.Get(UserId);
                        If UserSetup."HR Job" = true then begin
                            rec.TestField("Interview Process", rec."Interview Process"::"Not Applicable");
                            If rec."HMO Stage" then exit;
                            if not Confirm('Are you sure you want to recommend applicant for medical', false)then exit;
                            rec."HMO Stage":=true;
                            rec.Modify;
                            Message('Successful');
                        end
                        else
                            Error('you do not have permission to carry out this activity');
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if rec."Experience Level" = rec."Experience Level"::"0-4 Years" then begin
            PageVisible:=false;
            PageVisibleA:=true;
        end
        else if rec."Experience Level" = rec."Experience Level"::"5 Years & Above" then begin
                PageVisible:=true;
                PageVisibleA:=false;
            end;
        CommentEditabl;
    end;
    trigger OnInit()
    begin
        PageVisible:=false;
        PageVisibleA:=false;
    end;
    trigger OnOpenPage()
    begin
        SetColumns;
        CommentEditabl;
    end;
    var EmailAdd: List of[Text];
    HRJobApplications: Record "HR Job Applications";
    HrIntMessage: Record "Hr Interview Evaluatn Message";
    //SMTP: Codeunit "SMTP Mail";
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    CompInfo: Record "Company Information";
    HREmpApplication: Record "HR Employee Requisitions";
    Text001: Label 'Are you sure you want to Upload Applicants Details to the Employee Card?';
    Text002: Label 'Are you sure you want to Send an Interview Application?';
    LinesRec: Record "Hr Interview Specific Evaluatn";
    Areas: Record "Hr Interview Evaluation Areas";
    IntEv: Record "Hr Interview Evaluation";
    IntAreas: Record "HR Job Evaluation Areas";
    MatrixRecord: Record "HR Job Evaluation Areas";
    MatrixRecords: array[32]of Record "HR Job Evaluation Areas";
    MATRIX_SetWanted: Option Initial, Previous, Same, Next;
    MATRIX_CaptionSet: array[32]of Text[1024];
    MATRIX_CaptionRange: Text[100];
    MATRIX_PKFirstRecInCurrSet: Text[100];
    RunNo: Code[20];
    Family: Record "HR Job Evaluation Areas";
    EmpIntV: Record "HR Job Evaluation Areas";
    i: Integer;
    MachineCenter: Record "Machine Center";
    PageVisible: Boolean;
    PageVisibleA: Boolean;
    CommentEditable: Boolean;
    UserSetup: Record "User Setup";
    [Scope('Cloud')]
    procedure SetColumns()
    var
        MatrixMgt: Codeunit "Matrix Management";
        CaptionFieldNo: Integer;
        CurrentMatrixRecordOrdinal: Integer;
    begin
        i:=0;
        Clear(MATRIX_CaptionSet);
        EmpIntV.SetRange(EmpIntV."ED of Requesting Dept", false);
        EmpIntV.SetRange(EmpIntV."Requisition No.", rec."Requisition No.");
        if EmpIntV.FindSet then begin
            repeat i+=1;
                MATRIX_CaptionSet[i]:=EmpIntV."Employee Name";
            until EmpIntV.Next = 0;
        end;
        CurrPage.AppAssessment.PAGE.ShowColumnCap(MATRIX_CaptionSet);
        CurrPage.Communication.PAGE.ShowColumnCap(MATRIX_CaptionSet);
        CurrPage.LeadwayPensure.PAGE.ShowColumnCap(MATRIX_CaptionSet);
        CurrPage.TechnicalKnow.PAGE.ShowColumnCap(MATRIX_CaptionSet);
        CurrPage.PersonalValues.PAGE.ShowColumnCap(MATRIX_CaptionSet);
    end;
    local procedure CommentExist()
    var
        HRInterviewerComment: Record "HR Interviewer Comment";
    begin
        HRInterviewerComment.SetRange(HRInterviewerComment."Interview No.", rec."Interview No.");
        if not HRInterviewerComment.FindFirst then Error('interviewers comment not found');
        HRInterviewerComment.SetRange(HRInterviewerComment."Interview No.", rec."Interview No.");
        if HRInterviewerComment.FindFirst then repeat HRInterviewerComment.TestField(Comment);
            until HRInterviewerComment.Next = 0;
    end;
    local procedure CommentEditabl()
    begin
        if(rec.Status = rec.Status::New) or (rec.Status = rec.Status::Approved)then CommentEditable:=false
        else if rec.Status = rec.Status::"Pending Approval" then CommentEditable:=true;
    end;
}
