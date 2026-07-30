page 54417 "HR Confirmation Header"
{
    Caption = 'HR Confirmation Header';
    DeleteAllowed = true;
    PageType = Card;
    SourceTable = "HR Employee Confirmation";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; rec."Application No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Employee No."; rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Date of Employment"; rec."Date of Employment")
                {
                    ApplicationArea = all;
                }
                field(Department; rec.Department)
                {
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Second Line Supervisor"; rec."Second Line Supervisor")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Level; rec.Level)
                {
                    ApplicationArea = all;
                }
                field("Appraisal Type"; rec."Appraisal Type")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Date of Review"; rec."Date of Review")
                {
                    ApplicationArea = all;
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = all;
                }
                field(Score; rec.Score)
                {
                    ApplicationArea = all;
                }
                field("KPI Score"; rec."KPI Score")
                {
                    ApplicationArea = all;
                }
                field("User ID"; rec."User ID")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Second Line Supervisor Comment"; rec."Second Line Supervisor Comment")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Development Areas"; rec."Development Areas")
                {
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("Training Ideas"; rec."Training Ideas")
                {
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("Employee Comment"; rec."Employee Comment")
                {
                    ApplicationArea = all;
                    MultiLine = true;

                    trigger OnControlAddIn(Index: Integer; Data: Text)
                    var
                        TotalWeight: Decimal;
                        ConfirmationKPI: Record "HR Confirmation KPI";
                    begin
                    end;
                }
            }
            part("HR Confirmation Line"; "HR Confirmation Lines")
            {
                SubPageLink = "Application No."=FIELD("Application No.");
                ApplicationArea = All;
            }
            part(Financial;54681)
            {
                ApplicationArea = All;
                Caption = 'Financial';
                SubPageLink = "Document No."=FIELD("Application No."), "Employee No."=FIELD("Employee No.");
                SubPageView = WHERE("Behavioural Group"=CONST('FINANCIAL'));
            }
            part(Customer;54682)
            {
                ApplicationArea = All;
                Caption = 'Customer';
                SubPageLink = "Document No."=FIELD("Application No."), "Employee No."=FIELD("Employee No.");
                SubPageView = WHERE("Behavioural Group"=CONST('CUSTOMER'));
            }
            part("Internal Process";54683)
            {
                ApplicationArea = All;
                Caption = 'Internal Process';
                SubPageLink = "Document No."=FIELD("Application No."), "Employee No."=FIELD("Employee No.");
                SubPageView = WHERE("Behavioural Group"=CONST('INTERNAL PROCESS'));
            }
            part("Learning & Growth";54684)
            {
                ApplicationArea = All;
                Caption = 'Learning & Growth';
                SubPageLink = "Document No."=FIELD("Application No."), "Employee No."=FIELD("Employee No.");
                SubPageView = WHERE("Behavioural Group"=CONST('LEARNING GROWTH'));
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Send to HR")
            {
                Image = SendElectronicDocument;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    CompInfo: Record "Company Information";
                begin
                    rec.TESTFIELD(Status, rec.Status::Approved);
                    IF rec."Send to Hr" THEN EXIT
                    ELSE IF CONFIRM('Form will be forwarded to HR,click ok to continue', FALSE)THEN BEGIN
                            HrEmp.GET(rec."Employee No.");
                            IF HrEmp."Company E-Mail" <> '' THEN BEGIN
                            //CLEAR(SMTP);
                            //EmailAdd.Add('it@optivacp.com');
                            //SMTP.CreateMessage('Optiva CP', HrEmp."Company E-Mail", EmailAdd,
                            //FORMAT("Appraisal Type") + ' ' + 'Notification', '', TRUE);
                            //SMTP.AppendBody('Dear HR Team,' + '<BR><BR>');
                            //SMTP.AppendBody("Employee Name" + ' ' + 'has just completed his/her ' + ' ' + FORMAT("Appraisal Type") + 'form.' + '<BR><BR>');
                            //SMTP.AppendBody('<BR>');
                            //SMTP.AppendBody('Regards,<BR>');
                            //SMTP.AppendBody('HR <BR>');
                            //SMTP.Send;
                            END;
                            //MESSAGE('Beneficiaries have been notified');
                            IF rec."Appraisal Type" = rec."Appraisal Type"::Probation THEN BEGIN
                                HrEmp.GET(rec."Employee No.");
                                HrEmp."Probation Form Filled":=TRUE;
                                HrEmp.MODIFY;
                            END
                            ELSE IF rec."Appraisal Type" = rec."Appraisal Type"::Confirmation THEN BEGIN
                                    HrEmp.GET(rec."Employee No.");
                                    HrEmp."Confirmation Form Filled":=TRUE;
                                    HrEmp.MODIFY;
                                END;
                            rec."Send to Hr":=TRUE;
                            rec.MODIFY;
                            MESSAGE('Document has been transferred to HR');
                        END;
                end;
            }
            action("Probation Report")
            {
                Caption = 'Probation Report';
                Image = Report;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = ProbVisi;

                trigger OnAction()
                begin
                    rec.RESET;
                    rec.SETFILTER("Application No.", rec."Application No.");
                    REPORT.RUN(39006006, TRUE, TRUE, Rec);
                    rec.RESET;
                end;
            }
            action("Confirmation Report")
            {
                Caption = 'Confirmation Report';
                Image = "Report";
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = ConfirmVis;

                trigger OnAction()
                begin
                    rec.RESET;
                    rec.SETFILTER("Application No.", rec."Application No.");
                    REPORT.RUN(39006007, TRUE, TRUE, Rec);
                    rec.RESET;
                end;
            }
            action("Send To Supervisor1")
            {
                Caption = 'Send To Supervisor';
                Image = SendTo;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Category4;
                Visible = false;

                trigger OnAction()
                begin
                    IF CONFIRM('Do you want to send this Appraisal Form to  your Supervisor?', FALSE) = TRUE THEN BEGIN
                        rec.Status:=rec.Status::"Pending Approval";
                        rec.MODIFY;
                        MESSAGE('%1', 'Process Completed')END;
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocType:=DocType::Confirmation;
                    ApprovalEntries.SetRecordfilters(DATABASE::"HR Employee Confirmation", DocType, rec."Application No.");
                    ApprovalEntries.RUN;
                end;
            }
            action("Send To Supervisor")
            {
                Caption = 'Send To Supervisor';
                Image = SendTo;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                //IF ApprovalMgt.SendConfirmationApprovalReq(Rec) THEN; Lateef
                end;
            }
            action("Cancel Approval Re&quest")
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                // IF ApprovalMgt.CancelConfirmationRequest(Rec,TRUE,TRUE) THEN; Lateef
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        IF rec."Send to Hr" THEN BEGIN
            CurrPage.EDITABLE:=FALSE;
        //CurrPage.UPDATE;
        END;
        IF rec.Status = rec.Status::Approved THEN BEGIN
            CurrPage.EDITABLE:=FALSE;
        END;
        IF rec."Appraisal Type" = rec."Appraisal Type"::Probation THEN BEGIN
            ConfirmVis:=FALSE;
            ProbVisi:=TRUE;
        END
        ELSE
        BEGIN
            ConfirmVis:=TRUE;
            ProbVisi:=FALSE;
        END;
    end;
    trigger OnInit()
    var
        TotalWeight: Decimal;
    begin
    end;
    trigger OnOpenPage()
    begin
        IF rec."Send to Hr" THEN BEGIN
            CurrPage.EDITABLE:=FALSE;
            CurrPage.UPDATE;
        END;
        IF rec."Appraisal Type" = rec."Appraisal Type"::Probation THEN BEGIN
            ConfirmVis:=FALSE;
            ProbVisi:=TRUE;
        END
        ELSE
        BEGIN
            ConfirmVis:=TRUE;
            ProbVisi:=FALSE;
        END;
    end;
    var EmailAdd: List of[Text];
    HrEmp: Record "HR Employees";
    //SMTP: Codeunit "SMTP Mail";
    //SMTP:= SMTP.New;
    ConfirmVis: Boolean;
    ProbVisi: Boolean;
    DocType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", JV, "Payment Voucher", "Petty Cash", Requisition, InterBank, "Staff Claim", "Staff Advance", AdvanceSurrender, Capex, IJ, "Hr Job", "Emp Loan", "Leave Application", "Employee Requisition", "Interview Evaluation", "Training Requisition", Appraisal, HMO, Canteen, EmpTransaction, LeaveAck, PFAMod, PFATransfer, Confirmation;
}
