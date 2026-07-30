page 54472 "HR Employee Requisitions List"
{
    CardPageID = "HR Employee Requisition Card";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Employee Requisitions List';
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "HR Employee Requisitions";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;

                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = all;
                }
                field(Requestor; rec.Requestor)
                {
                    ApplicationArea = all;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = all;
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ApplicationArea = all;
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    Caption = 'Contract';
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = all;
                }
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Employee Req. Factbox")
            {
                SubPageLink = "Job ID"=FIELD("Job ID");
                ApplicationArea = All;
            }
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Job)
            {
                Caption = 'Job';

                action(Requirements)
                {
                    Caption = 'Requirements';
                    Image = JobListSetup;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Job Requirement Lines";
                    RunPageLink = "Job Id"=FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    Caption = 'Responsibilities';
                    Image = JobResponsibility;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID"=FIELD("Job ID");
                }
            }
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';

                action(Advertise)
                {
                    Caption = 'Advertise';
                    Image = Salutation;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        /*
                        HREmp.RESET;
                        REPEAT
                        HREmp.TESTFIELD(HREmp."Company E-Mail");
                        SMTP.CreateMessage('Job Advertisement','dgithahu@coretec.co.ke',HREmp."Company E-Mail",
                        'URAIA Job Vacancy','A vacancy with the job description' +"Job Description"+'is open for applications',TRUE);
                        SMTP.Send();
                        UNTIL HREmp.NEXT=0;
                        */
                        /*
                        TESTFIELD("Requisition Type","Requisition Type"::Internal);
                        HREmp.SETRANGE(HREmp.Status,HREmp.Status::Active);
                        IF HREmp.FIND('-') THEN
                        
                        //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                        HREmailParameters.RESET;
                        HREmailParameters.SETRANGE(HREmailParameters."Associate With",HREmailParameters."Associate With"::"Vacancy Advertisements");
                        IF HREmailParameters.FIND('-') THEN
                        BEGIN
                             REPEAT
                            // HREmp.TESTFIELD(HREmp."Company E-Mail");
                             HREmailParameters.TESTFIELD(HREmailParameters.Recipients)    ;
                             SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmailParameters.Recipients,
                             HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
                             HREmailParameters.Body+' '+ "Job Description" +' '+ HREmailParameters."Body 2"+' '+ FORMAT("Closing Date")+'. '+
                             HREmailParameters."Body 3",TRUE);
                             SMTP.Send();
                             UNTIL HREmp.NEXT=0;
                        
                        MESSAGE('All Employees have been notified about this vacancy');
                        END;
                         */
                        rec.TestField("Recruitment Type", rec."Recruitment Type"::Internal);
                        HREmp.RESET;
                        HREmp.SETRANGE(HREmp.Status, HREmp.Status::Active);
                        IF HREmp.FIND('-')THEN BEGIN
                            IF NOT HREmp.FIND('-')THEN EXIT;
                            REPEAT EmpName:=HREmp."First Name";
                            UNTIL HREmp.NEXT = 0;
                            //GET E-MAIL PARAMETERS FOR JOB APPLICATIONS
                            HREmailParameters.Reset;
                            HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Vacancy Advertisements");
                            if HREmailParameters.Find('-')then begin
                                // HREmp.TESTFIELD(HREmp."Company E-Mail");
                                Email.Add(HREmailParameters.Recipients);
                                HREmailParameters.TestField(HREmailParameters.Recipients);
                                //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", Email,
                                //HREmailParameters.Subject, 'Dear Staff ' +
                                //HREmailParameters.Body + ' ' + rec."Job Description" + ' ' + HREmailParameters."Body 2" + ' ' + Format(rec."Closing Date") + '. ' +
                                //HREmailParameters."Body 3", true);
                                //SMTP.Send();
                                Message('All Employees have been notified about this vacancy');
                            end;
                        end;
                    end;
                }
                action("&Approvals")
                {
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal;
                    begin
                        DocumentType:=DocumentType::"Employee Requisition";
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Employee Requisitions", DocumentType, rec."Requisition No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Send Approval Request")
                {
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if Confirm('Send this Requisition for Approval?', true) = false then exit;
                        TESTFIELDS;
                    //ApprovalMgt.SendEmpRequisitionAppReq(Rec);
                    end;
                }
                action("&Cancel Approval Request")
                {
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                    //ApprovalMgt.CancelEmpRequisitionAppRequest(Rec,TRUE,TRUE);
                    end;
                }
                action("Mark as Closed/Open")
                {
                    Caption = 'Mark as Closed/Open';
                    Image = ReopenCancelled;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if rec.Closed then begin
                            if not Confirm('Are you sure you want to Re-Open this Document', false)then exit;
                            rec.Closed:=false;
                            rec.Modify;
                            Message('Employee Requisition %1 has been Re-Opened', rec."Requisition No.");
                        end
                        else
                        begin
                            if not Confirm('Are you sure you want to close this Document', false)then exit;
                            rec.Closed:=true;
                            rec.Modify;
                            Message('Employee Requisition %1 has been marked as Closed', rec."Requisition No.");
                        end;
                    end;
                }
                action("&Print")
                {
                    Caption = '&Print';
                    Image = PrintReport;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    //RunObject = Report "IBS Notes 2";
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmpReq.Reset;
                        HREmpReq.SetRange(HREmpReq."Requisition No.", rec."Requisition No.");
                        if HREmpReq.Find('-')then REPORT.Run(39003918, true, true, HREmpReq);
                    end;
                }
                action("Re-Open")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.Status:=rec.Status::New;
                        rec.Modify;
                    end;
                }
            }
            action("Applicant to Employee")
            {
                Caption = 'Applicant to Employee';
                Image = "Report";
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report Report39005600;
                Visible = false;
            }
            action("Employee Requisitions")
            {
                Caption = 'Employee Requisitions';
                Image = "Report";
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "IBS Notes 2";
                Visible = false;
            }
        }
    }
    var Email: List of[Text];
    HREmp: Record "HR Employees";
    HREmailParameters: Record "HR E-Mail Parameters";
    //SMTP: Codeunit "SMTP Mail";
    DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal;
    ApprovalEntries: Page "Approval Entries";
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    HREmpReq: Record "HR Employee Requisitions";
    EmpName: Text[100];
    [Scope('Cloud')]
    procedure TESTFIELDS()
    begin
        rec.TestField("Job ID");
        rec.TestField("Closing Date");
        rec.TestField("Type of Contract Required");
        rec.TestField("Recruitment Type");
        rec.TestField("Required Positions");
        if rec."Reason For Request" = rec."Reason For Request"::Other then rec.TestField("Reason for Request(Other)");
    end;
}
