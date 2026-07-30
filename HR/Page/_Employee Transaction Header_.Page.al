page 54840 "Employee Transaction Header"
{
    PageType = Document;
    SourceTable = "HR Emp. Transaction Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                }
                field(Department; rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Salary step"; Rec."Salary step")
                {
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Current Period"; Rec."Current Period")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
            }
            part(Control9; "Employee Trans Line")
            {
                SubPageLink = "Document No."=FIELD("Document No.");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Action15)
            {
                action("Update Employee Transaction")
                {
                    Image = AddAction;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        rec.UpdateEmployeeTrans;
                    end;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';

                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", JV, "Payment Voucher", "Petty Cash", Requisition, InterBank, "Staff Claim", "Staff Advance", AdvanceSurrender, Capex, IJ, "Hr Job", "Emp Loan", "Leave Application", "Employee Requisition", "Interview Evaluation", "Training Requisition", Appraisal, HMO, Canteen, EmpTransaction;
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType:=DocumentType::EmpTransaction;
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Emp. Transaction Header", DocumentType, rec."Document No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Send Approval Request")
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Send this Job Title for Approval?', true) = false then exit;
                    //AppMgmt.SendEmpTransApprovalRequest(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelAllLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Cancel Approval Request?', true) = false then exit;
                    //AppMgmt.CancelEmpTransAppApprovalReq(Rec,TRUE,TRUE);
                    end;
                }
                action("Re-Open")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Created By":=UserId;
    end;
    trigger OnOpenPage()
    begin
        if rec.Status <> rec.Status::Open then begin
            CurrPage.Editable:=false;
            CurrPage.Update;
        end;
    end;
    var UserSetup: Record "User Setup";
    AppMgmt: Codeunit "Approvals Mgmt.";
}
