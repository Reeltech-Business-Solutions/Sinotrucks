page 54459 "HR Jobs Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Job,Request Approval';
    SourceTable = "HR Jobs";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = FieldEditable;

                field("Job ID"; Rec."Job ID")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Position Reporting to"; Rec."Position Reporting to")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field(Grade; rec.Grade)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Job Level"; Rec."Job Level")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Main Objective"; Rec."Main Objective")
                {
                    ApplicationArea = all;
                }
                field("Supervisor/Manager"; Rec."Supervisor/Manager")
                {
                    ApplicationArea = all;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = all;
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Occupied Positions"; Rec."Occupied Positions")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Vacant Positions"; Rec."Vacant Positions")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Caption = 'Responsibility Center';
                }
                field("Employee Requisitions"; Rec."Employee Requisitions")
                {
                    ApplicationArea = all;
                }
                field("Key Position"; Rec."Key Position")
                {
                    ApplicationArea = all;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Editable = true;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }

            }
            part("List Of Interviewers"; "HR Job Interview Areas")
            {
                Caption = 'List Of Interviewers';
                SubPageLink = Job = FIELD("Job ID");
                Visible = false;
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID" = FIELD("Job ID");
                ApplicationArea = All;
            }
            systempart(Control1102755006; Outlook)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Job)
            {
                action("Raise Requisition")
                {
                    Caption = 'Raise Requisition';
                    Image = Job;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Employee Requisition Card";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action("Job Requirements")
                {
                    Caption = 'Job Requirements';
                    Image = Card;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Requirement Lines";
                    RunPageLink = "Job Id" = FIELD("Job ID");
                }
                separator(Action1000000009)
                {
                }

                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        ApprovalEntries: Page 658;
                        ApprovalDocType: enum "Approval Document Type";
                    begin
                        DocType := DocType::"HR Jobs Card";
                        ApprovalEntries.SetRecordFilters(Database::"HR Jobs", ApprovalDoctype::Job, rec."Job ID");
                        ApprovalEntries.Run;
                    end;
                }

                action("Job Responsibilities")
                {
                    Caption = 'Job Responsibilities';
                    Image = JobResponsibility;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Responsiblities Lines";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action("Job Working Relationship")
                {
                    Caption = 'Job Working Relationship';
                    Image = Relationship;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Working Relationship";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
                action("Job KPI")
                {
                    Image = JobTimeSheet;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Job KPI's";
                    RunPageLink = "Assign To" = FIELD("Job ID");
                }
                action(Occupants)
                {
                    Caption = 'Occupants';
                    Image = ContactPerson;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category5;
                    RunObject = Page "HR Job Occupants";
                    RunPageLink = "Job ID" = FIELD("Job ID");
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';

                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Send A&pproval Request';
                    //Enabled = NOT OpenApprovalEntriesExist AND CanRequestApprovalForFlow;
                    Enabled = isOpen;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    ToolTip = 'Request approval of the document.';

                    trigger OnAction()
                    var
                        ApprovalMgmt: Codeunit "Approvals Mgmt.";

                    begin
                        rec.TestField(rec.Status, rec.Status::New);
                        if Confirm('Send for Approval?', true) = false then exit;
                        if ApprovalsMgmt.CheckJobsApprovalsWorkflowEnable(Rec) then
                            ApprovalsMgmt.OnSendJobsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Cancel Approval Re&quest';

                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ToolTip = 'Cancel the approval request.';
                    Enabled = not isOpen;

                    trigger OnAction()
                    var

                        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
                    begin
                        if Confirm('Do you want to cancel this approval?', true) = false then exit;
                        ApprovalsMgmt.OnCancelJobForApproval(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';

                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        rec.Validate(rec."Vacant Positions");
        OnAfterGetCurrRecord;
        if rec.Status = rec.Status::New then
            isOpen := true
        else begin
            isOpen := false;
            currPage.update();
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Created By" := rec."Created By";
    end;

    trigger OnOpenPage()
    begin
        if rec.Status = rec.Status::New then FieldEditable := true;

    end;

    var
        HREmployees: Record "HR Employees";
        AppMgmt: Codeunit "Approvals Mgmt.";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,WorkOrder,Job,Trip,Fuel,Diversion,HSSEQ,VehicleRelease,DriverAllowance,TruckVerification,BatteryJV,Towing,Interchange,TyreReplacement,LCAdvance,APRAF,FuelRecon,"Job Approval","Employee Requisition","Interview Evaluation","Training Requisition","Leave Application",Appraisal;
        ApprovalEntries: Page "Approval Entries";
        FieldEditable: Boolean;
        UserSetup: Record "User Setup";
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",JV,"Payment Voucher","Petty Cash",Requisition,InterBank,"Staff Claim","Staff Advance",AdvanceSurrender,Capex,IJ,"Hr Job","Emp Loan","Leave Application","Employee Requisition","Interview Evaluation","Training Requisition",Appraisal,HMO,"HR Jobs Card";
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        ShowWorkflowStatus: Boolean;
        CanCancelApprovalForRecord: Boolean;
        DocumentIsPosted: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowShippingOptionsWithLocation: Boolean;
        IsSaaS: Boolean;

        isOpen: Boolean;

        ApprovalsMgmt: Codeunit "Job Approval Mgt. Ext";

    [Scope('Cloud')]
    procedure UpdateControls()
    begin
        if rec.Status <> rec.Status::New then begin
            FieldEditable := false;
            //CurrPage.UpdateControls();
        end
        else begin
            FieldEditable := true;
            //CurrPage.UpdateControls();
        end;
        /*
            IF Status=Status::"Pending Approval" THEN BEGIN
             FieldEditable :=TRUE;
             //CurrPage.UpdateControls();
            END ELSE BEGIN
             FieldEditable :=FALSE;
             //CurrPage.UpdateControls();
            END
            */
    end;

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
        UpdateControls();
    end;
}
