
// page 50354 prAssignEmployeeLoanNEw
// {
//     //    

//     Editable = true;
//     PageType = Card;
//     SourceTable = "prAssignEmployeeLoan.";

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {
//                 field("Code"; Rec.Code)
//                 {
//                     Editable = false;
//                 }
//                 field("Assigned User ID"; Rec."Assigned User ID")
//                 {
//                 }
//                 field("Employee Code"; Rec."Employee Code")
//                 {
//                 }
//                 field("Customer No."; Rec."Customer No.")
//                 {
//                 }
//                 field("Employee Name"; Rec."Employee Name")
//                 {
//                 }
//                 field("Transaction Code"; Rec."Transaction Code")
//                 {
//                 }
//                 field("Transaction Name"; Rec."Transaction Name")
//                 {
//                 }
//                 field("Start Date"; Rec."Start Date")
//                 {
//                 }
//                 field("Payroll Period"; Rec."Payroll Period")
//                 {
//                 }
//                 field("Period Year"; Rec."Period Year")
//                 {
//                 }
//                 field("Period Month"; Rec."Period Month")
//                 {
//                 }
//                 field(Balance; Rec.Balance)
//                 {
//                     Caption = 'Loan Amount';
//                 }
//                 field("#of Repayments"; Rec."#of Repayments")
//                 {
//                 }
//                 field(Amount; Rec.Amount)
//                 {
//                     Caption = 'Monthly Deduction';
//                 }
//                 field("Remaining Amount"; Rec."Remaining Amount")
//                 {
//                     Style = AttentionAccent;
//                     StyleExpr = TRUE;
//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                 }
//                 field("Stop for Next Period"; Rec."Stop for Next Period")
//                 {
//                 }
//                 field("Amortized Loan Total Repay Amt"; Rec."Amortized Loan Total Repay Amt")
//                 {
//                     Editable = false;
//                 }
//                 field(Suspended; Rec.Suspended)
//                 {
//                     Visible = false;
//                 }
//                 field(Status; Rec.Status)
//                 {
//                 }
//                 field("Responsibility Center"; Rec."Responsibility Center")
//                 {
//                 }

//                 group(Guarantor)
//                 {
//                     Caption = 'Guarantor';
//                     field("Guarantor1 Code"; Rec."Guarantor1 Code")
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Guarantor1 Code';
//                     }
//                     field("Guarantor1 Name"; Rec."Guarantor1 Name")
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Guarantor1 Name';
//                     }
//                     field("Gurantor2 Code"; Rec."Guarantor2 Code")
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Guarantor2 Code';
//                     }
//                     field("Guarantor2 Name"; Rec."Guarantor2 Name")
//                     {
//                         ApplicationArea = All;
//                         Caption = 'Guarantor2 Name';
//                     }
//                 }

//             }
//             group(POSTING)
//             {
//                 Visible = false;
//                 field("Journal Batch"; Rec."Journal Batch")
//                 {
//                 }
//                 field("Accounts Type"; Rec."Accounts Type")
//                 {
//                 }
//                 field("Loan Posting Date"; Rec."Loan Posting Date")
//                 {
//                 }
//                 field("Vocher No. For the Loan"; Rec."Vocher No. For the Loan")
//                 {
//                 }
//                 field("Counter Acc. Type"; Rec."Counter Acc. Type")
//                 {
//                 }
//                 field("Counter Acc. No."; Rec."Counter Acc. No.")
//                 {
//                 }
//             }
//             // group(STATUS)
//             // {
//             //     field("Repayment Interval"; Rec."Repayment Interval")
//             //     {
//             //     }
//             //     field("Loan Paid Up"; Rec."Loan Paid Up")
//             //     {
//             //         Visible = false;
//             //     }
//             //     field("Next Repayment Period"; Rec."Next Repayment Period")
//             //     {
//             //         Visible = false;
//             //     }
//             //     field("Open (Y/N)"; Rec."Open (Y/N)")
//             //     {
//             //     }
//             //     field("Suspended (Y/N)"; Rec."Suspended (Y/N)")
//             //     {
//             //     }
//             //     field("Cummulative Deduction"; Rec."Cummulative Deduction")
//             //     {
//             //     }
//             //     field("Cumulative Remaining Balance"; Rec."Cumulative Remaining Balance")
//             //     {
//             //     }
//             // }
//         }
//     }

//     actions
//     {
//         area(processing)

//         {
//             action("Process Loan")
//             {
//                 Caption = 'Process Loan';
//                 Image = Post;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 visible = false;
//                 trigger OnAction()
//                 begin
//                     if Rec.Status = Rec.Status::Active then Error('The Loan has already been processed');

//                     objPeriod.Reset;
//                     objPeriod.SetRange(objPeriod.Closed, false);
//                     if objPeriod.Find('-') then begin
//                         if Rec."Payroll Period" = objPeriod."Date Opened" then begin
//                             PrEmpTrans.Init;
//                             PrEmpTrans.TransferFields(Rec);
//                             if PrEmpTrans.Insert then
//                                 Rec.Status := Rec.Status::Active;
//                             Rec.Modify;
//                             Message('Loan %1 successfully processed for employee %2', Rec."Transaction Code", Rec.Code);
//                         end
//                         else begin
//                             Rec.Status := Rec.Status::Active;
//                             Rec.Modify;//the transfer will be transferred to the right period when the specified period is opened using close period functionality
//                             Message('Loan %1 successfully processed for employee %2', Rec."Transaction Code", Rec.Code);
//                         end
//                     end
//                     else begin
//                         Rec.Status := Rec.Status::Active;
//                         Rec.Modify;//the transfer will be transferred to the right period when the specified period is opened using close period functionality
//                         Message('Loan %1 successfully processed for employee %2', Rec."Transaction Code", Rec.Code);
//                     end
//                 end;
//             }
//             action("<Action1102755002>")
//             {
//                 Caption = 'Post to JV';
//             }
//             action("Create Loan Payment")
//             {
//                 Caption = 'Create Loan Payment';
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;
//                 Visible = False;

//                 trigger OnAction()
//                 begin
//                     /*
//                       PVHeadEr.RESET;
//                       PVHeadEr.SETRANGE(PVHeadEr."External Doc No",Code); //"No."
//                       PVHeadEr.SETFILTER(Status,'<>%1',Status::Cancelled);
//                       IF PVHeadEr.FIND('-')=TRUE THEN
//                       ERROR('Payment Voucher has already been created for Staff Loan, the payment voucher no is %1',PVHeadEr."No.");

//                       TESTFIELD(Status,Status::Approved);
//                       TESTFIELD("Pay Mode");
//                       TESTFIELD("Paying Bank Account");

//                       IF NOT CONFIRM('Are you sure you want to create a Payment Voucher for %1',FALSE,"No.") THEN
//                          ERROR('Creation of Payment Voucher Stopped') ELSE
//                          BEGIN

//                       PVHeadEr.INIT;
//                       PVHeadEr.Date:=Date;
//                       PVHeadEr.Payee:=Payee;
//                       PVHeadEr."On Behalf Of":="On Behalf Of";
//                       PVHeadEr.Cashier:=Cashier;
//                       PVHeadEr.Status:=Status;
//                       IF "Pay Mode"="Pay Mode"::Cash THEN
//                       PVHeadEr."Payment Type":=PVHeadEr."Payment Type"::"Petty Cash"
//                       ELSE IF "Pay Mode"="Pay Mode"::Cheque THEN
//                       PVHeadEr."Payment Type":=PVHeadEr."Payment Type"::Normal;
//                       PVHeadEr."Pay Mode":="Pay Mode";
//                       PVHeadEr."Paying Bank Account":="Paying Bank Account";
//                       PVHeadEr.VALIDATE("Paying Bank Account");
//                       PVHeadEr."Cheque No.":="Cheque No.";
//                       PVHeadEr."Global Dimension 1 Code":="Global Dimension 1 Code";
//                       PVHeadEr.VALIDATE("Global Dimension 1 Code");
//                       PVHeadEr."Shortcut Dimension 2 Code":="Shortcut Dimension 2 Code";
//                       PVHeadEr.VALIDATE("Shortcut Dimension 2 Code");
//                       PVHeadEr."Responsibility Center":="Responsibility Center";
//                       PVHeadEr."Payment Release Date":="Payment Release Date";
//                       PVHeadEr."Shortcut Dimension 3 Code":="Shortcut Dimension 3 Code";
//                       PVHeadEr.VALIDATE("Shortcut Dimension 3 Code");
//                       PVHeadEr."Shortcut Dimension 4 Code":="Shortcut Dimension 4 Code";
//                       PVHeadEr.VALIDATE("Shortcut Dimension 4 Code");
//                       PVHeadEr."Payment Narration":=Purpose;
//                       PVHeadEr."External Doc No":="No.";
//                       PVHeadEr.INSERT(TRUE);

//                       STClaimLines.RESET;
//                       STClaimLines.SETRANGE(STClaimLines.No,"No.");
//                       IF STClaimLines.FIND('-') THEN BEGIN


//                       {
//                       PaymentLines.RESET;
//                       IF PaymentLines.FIND('+') THEN BEGIN
//                       EntryNo:=PaymentLines."Line No.";
//                       END;
//                       }


//                       EntryNo:=1;

//                       REPEAT

//                       PaymentLines.INIT;
//                       PaymentLines."Line No.":= 0;
//                       //MESSAGE('%1',EntryNo);
//                       PaymentLines.No:=PVHeadEr."No.";
//                       //PaymentLines."Account Type":=PaymentLines."Account Type"::Customer;
//                       PaymentLines."Account Type" := STClaimLines."Account type";
//                       PaymentLines."Account No.":=STClaimLines."Account No:";
//                       PaymentLines."Account Name":=STClaimLines."Account Name";       //Payee;
//                       PaymentLines.Type:=STClaimLines."Advance Type";
//                       PaymentLines.Amount:=STClaimLines.Amount;
//                       PaymentLines.VALIDATE(Amount);
//                       PaymentLines."Net Amount":=STClaimLines.Amount;
//                       PaymentLines."Global Dimension 1 Code":=STClaimLines."Global Dimension 1 Code";
//                       PaymentLines.VALIDATE("Global Dimension 1 Code");
//                       PaymentLines."Shortcut Dimension 2 Code":=STClaimLines."Shortcut Dimension 2 Code";
//                       PaymentLines.VALIDATE("Shortcut Dimension 2 Code");
//                       PaymentLines."Shortcut Dimension 3 Code":=STClaimLines."Shortcut Dimension 3 Code";
//                       PaymentLines.VALIDATE("Shortcut Dimension 3 Code");
//                       PaymentLines."Shortcut Dimension 4 Code":=STClaimLines."Shortcut Dimension 4 Code";
//                       PaymentLines.VALIDATE("Shortcut Dimension 4 Code");
//                       PaymentLines.INSERT(TRUE);

//                       UNTIL STClaimLines.NEXT=0;
//                       END;
//                     */

//                 end;
//             }
//             separator(Action36)
//             {
//             }
//             action(Approvals)
//             {
//                 Caption = 'Approvals';
//                 Image = Approvals;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 // PromotedIsBig = true;
//                 RunObject = page "Custom Approval Entries";
//                 RunPageLink = "Document No." = field(Code);

//                 trigger OnAction()
//                 var
//                     ApprovalEntries: Page "Approval Entries";
//                 begin

//                     //  ApprovalEntries.Setfilters(DATABASE::"prAssignEmployeeLoan.", 6, Code);
//                     //  ApprovalEntries.Run;

//                 end;
//             }
//             action("Send A&pproval Request")
//             {
//                 Caption = 'Send A&pproval Request';
//                 Image = SendApprovalRequest;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 //  PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     ApprovalMgt: Codeunit "Approval Mgmt. ExtCal stLoan";
//                 begin
//                     if ApprovalMgt.CheckEmployeeLoanWorkflowEnabled(Rec) then
//                         ApprovalMgt.OnSendEmployeeLoanForApproval(Rec); //Fola06192023
//                 end;
//             }
//             action("Cancel Approval Re&quest")
//             {
//                 Caption = 'Cancel Approval Re&quest';
//                 Image = Cancel;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 // PromotedIsBig = true;

//                 trigger OnAction()
//                 var
//                     ApprovalMgt: Codeunit "Approval Mgmt. ExtCal stLoan";
//                 begin
//                     ApprovalMgt.OnCancelEmployeeLoanForApproval(Rec); //Fola06192023
//                 end;
//             }
//         }
//     }

//     trigger OnInit()
//     begin
//         /*
//         objPeriod.RESET;
//         objPeriod.SETRANGE(objPeriod.Closed,FALSE);
//         IF objPeriod.FIND('-') THEN
//         BEGIN
//             SelectedPeriod:=objPeriod."Date Opened";
//             PeriodName:=objPeriod."Period Name";
//             PeriodMonth:=objPeriod."Period Month";
//             PeriodYear:=objPeriod."Period Year";
//             //objEmpTrans.RESET;
//             //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
//         END;
//         */
//         //Filter per period  - Dennis
//         //SETFILTER("Payroll Period",FORMAT(objPeriod."Date Opened"));

//     end;

//     var
//         objTransCodes: Record "prTransaction Codes";
//         SelectedPeriod: Date;
//         objPeriod: Record "prPayroll Periods";
//         PeriodName: Text[30];
//         PeriodTrans: Record "prPeriod Transactions";
//         PeriodMonth: Integer;
//         PeriodYear: Integer;
//         blnIsLoan: Boolean;
//         objEmpTrans: Record "prEmployee Transactions";
//         transType: Text[30];
//         objOcx: Codeunit prPayrollProcessing;
//         strExtractedFrml: Text[30];
//         curTransAmount: Decimal;
//         empCode: Text[30];
//         Employee: Record "HR-Employee Payroll";
//         EmpTrans: Record "prEmployee Transactions";
//         VitalSetUp: Record "prVital Setup Info (RELIEF)";
//         SalaryCard: Record "prSalary Card";
//         TotalEarnings: Decimal;
//         ArreasAmount: Decimal;
//         ArrearsDays: Integer;
//         NoOfMonthDays: Integer;
//         i: Integer;
//         RemainingDays: Integer;
//         TDate: Date;
//         PRTransactions: Record "prTransaction Codes";
//         PrEmpTrans: Record "prEmployee Transactions";
//         SHeader: Record "Sales Header";
//         SalesLine: Record "Sales Line";



//     // ApprovalMgt: Codeunit "Approvals Mgmt.";


//     procedure ProcessLoan()
//     begin
//     end;
// }

