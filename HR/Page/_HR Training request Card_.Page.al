page 54451 "HR Training request Card"
{
    PageType = Card;
    SourceTable = "HR Training Applications";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = all;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                }
                field(Duration; rec.Duration)
                {
                    ApplicationArea = all;
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = all;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        rec.Duration:=rec."To Date" - rec."From Date";
                    end;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = all;
                }
                field("Approved Cost"; Rec."Approved Cost")
                {
                    ApplicationArea = all;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field(Location; rec.Location)
                {
                    ApplicationArea = all;
                }
                field(Provider; rec.Provider)
                {
                    ApplicationArea = all;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("No. of Applicants"; Rec."No. of Applicants")
                {
                    ApplicationArea = all;
                }
            }
            part(Control20; "Hr Training Need App SF")
            {
                SubPageLink = "Document No."=FIELD("Application No");
            }
        }
        area(factboxes)
        {
            systempart(Control19; Notes)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(processing)
        {
            group("&Show")
            {
                Caption = '&Show';

                action(Comments)
                {
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal;
                    begin
                        DocumentType:=DocumentType::"Training Requisition";
                    /*
                        ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,"Application No");
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,"Application No");
                        ApprovalComments.RUN;
                         */
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action("&Approvals")
                {
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal, "Canteen Application";
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocType:=DocType::"Training Requisition";
                        ApprovalEntries.SetRecordFilters(DATABASE::"HR Training Applications", DocType, rec."Application No");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Send Approval &Request")
                {
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        //TESTFIELDS;
                        if Confirm('Send this Application for Approval?', true) = false then exit;
                    //ApprovalMgt.SendTrainingAppApprovalRequest(Rec);
                    end;
                }
                action("&Cancel Approval request")
                {
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                    //ApprovalMgt.CancelTrainingAppApprovalReq(Rec,TRUE,TRUE);
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Image = PrintForm;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::Approved);
                        HRTrainingApplications.SetRange(HRTrainingApplications."Application No", rec."Application No");
                        if HRTrainingApplications.Find('-')then REPORT.Run(39005580, true, true, HRTrainingApplications);
                    end;
                }
                action("<A ction1102755042>")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;

                    trigger OnAction()
                    begin
                        rec.Status:=rec.Status::New;
                        rec.GeneratePV();
                        rec.Modify;
                    end;
                }
                action("Generate PV")
                {
                    Caption = 'Generate Payment Request';
                    Image = Payment;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::Approved);
                        rec.GeneratePV;
                    end;
                }
                action("Send Mail")
                {
                    Image = Mail;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DisPCase: Record "HR Disciplinary Cases";
                        Emp: Record "HR Employees";
                    begin
                        rec.TestField(Status, rec.Status::Approved);
                        SendMail;
                    end;
                }
                action("Test Attachment")
                {
                /*
                    Caption = 'Attachment';
                    RunObject = Page "Attachment Test";
                    RunPageLink = "Employee No" = FIELD("User ID"),
                                  "Document Type" = CONST(Training),
                                  "Application No" = FIELD("Application No"),
                                  "Folder Type" = CONST(HR);
                                  */
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec.Type:=rec.Type::HR;
    end;
    var HRTrainingApplications: Record "HR Training Applications";
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    ApprovalComments: Page "Approval Comments";
    [InDataSet]
    "Responsibility CenterEditable": Boolean;
    [InDataSet]
    "Application NoEditable": Boolean;
    DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal;
    DocType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", JV, "Payment Voucher", "Petty Cash", Requisition, InterBank, "Staff Claim", "Staff Advance", AdvanceSurrender, Capex, IJ, "Hr Job", "Emp Loan", "Leave Application", "Employee Requisition", "Interview Evaluation", "Training Requisition", Appraisal, HMO;
    TrainingApplicant: Record "HR Training Need Participant";
    VendorName: Code[50];
    HREmailParameters: Record "HR E-Mail Parameters";
    HREmployeeRec: Record "HR Employees";
    EmpEmail: Text;
    //smtp: Codeunit "SMTP Mail";
    //smtpTable: Record "SMTP Mail Setup";
    senderEmail: Text;
    receiverEmail: List of[Text];
    EmailSubject: Text[100];
    SenderName: Text[50];
    EmailBody: Text[250];
    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        //HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Emp: Record "HR Employees";
        EmpNames: Text[50];
    begin
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        if rec."Sent to Staff" then Error('All Applicants have been notified');
        TrainingApplicant.SetRange(TrainingApplicant."Document No.", rec."Application No");
        if TrainingApplicant.Find('-')then begin
            repeat HREmailParameters.Reset;
                HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Training Application");
                if HREmailParameters.Find('-')then begin
                    if HREmployeeRec.Get(TrainingApplicant."Employee Code")then begin
                        EmpEmail:=HREmployeeRec."Company E-Mail";
                        //if not smtpTable.Get then
                        Error('The SMTP Setup does not exist, the mail was not sent');
                        EmailSubject:=StrSubstNo('TRAINING APPLICATION - %1', TrainingApplicant."Staff Course Title");
                        receiverEmail.Add(EmpEmail);
                        senderEmail:='hr@leadway-pensure.com';
                        EmailBody:=('Dear, ' + HREmployeeRec."First Name" + '<BR><BR>' + HREmailParameters.Body + '<BR><BR>' + HREmailParameters."Body 2" + '<BR><BR>' + 'Venue:' + rec.Location + '<BR><BR>' + 'Start:' + Format(rec."From Date") + '<BR><BR>' + 'End:' + Format(rec."To Date") + '<BR><BR>' + 'Regards');
                    //SMTP.CreateMessage(SenderName, senderEmail, receiverEmail, EmailSubject, EmailBody, true);
                    //SMTP.Send;
                    end;
                end;
            until TrainingApplicant.Next = 0;
            Message('Applicants have been notified');
        end;
        rec."Sent to Staff":=true;
        rec.Modify;
    end;
}
