page 54672 "HR Employee Requisitions Self"
{
    CardPageID = "HR Emp Requisition Self";
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Employee Requisitions Self';
    PromotedActionCategories = 'New,Process,Reports,Job,Functions,Employee';
    ShowFilter = true;
    SourceTable = "HR Employee Requisitions";

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
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    StyleExpr = TRUE;
                    ApplicationArea = all;
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
                    ApplicationArea = all;
                    Editable = false;
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
                    ApplicationArea = All;
                    Image = JobListSetup;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Job Requirement Lines";
                    RunPageLink = "Job Id"=FIELD("Job ID");
                }
                action(Responsibilities)
                {
                    Caption = 'Responsibilities';
                    ApplicationArea = All;
                    Image = JobResponsibility;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID"=FIELD("Job ID");
                }
            }
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';

                action("&Approvals")
                {
                    Caption = '&Approvals';
                    ApplicationArea = All;
                    Image = Approvals;
                    Promoted = true;
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
                    ApplicationArea = All;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    begin
                        if Confirm('Send this Requisition for Approval?', true) = false then exit;
                        TESTFIELDS;
                    /// if ApprovalMgt.CheckEmpRequisitionApprovalPossible(Rec) then 
 
///   ApprovalMgt.OnSendEmpRequisitionForApproval(Rec);RBS DENNIS 
 end;
                }
                action("&Cancel Approval Request")
                {
                    Caption = '&Cancel Approval Request';
                    ApplicationArea = All;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                    /// ApprovalMgt.OnCancelEmpRequisitionForApproval(Rec); 
 
///WorkflowWebhookMgt.FindAndCancel(RecordId); RBS DENNIS 
 end;
                }
                action("Mark as Closed/Open")
                {
                    Caption = 'Mark as Closed/Open';
                    ApplicationArea = All;
                    Image = ReopenCancelled;
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
                    ApplicationArea = All;
                    Image = PrintReport;
                    Promoted = true;
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
                    ApplicationArea = All;
                    Image = ReOpen;
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
                ApplicationArea = All;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report Report39005600;
                Visible = false;
            }
            action("Employee Requisitions")
            {
                Caption = 'Employee Requisitions';
                ApplicationArea = All;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "IBS Notes 2";
                Visible = false;
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.FilterGroup(2);
        rec.SetFilter(Requestor, UserId);
        rec.FilterGroup(0);
    end;
    var HREmp: Record "HR Employees";
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
