page 50253 "HR ApprovedLeaveList"
{
    ApplicationArea = All;
    Caption = 'HR Approved Leave List';
    PageType = List;
    SourceTable = "HR Leave Application";
    UsageCategory = Lists;
    CardPageID = "HR Approved Leave";
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;
    SourceTableView = WHERE(Status = FILTER(Approved | "Pending Approval"));

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;

                field("Application Code"; Rec."Application Code")
                {
                    Caption = 'Application No';
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field(Names; rec.Names)
                {
                    Caption = 'Employee Name';
                    ApplicationArea = all;
                }
                field(Pictures; Rec.Pictures)
                {
                    ApplicationArea = All;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = all;
                }
                field("Approved days"; Rec."Approved days")
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                }
                field("Company Email"; Rec."Company Email")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Reliever Name"; Rec."Relievers Name")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Leave Applicaitons Factbox")
            {
                SubPageLink = "No." = FIELD("Employee No");
                ApplicationArea = All;
            }
            systempart(Control1102755004; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';

                action(Comments)
                {
                    Caption = 'Comments';
                    Image = Comment;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        /*DocumentType:=DocumentType::"Leave Application";

                            ApprovalComments.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                            ApprovalComments.SetUpLine(DATABASE::"HR Leave Application",DocumentType,"Application Code");
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
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,WorkOrder,Job,Trip,Fuel,Diversion,HSSEQ,VehicleRelease,DriverAllowance,TruckVerification,BatteryJV,Towing,Interchange,TyreReplacement,LCAdvance,APRAF,FuelRecon,"Job Approval","Employee Requisition","Interview Evaluation","Training Requisition","Leave Application",Appraisal;
                    begin
                        DocumentType := DocumentType::"Leave Application";
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Leave Application", DocumentType, rec."Application Code");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Send Approval Request")
                {
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        TESTFIELDS;
                        if Confirm('Send this Application for Approval?', true) = false then exit;
                        rec.Selected := true;
                        rec."User ID" := UserId;
                        //ApprovalMgt.SendLeaveAppApprovalReq(Rec);
                    end;
                }
                action("&Cancel Approval Request")
                {
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //ApprovalMgt.CancelLeaveAppRequest(Rec,TRUE,TRUE);
                    end;
                }
                action("Re-Open")
                {
                    Caption = 'Re-Open';
                    ApplicationArea = all;
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.Status := rec.Status::New;
                        rec.Modify;
                    end;
                }
                action(Print)
                {
                    Caption = 'Print';
                    Image = PrintForm;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    // RunObject = Report "IBS Notes 3";
                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", rec."Application Code");
                        //  if HRLeaveApp.Find('-') then REPORT.Run(39003919, true, true, HRLeaveApp);

                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.CreateLeaveLedgerEntries;
                        rec.Reset;
                    end;
                }
                action("HR Leave Adjustments")
                {
                    Caption = 'HR Leave Adjustments';
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Leave Journal Lines";
                    Visible = false;
                }
            }
        }
        area(reporting)
        {
            action("Leave Application")
            {
                Caption = 'Leave Application';
                Image = "Report";
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Leave Application";
            }
            action("Leave Reimbursements")
            {
                Caption = 'Leave Reimbursements';
                ApplicationArea = all;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Leave Reimbursements";
                Visible = false;
            }
            action("Leave Applications List")
            {
                Caption = 'Leave Applications List';
                ApplicationArea = all;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Leave Applications List";
            }
            action("Leave Statement")
            {
                ApplicationArea = all;
                Caption = 'Leave Statement';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Fully Unprocessed Instruction";
            }
            action("Employees On Leave")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                RunObject = report "HR Application OnLeave";
            }
        }
    }

    trigger OnOpenPage()
    begin

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApprovalEntries: Page "Approval Entries";
        ApprovalComments: Page "Approval Comments";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application";
        HRLeaveApp: Record "HR Leave Application";

    [Scope('Cloud')]
    procedure TESTFIELDS()
    begin
        rec.TestField("Leave Type");
        rec.TestField("Days Applied");
        rec.TestField("Start Date");
        rec.TestField(Reliever);
        rec.TestField(Supervisor);
    end;
}
