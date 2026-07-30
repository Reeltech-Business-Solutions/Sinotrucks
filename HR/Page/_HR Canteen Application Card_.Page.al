page 54556 "HR Canteen Application Card"
{
    Caption = 'HR Meal Ticket';
    PageType = Card;
    SourceTable = "Hr Canteen Application";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Ticket No."; Rec."Ticket No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field("Department Name"; Rec."Department Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Visible = false;

                    trigger OnValidate()
                    begin
                        rec."Payroll Period":=CalcDate('<-CM>', rec."Start Date");
                        if objPeriod.Get(rec."Payroll Period")then if objPeriod.Closed = true then Error('The %1 period has already been closed', rec."Payroll Period");
                        rec.Validate("Payroll Period");
                    end;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = all;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = all;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = all;
                }
                field("Request Type"; Rec."Request Type")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Visitor Name"; Rec."Visitor Name")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Posted; rec.Posted)
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
            action("Send Approval Request")
            {
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if rec."Request Type" = rec."Request Type"::Visitor then rec.TestField("Visitor Name");
                    if Confirm('Send this Employee for Approval?', true) = false then exit;
                //ApprovalMgt.SendCanteenApprovalRequest(Rec);
                end;
            }
            action("Cancel Approval Request")
            {
                Caption = 'Cancel Approval Request';
                Image = CancelAllLines;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                //IF CONFIRM('Cancel Approval Request?',TRUE)=FALSE THEN EXIT;
                //ApprovalMgt.CancelCanteenAppApprovalReq(Rec,TRUE,TRUE);
                end;
            }
            action(Post)
            {
                Caption = 'Post';
                Image = Post;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                begin
                    if rec.Posted = true then exit;
                    /*
                   Usersetup.SETFILTER(Usersetup."User ID",USERID);
                   IF Usersetup.FIND('-') THEN
                    IF NOT Usersetup."Post Canteen Meal" = TRUE THEN
                    ERROR('Please you are not authorized to post');

                    Posted := TRUE ;
                     MODIFY ;
                      */
                    rec.TestField("Payroll Period");
                    rec.TestField(Status, rec.Status::Approved);
                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-')then begin
                        if rec."Payroll Period" = objPeriod."Date Opened" then begin
                            PrEmpTrans.Init;
                            //PrEmpTrans.TRANSFERFIELDS(Rec);
                            PrEmpTrans.Reset;
                            PrEmpTrans.Init;
                            PrEmpTrans."Employee Code":=rec."Employee No.";
                            PrEmpTrans."Transaction Code":=rec."Transaction Code";
                            PrEmpTrans."Transaction Name":=rec."Transaction Name";
                            PrEmpTrans.Amount:=rec.Amount;
                            PrEmpTrans."Payroll Period":=rec."Payroll Period";
                            PrEmpTrans."Period Month":=rec."Period Month";
                            PrEmpTrans."Period Year":=rec."Period Year";
                            PrEmpTrans."Start Date":=rec."Start Date";
                            if PrEmpTrans.Insert then rec.Posted:=true;
                            rec.Modify;
                            Message('Meal Ticket %1 successfully processed for employee %2', rec."Transaction Code", rec."Employee No.");
                        end
                        else
                        begin
                            rec.Posted:=true;
                            rec.Modify; //the transfer will be transferred to the right period when the specified period is opened using close period functionality
                            Message('Meal Ticket %1 successfully processed for employee %2', rec."Transaction Code", rec."Employee No.");
                        end end /*ELSE BEGIN
                      Posted:=TRUE;
                      MODIFY;//the transfer will be transferred to the right period when the specified period is opened using close period functionality
                      MESSAGE('Meal Ticket %1 successfully processed for employee %2',"Transaction Code","Employee No.");
                    END
                    */
                end;
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    DocType:=DocType::Canteen;
                    ApprovalEntries.Setrecordfilters(DATABASE::"Hr Canteen Application", DocType, rec."Ticket No.");
                    ApprovalEntries.Run;
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if rec.Posted then CurrPage.Editable:=false
        else
            CurrPage.Editable:=true;
    end;
    trigger OnOpenPage()
    begin
        if rec.Posted then CurrPage.Editable:=false
        else
            CurrPage.Editable:=true;
    end;
    var ApprovalMgt: Codeunit "Approvals Mgmt.";
    Usersetup: Record "User Setup";
    objTransCodes: Record "prTransaction Codes";
    objPeriod: Record "prPayroll Periods";
    PeriodTrans: Record "prPeriod Transactions";
    PeriodMonth: Integer;
    PeriodYear: Integer;
    objEmpTrans: Record "prEmployee Transactions";
    transType: Text[30];
    PRTransactions: Record "prTransaction Codes";
    PrEmpTrans: Record "prEmployee Transactions";
    DocType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", JV, "Payment Voucher", "Petty Cash", Requisition, InterBank, "Staff Claim", "Staff Advance", AdvanceSurrender, Capex, IJ, "Hr Job", "Emp Loan", "Leave Application", "Employee Requisition", "Interview Evaluation", "Training Requisition", Appraisal, HMO, Canteen, EmpTransaction, LeaveAck;
}
