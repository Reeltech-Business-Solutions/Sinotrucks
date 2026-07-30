page 54580 "Hr Trasnsport Requisition Card"
{
    SourceTable = "HR Transport Requisition";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Application Code"; Rec."Application Code")
                {
                    Caption = 'Application No';
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Caption = 'Applicant No.';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(EmpName; EmpName)
                {
                    Caption = 'Applicant Name';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Job Tittle"; Rec."Job Title")
                {
                    ApplicationArea = all;
                    Caption = 'Job Title';
                    Editable = false;
                }
                field(EmpJobDesc; EmpJobDesc)
                {
                    Caption = 'Job Description';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(EmpDept; EmpDept)
                {
                    Caption = 'Department';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    Caption = 'No of Days';
                    ApplicationArea = all;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = all;
                }
                field("From Destination"; Rec."From Destination")
                {
                    ApplicationArea = all;
                }
                field("To Destination"; Rec."To Destination")
                {
                    ApplicationArea = all;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(SupervisorName; SupervisorName)
                {
                    Caption = 'Supervisor Name';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    Caption = 'Supervisor Email';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    var HREmp: Record "HR Employees";
    EmpJobDesc: Text[30];
    HRJobs: Record "HR Jobs";
    SupervisorName: Text[30];
    //SMTP: Codeunit "SMTP Mail";
    URL: Text[500];
    dAlloc: Decimal;
    dEarnd: Decimal;
    dTaken: Decimal;
    dLeft: Decimal;
    cReimbsd: Decimal;
    cPerDay: Decimal;
    cbf: Decimal;
    HRSetup: Record "HR Setup";
    EmpDept: Text[30];
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    HRLeaveApp: Record "HR Transport Requisition";
    DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, "Budget Transfer", "Employee Requisition", "Leave Application", "Transport Requisition", "Training Requisition", "Job Approval";
    HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
    D: Date;
    EmpName: Text[70];
    DoclLink: Record "HR Leave Attachments";
}
