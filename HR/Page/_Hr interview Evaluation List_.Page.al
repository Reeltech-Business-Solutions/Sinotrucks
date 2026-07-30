page 54575 "Hr interview Evaluation List"
{
    Caption = 'Interview Evaluation List';
    CardPageID = "HR Interview Evaluation Card";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Hr interview Evaluation List';
    SourceTable = "Hr Interview Evaluation";

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
                field("Job Acceptance"; Rec."Job Acceptance")
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
            group("Interview Recomendation Mail")
            {
                Caption = '&Interview Recomendation Mail';
                Image = SendMail;

                action("&Recommend For Stage 2 Mail")
                {
                    Caption = '&Recommend For Stage 2 Mail';
                    ApplicationArea = all;
                    Image = SendMail;

                    trigger OnAction()
                    begin
                        rec.TestField("Recommend for Stage 2");
                        CompInfo.Get();
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Invite for Interview");
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message + ' ' + 'at' + HrIntMessage.Venue + ' ' + 'On' + Format(HrIntMessage.Date), true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for the Invitation');
                        end;
                    end;
                }
                action("&Recommend for Stage 3 Mail")
                {
                    Caption = '&Recommend for Stage 3 Mail';
                    Image = SendMail;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        rec.TestField("Recommend for Stage 2");
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
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd,
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
                    Image = SendMail;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        CompInfo.Get();
                        rec.TestField(Status, rec.Status::Approved);
                        HRJobApplications.Reset;
                        HRJobApplications.SetRange(HRJobApplications."Application No", rec."Application No.");
                        if HRJobApplications.Find('-')then //GET E-MAIL PARAMETERS FOR JOB INTERVIEW
                            HrIntMessage.Reset;
                        HrIntMessage.SetRange(HrIntMessage.Stages, HrIntMessage.Stages::"Recommend for Stage 3");
                        if HrIntMessage.Find('-')then begin
                            HRJobApplications.TestField(HRJobApplications."E-Mail");
                            CompInfo.TestField(CompInfo."E-Mail");
                            EmailAdd.Add(HRJobApplications."E-Mail");
                            //SMTP.CreateMessage(CompInfo.Name, CompInfo."E-Mail", EMailAdd,
                            //HrIntMessage.Subject, 'Dear' + ' ' + HRJobApplications."First Name" + ' ' +
                            //HrIntMessage.Message, true);
                            //SMTP.Send();
                            Message('Applicant has been Notified for the Job Employment');
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
            }
            group("&MD Approval")
            {
                Caption = '&MD Approval';

                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal;
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType:=DocumentType::"Interview Evaluation";
                        ApprovalEntries.Setrecordfilters(DATABASE::"Hr Interview Evaluation", DocumentType, rec."Interview No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Send For MD Approval")
                {
                    Caption = 'Send For MD Approval';
                    Image = SendApprovalRequest;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        rec.TestField("Recommendation for Hire");
                        if Confirm('Send this Applicant for Approval?', true) = false then exit;
                    //ApprovalMgt.SendInterviewEvalReq(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                    /*IF CONFIRM('Cancel Approval Request?',TRUE)=FALSE THEN EXIT;
                        ApprovalMgt.CancelInterviewAppRequest(Rec,TRUE,TRUE); */
                    end;
                }
            }
        }
    }
    var EmailAdd: List of[Text];
    HRJobApplications: Record "HR Job Applications";
    HrIntMessage: Record "Hr Interview Evaluatn Message";
    //SMTP: Codeunit "SMTP Mail";
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    CompInfo: Record "Company Information";
}
