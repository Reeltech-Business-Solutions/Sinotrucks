page 54627 "Salary List"
{
    CardPageID = "prHeader Salary Card";
    ApplicationArea = all;
    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Navigate,Category8_caption,Category9_caption,Category10_caption';
    AdditionalSearchTerms = 'Salary List';
    UsageCategory = Lists;
    SourceTable = "HR-Employee";
    SourceTableView = WHERE(Status = FILTER(Normal), "Payroll Type" = CONST(General));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field(Office; rec.Office)
                {
                    ApplicationArea = all;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = all;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = all;
                }
                field("Suspension Date"; Rec."Suspension Date")
                {
                    ApplicationArea = all;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;
                }
                field("Salary Notch/Step"; Rec."Salary Notch/Step")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(reporting)
        {
            action(Payslip)
            {
                Caption = 'Payslip';
                Image = "Report";
                RunObject = Report "prPaySlip2 Taxable Admin"; //RBS Dennis
                ApplicationArea = All;
            }
            action("Employee List")
            {
                Caption = 'Employee List';
                Image = "Report";
                ApplicationArea = All;
            }
            action("Negative Pay List")
            {
                Caption = 'Negative Pay List';
                Image = "Report";
                RunObject = Report "Negative Pay List";
                ApplicationArea = All;
            }
            action("Payroll Summary")
            {
                Caption = 'Payroll Summary';
                Image = "Report";
                RunObject = Report "Payroll Summary";
                ApplicationArea = All;
            }
            action("Basic Pay Listing")
            {
                Caption = 'Basic Pay Listing';
                Image = "Report";
                RunObject = Report "Basic Pay Listing";
                ApplicationArea = All;
            }
            action("Transactions - Summary")
            {
                Caption = 'Transactions - Summary';
                Image = "Report";
                RunObject = Report "Transactions Summary";
                ApplicationArea = All;
            }
            action("Transactions - Detailed")
            {
                Caption = 'Transactions - Detailed';
                Image = "Report";
                RunObject = Report "Transactions - Detailed";
                ApplicationArea = All;
            }
            action("Employee Earnings Summary")
            {
                Caption = 'Employee Earnings Summary';
                Image = "Report";
                ApplicationArea = All;
            }
            action("Employee Transaction History")
            {
                Caption = 'Employee Transaction History';
                Image = "Report";
                RunObject = Report "prLoan Payment History";
                ApplicationArea = All;
            }
            action("Staff Pension Contribution")
            {
                Caption = 'Staff Pension Contribution';
                Image = "Report";
                RunObject = Report "prStaff Pension Contrib";
                ApplicationArea = All;
            }
            action("Pension Advice Summary")
            {
                Caption = 'Pension Advice Summary';
                Image = "Report";
                RunObject = Report "Pension Advice Summary";
                ApplicationArea = All;
            }
            action("Gross & Net Pay Schedule")
            {
                Caption = 'Gross & Net Pay Schedule';
                Image = "Report";
                RunObject = Report "Gross & Net Pay Schedule";
                ApplicationArea = All;
            }
            action("NISTF Schedule")
            {
                Caption = 'NSITF Schedule';
                Image = "Report";
                RunObject = Report "NSITF Schedule";
                ApplicationArea = All;
            }
            action("NHF Schedule")
            {
                Caption = 'NHF Schedule';
                Image = "Report";
                // RunObject = Report "update store req";
                ApplicationArea = All;
            }
            action("PAYE Schedule")
            {
                Caption = 'PAYE Schedule';
                Image = "Report";
                RunObject = Report "prPaye Schedule";
                ApplicationArea = All;
            }
            action("Bank Payment Schedule")
            {
                Caption = 'Bank Payment Schedule';
                Image = "Report";
                RunObject = Report "Bank Payment Schedule";
                ApplicationArea = All;
            }
            action("Bank Payment Schedule - Transaction")
            {
                Caption = 'Bank Payment Schedule - Transaction';
                ApplicationArea = All;
                Image = "Report";
            }
            action("Bank Advise Summary")
            {
                Caption = 'Bank Advise Summary';
                Image = "Report";
                RunObject = Report "Bank Advise Summary";
                ApplicationArea = All;
            }
            action("Overtime Report")
            {
                Caption = 'Overtime Report';
                Image = "Report";
                ApplicationArea = All;
            }
            action(Loans)
            {
                Caption = 'Loans';
                Image = "Report";
                ///RunObject = Report "Loans Report"; 
                ApplicationArea = All;
            }
            action("Deductions to Organizations")
            {
                Caption = 'Deductions to Organizations';
                Image = "Report";
                ///RunObject = Report Report39005535; 
                ApplicationArea = All;
            }
            action("Other Deductions")
            {
                Caption = 'Other Deductions';
                Image = "Report";
                RunObject = Report "Other Deductions";
                ApplicationArea = All;
            }
            action("Staff Pension Balance")
            {
                Caption = 'Staff Pension Balance';
                Image = "Report";
                RunObject = Report "prStaff Pension Balance";
                ApplicationArea = All;
            }
            action("Generate Reconcilliation")
            {
                Caption = 'Generate Reconcilliation';
                ApplicationArea = All;
                Image = "Report";
                //RunObject = Report Report39005526;
            }
            action("Gross Reconcilliation")
            {
                Caption = 'Gross Reconcilliation';
                Image = "Report";
                ApplicationArea = All;
                //RunObject = Report "Store Requisition Report - ADM";
            }
            action("Reconciliations - By Transactions")
            {
                Caption = 'Reconciliations - By Transactions';
                Image = "Report";
                ApplicationArea = All;
            }
            action("Reconciliations - By Employee")
            {
                Caption = 'Reconciliations - By Employee';
                Image = "Report";
                ApplicationArea = All;
                RunObject = Report "Reconciliation - By Employee";
            }
            action("Reconciliations - By Entry/Exits")
            {
                Caption = 'Reconciliations - By Entry/Exits';
                ApplicationArea = All;
                Image = "Report";
                ///RunObject = Report "Reconciliations - By Entry/Exits"; 


            }
            action("Reconciliations - Summary")
            {
                Caption = 'Reconciliations - Summary';
                Image = "Report";
                ApplicationArea = All;
                ///RunObject = Report Report39005549; 


            }
            action("Reconciliations - Summary Changes")
            {
                Caption = 'Reconciliations - Summary Changes';
                ApplicationArea = All;
                Image = "Report";
                /// RunObject = Report Report39005551; 


            }
            action("Payroll Journal")
            {
                Caption = 'Payroll Journal';
                ApplicationArea = All;
                Image = "Report";
                ///RunObject = Report "Payroll Journal"; 


            }
            action(Action1000000031)
            {
                Caption = 'Overtime Report';
                Image = "Report";
                ApplicationArea = All;
            }
            action("Overtime Report - By Department")
            {
                Caption = 'Overtime Report - By Department';
                ApplicationArea = All;
            }
            action("Overtime Report - By Location Summary")
            {
                Caption = 'Overtime Report - By Location Summary';
                ApplicationArea = All;
            }
            action("Payroll Summary - SUG")
            {
                Caption = 'Payroll Summary - SUG';
                ApplicationArea = All;
            }
            action("Payroll Summary - AGRO")
            {
                Caption = 'Payroll Summary - AGRO';
                ApplicationArea = All;
            }
            action("Payroll Summary - By Location")
            {
                Caption = 'Payroll Summary - By Location';
                ApplicationArea = All;
            }
            action("Payroll Summary - By Location Summary")
            {
                Caption = 'Payroll Summary - By Location Summary';
                ApplicationArea = All;
            }
            action("Detailed Payroll Summary")
            {
                Caption = 'Detailed Payroll Summary';
                ApplicationArea = All;
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Daily Transaction Listing";
            }
        }
        area(navigation)
        {
            group("Other Info")
            {
                Caption = 'Other Info';
                Visible = false;

                action("Cost Centers")
                {
                    Caption = 'Cost Centers';
                    Image = Dimensions;
                    RunObject = Page "prStaff Dimensions";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                    ApplicationArea = All;
                }
                separator(Action1000000017)
                {
                }
                action("Banking Details")
                {
                    ApplicationArea = All;
                    Caption = 'Banking Details';
                    Image = BankAccount;
                    RunObject = Page "prEmployee Banks";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                }
                separator(Action1000000015)
                {
                }
                action("Pension Details")
                {
                    ApplicationArea = All;
                    Caption = 'Pension Details';
                    Image = PlanningWorksheet;
                    RunObject = Page "Pension Contribution Details";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
            }
            group(Transactions)
            {
                Caption = 'Transactions';

                action("Payroll Transactions")
                {
                    Caption = 'Payroll Transactions';
                    Image = Trace;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "prList Transactions";
                    RunPageLink = "Employee Code" = FIELD("No.");
                }
                separator(Action1000000011)
                {
                }
                action("View Trans Codes")
                {
                    Caption = 'View Trans Codes';
                    ApplicationArea = All;
                    Image = Track;
                    RunObject = Page "prList TransCode";
                    Visible = false;
                }
                separator(Action1000000009)
                {
                }
                action("Insurance Policies")
                {
                    Caption = 'Insurance Policies';
                    Image = Insurance;
                    ApplicationArea = All;
                    RunObject = Page "prInsurance Policies";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                }
                separator(Action1000000007)
                {
                }
                action("Staff Loans")
                {
                    Caption = 'Staff Loans';
                    ApplicationArea = All;
                    Image = Loaner;
                    RunObject = Page "prInsurance Policies";
                    Visible = false;
                }
                separator(Action1000000005)
                {
                }
                action("Basic Salary Arrears")
                {
                    Caption = 'Basic Salary Arrears';
                    ApplicationArea = All;
                    Image = CalculateRegenerativePlan;
                    ///  RunObject = Page "HR Deduction Account"; 

                    ///RunPageLink = Code = FIELD("No."); 

                    ///RunPageView = SORTING(Code, Field7, Field8); 
                    Visible = false;
                }
            }
        }
        area(processing)
        {
            action("View Payslip Taxable")
            {
                Caption = 'View Payslip Taxable';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee."No.", rec."No.");
                    HrEmployee.SetRange(HrEmployee."Current Month Filter", SelectedPeriod);
                    REPORT.Run(54718, true, false, HrEmployee);
                end;
            }
            action("View Payslip Non Taxable")
            {
                Caption = 'View Payslip Non Taxable';
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";
                    //CLEAR(objOcx);
                    //objOcx.fnMandatoryProcesses;
                    //Display payslip report
                    /*
                    SalCard.SETRANGE("Employee Code","No.");
                    SalCard.SETRANGE(SalCard."Period Filter",SelectedPeriod);
                    REPORT.RUN(39005514,TRUE,FALSE,SalCard);
                    */
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee."No.", rec."No.");
                    HrEmployee.SetRange(HrEmployee."Current Month Filter", SelectedPeriod);
                    REPORT.Run(54636, true, false, HrEmployee);
                end;
            }
            action("Old Process Payroll")
            {
                Caption = 'Old Process Payroll';
                ApplicationArea = All;
                Image = CalculateCalendar;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                begin
                    ContrInfo.Get;
                    //Message('Filters used ' + CurGroup);
                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";
                    //SalCard.GET("No.");
                    //For Multiple Payroll
                    if ContrInfo."Multiple Payroll" then begin
                        PayrollDefined := '';
                        PayrollType.Reset;
                        PayrollType.SetCurrentKey(EntryNo);
                        if PayrollType.FindFirst then begin
                            NoofRecords := PayrollType.Count;
                            i := 0;
                            repeat
                                i += 1;
                                PayrollDefined := PayrollDefined + '&' + PayrollType."Payroll Code";
                                if i < NoofRecords then PayrollDefined := PayrollDefined + ',' until PayrollType.Next = 0;
                        end;
                        Selection := StrMenu(PayrollDefined, NoofRecords);
                        PayrollType.Reset;
                        PayrollType.SetRange(PayrollType.EntryNo, Selection);
                        if PayrollType.Find('-') then begin
                            PayrollCode := PayrollType."Payroll Code";
                        end;
                    end;
                    //End Multiple Payroll
                    //Delete all Records from the prPeriod Transactions for Reprocessing
                    prPeriodTransactions.Reset;
                    if ContrInfo."Multiple Payroll" then prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Code", PayrollCode);
                    //prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll  Classification",CurGroup);
                    prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", SelectedPeriod);
                    if prPeriodTransactions.Find('-') then prPeriodTransactions.DeleteAll;
                    //Delete all Records from prEmployer Deductions
                    prEmployerDeductions.Reset;
                    if ContrInfo."Multiple Payroll" then prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Code", PayrollCode);
                    prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", SelectedPeriod);
                    prEmployerDeductions.CalcFields("Payroll Classification");
                    //prEmployerDeductions.SETRANGE(prEmployerDeductions."Payroll Classification",CurGroup);  //blocked by deji
                    if prEmployerDeductions.Find('-') then prEmployerDeductions.DeleteAll;
                    //UserSetup.GET(USERID);
                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee.Status, HrEmployee.Status::Normal);
                    //HrEmployee.SETFILTER(HrEmployee."Posting Group",CurGroup);  //UserSetup."PayRoll Resp. Cent Filter");
                    //HrEmployee.SETFILTER(HrEmployee."Payroll Filter Group",CurGroup);
                    //HrEmployee.SETFILTER( HrEmployee."Date Of Join",'<=%1',SelectedPeriod);
                    if ContrInfo."Multiple Payroll" then HrEmployee.SetRange(HrEmployee."Payroll Code", PayrollCode);
                    if HrEmployee.Find('-') then begin
                        //Progress Window
                        ProgressWindow.Open('Processing Salary for Employee No. #1#######');
                        repeat //Progress Window
                            Sleep(100);
                            //Progress Window
                            //Suspended
                            if SalCard.Get(HrEmployee."No.") then begin
                                if not SalCard."Suspend Pay" then begin
                                    HrEmployee.TestField(HrEmployee."Date Of Join");
                                    //PKK Check NHF Age
                                    if (HrEmployee."Date Of Birth" <> 0D) then begin
                                        if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") <> HrEmployee."Date Of Birth" then begin
                                            if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") < Today then SalCard."Pays NHF" := false;
                                        end;
                                    end;
                                    //PKK Check NHF Age
                                    //PKProgressWindow.UPDATE(1,HrEmployee."No."+':'+HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name");
                                    if SalCard.Get(HrEmployee."No.") then begin
                                        HrEmployee.TestField(HrEmployee."Date Of Join");
                                        ProcessPayroll.fnProcesspayroll(HrEmployee."No.", HrEmployee."Date Of Join", SalCard."Basic Pay", SalCard."Pays PAYE", SalCard."Pays NSSF", SalCard."Pays NHF", SelectedPeriod, SelectedPeriod, '', '', HrEmployee."Date Of Leaving", true, HrEmployee."Department Code", PayrollCode);
                                    end;
                                end;
                            end;
                            ProgressWindow.Update(1, HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name");
                        until HrEmployee.Next = 0;
                        ////Progress Window
                        ProgressWindow.Close;
                    end;
                    //CODEUNIT
                    Message('Payroll processing completed successfully.');
                    /*
                        SalCard.RESET;
                        SalCard.SETRANGE("Employee Code","No.");
                        SalCard.SETRANGE(SalCard."Period Filter",SelectedPeriod);
                        REPORT.RUN(39005514,TRUE,FALSE,SalCard);
                        */
                end;
            }
            action("Process Current")
            {
                Caption = 'Process Current';
                Image = CalculatePlan;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ContrInfo.Get;
                    VitalInfo.Get('');
                    objPeriod.Reset;
                    objPeriod.SetRange(objPeriod.Closed, false);
                    if objPeriod.Find('-') then;
                    SelectedPeriod := objPeriod."Date Opened";
                    SalCard.Get(rec."No.");
                    //For Multiple Payroll
                    if ContrInfo."Multiple Payroll" then begin
                        PayrollDefined := '';
                        PayrollType.Reset;
                        PayrollType.SetCurrentKey(EntryNo);
                        if PayrollType.FindFirst then begin
                            NoofRecords := PayrollType.Count;
                            i := 0;
                            repeat
                                i += 1;
                                PayrollDefined := PayrollDefined + '&' + PayrollType."Payroll Code";
                                if i < NoofRecords then PayrollDefined := PayrollDefined + ',' until PayrollType.Next = 0;
                        end;
                        Selection := StrMenu(PayrollDefined, NoofRecords);
                        PayrollType.Reset;
                        PayrollType.SetRange(PayrollType.EntryNo, Selection);
                        if PayrollType.Find('-') then begin
                            PayrollCode := PayrollType."Payroll Code";
                        end;
                    end;
                    //End Multiple Payroll
                    //Delete all Records from the prPeriod Transactions for Reprocessing
                    prPeriodTransactions.Reset;
                    prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", rec."No."); //PKK
                    if ContrInfo."Multiple Payroll" then prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Code", PayrollCode);
                    prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", SelectedPeriod);
                    if prPeriodTransactions.Find('-') then prPeriodTransactions.DeleteAll;
                    //Delete all Records from prEmployer Deductions
                    prEmployerDeductions.Reset;
                    prEmployerDeductions.SetRange(prEmployerDeductions."Employee Code", rec."No."); //PKK
                    if ContrInfo."Multiple Payroll" then prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Code", PayrollCode);
                    prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", SelectedPeriod);
                    if prEmployerDeductions.Find('-') then prEmployerDeductions.DeleteAll;
                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee.Status, HrEmployee.Status::Normal);
                    //PKK - PROCESS CURRENT ONLY
                    HrEmployee.SetRange(HrEmployee."No.", rec."No.");
                    //PKK - PROCESS CURRENT ONLY
                    if ContrInfo."Multiple Payroll" then HrEmployee.SetRange(HrEmployee."Payroll Code", PayrollCode);
                    //HrEmployee.SETRANGE(HrEmployee."No.",'CSS0005');
                    if HrEmployee.Find('-') then begin
                        //Progress Window
                        ProgressWindow.Open('Processing Salary for Employee No. #1#######');
                        repeat //Progress Window
                            Sleep(100);
                            //Progress Window
                            //Suspended
                            if not SalCard."Suspend Pay" then begin
                                ProgressWindow.Update(1, HrEmployee."No." + ':' + HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name");
                                if SalCard.Get(HrEmployee."No.") then HrEmployee.TestField(HrEmployee."Date Of Join");
                                //PKK Check NHF Age
                                if (HrEmployee."Date Of Birth" <> 0D) then begin
                                    if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") <> HrEmployee."Date Of Birth" then begin
                                        if CalcDate(VitalInfo."NHF - Maximum Age", HrEmployee."Date Of Birth") < Today then SalCard."Pays NHF" := false;
                                    end;
                                end;
                                //PKK Check NHF Age
                                HrEmployee.TestField(HrEmployee."Date Of Join");
                                ProcessPayroll.fnProcesspayroll(HrEmployee."No.", HrEmployee."Date Of Join", SalCard."Basic Pay", SalCard."Pays PAYE", SalCard."Pays NSSF", SalCard."Pays NHF", SelectedPeriod, SelectedPeriod, '', '', HrEmployee."Date Of Leaving", true, HrEmployee."Department Code", PayrollCode);
                            end;
                        until HrEmployee.Next = 0;
                        ////Progress Window
                        ProgressWindow.Close;
                    end;
                    //CODEUNIT
                    Commit;
                    /*
                    SalCard.RESET;
                    SalCard.SETRANGE("Employee Code","No.");
                    SalCard.SETRANGE(SalCard."Period Filter",SelectedPeriod);
                    REPORT.RUN(39005514,TRUE,FALSE,SalCard);
                    */
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee."No.", rec."No.");
                    HrEmployee.SetRange(HrEmployee."Current Month Filter", SelectedPeriod);
                    REPORT.Run(54636, true, false, HrEmployee);
                end;
            }
            action("Process Payroll")
            {
                Caption = 'Process Payroll';
                Image = CalculatePlan;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    BlnTe: Boolean;

                begin
                   //  ProcessPayroll.NewfnProcesspayroll();
                      ContrInfo.GET;
 
//Message('Filters used ' + CurGroup);
 
objPeriod.RESET;

objPeriod.SETRANGE(objPeriod.Closed,FALSE);

IF objPeriod.FIND('-') THEN;

SelectedPeriod:=objPeriod."Date Opened";
 
//SalCard.GET("No.");
 
//For Multiple Payroll

IF ContrInfo."Multiple Payroll" THEN BEGIN

PayrollDefined:='';

PayrollType.RESET;

PayrollType.SETCURRENTKEY(EntryNo);

IF PayrollType.FINDFIRST THEN BEGIN

    NoofRecords:=PayrollType.COUNT;

    i:=0;

    REPEAT

      i+= 1;

      PayrollDefined:=PayrollDefined+'&'+PayrollType."Payroll Code";

      IF i<NoofRecords THEN

         PayrollDefined:=PayrollDefined+','

    UNTIL PayrollType.NEXT=0;

END;
 
 
        Selection := STRMENU(PayrollDefined,NoofRecords);

        PayrollType.RESET;

        PayrollType.SETRANGE(PayrollType.EntryNo,Selection);

        IF PayrollType.FIND('-') THEN BEGIN

            PayrollCode:=PayrollType."Payroll Code";

        END;

END;

//End Multiple Payroll
 
//Delete all Records from the prPeriod Transactions for Reprocessing

prPeriodTransactions.RESET;

IF ContrInfo."Multiple Payroll" THEN

//prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll Code",PayrollCode);

prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll  Classification",CurGroup);

prPeriodTransactions.SETRANGE(prPeriodTransactions."Payroll Period",SelectedPeriod);

IF prPeriodTransactions.FIND('-') THEN

prPeriodTransactions.DELETEALL;
 
//Delete all Records from prEmployer Deductions

prEmployerDeductions.RESET;

IF ContrInfo."Multiple Payroll" THEN

prEmployerDeductions.SETRANGE(prEmployerDeductions."Payroll Code",PayrollCode);

prEmployerDeductions.SETRANGE(prEmployerDeductions."Payroll Period",SelectedPeriod);

prEmployerDeductions.CALCFIELDS("Payroll Classification");

prEmployerDeductions.SETRANGE(prEmployerDeductions."Payroll Classification",CurGroup);

IF prEmployerDeductions.FIND('-') THEN

prEmployerDeductions.DELETEALL;
 
//UserSetup.GET(USERID); RBS Lateef 12022026

//Use CODEUNIT

HrEmployee.RESET;

HrEmployee.SETRANGE(HrEmployee.Status,HrEmployee.Status::Normal);

//HrEmployee.SETFILTER(HrEmployee."Posting Group",CurGroup);  //UserSetup."PayRoll Resp. Cent Filter");

HrEmployee.SETFILTER(HrEmployee."Payroll Filter Group",CurGroup);

//HrEmployee.SETFILTER( HrEmployee."Date Of Join",'<=%1',SelectedPeriod);

IF ContrInfo."Multiple Payroll" THEN

HrEmployee.SETRANGE(HrEmployee."Payroll Code",PayrollCode);

IF HrEmployee.FIND('-') THEN BEGIN

  //Progress Window

  ProgressWindow.OPEN('Processing Salary for Employee No. #1#######');

  REPEAT

  //Progress Window

   SLEEP(100);

  //Progress Window

  //Suspended

  IF SalCard.GET(HrEmployee."No.") THEN BEGIN

  IF NOT SalCard."Suspend Pay" THEN BEGIN

  HrEmployee.TESTFIELD(HrEmployee."Date Of Join");

  //PKK Check NHF Age

  IF (HrEmployee."Date Of Birth" <> 0D) THEN BEGIN

  IF CALCDATE(VitalInfo."NHF - Maximum Age",HrEmployee."Date Of Birth") <> HrEmployee."Date Of Birth" THEN BEGIN

  IF CALCDATE(VitalInfo."NHF - Maximum Age",HrEmployee."Date Of Birth") < TODAY THEN

  SalCard."Pays NHF":=FALSE;

  END;

  END;

  //PKK Check NHF Age

//PKProgressWindow.UPDATE(1,HrEmployee."No."+':'+HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name");
 
  IF SalCard.GET(HrEmployee."No.") THEN BEGIN

  HrEmployee.TESTFIELD(HrEmployee."Date Of Join");

  ProcessPayroll.fnProcesspayroll(HrEmployee."No.",HrEmployee."Date Of Join",SalCard."Basic Pay",SalCard."Pays PAYE"

      ,SalCard."Pays NSSF",SalCard."Pays NHF",SelectedPeriod,SelectedPeriod,'','',

      HrEmployee."Date Of Leaving",TRUE,HrEmployee."Department Code",PayrollCode);

  END;

  END;

  END;
 
  ProgressWindow.UPDATE(1,HrEmployee."No."+':'+HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name");
 
UNTIL  HrEmployee.NEXT = 0;

////Progress Window

ProgressWindow.CLOSE;

END;

//CODEUNIT
 
MESSAGE('Payroll processing completed successfully.');

                                                                                                                                                                                                                                                                                     //  NewProcessPayroll.fnProcesspayroll(HrEmployee."No.", HrEmployee."Date Of Join", SalCard."Basic Pay", SalCard."Pays PAYE", SalCard."Pays NSSF", SalCard."Pays NHF", SelectedPeriod, SelectedPeriod, '', '', HrEmployee."Date Of Leaving", true, HrEmployee."Department Code", PayrollCode);


                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        SecurityPageFilter;
    end;

    var
        objEmp: Record "HR-Employee";
        SalCard: Record "prSalary Card";
        objPeriod: Record "prPayroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit prPayrollProcessing;
        HrEmployee: Record "HR-Employee";
        Employee: Record "HR-Employee";
        ProgressWindow: Dialog;
        prPeriodTransactions: Record "prPeriod Transactions";
        prEmployerDeductions: Record "prEmployer Deductions";
        PayrollType: Record "prPayroll Type";
        Selection: Integer;
        PayrollDefined: Text[30];
        PayrollCode: Code[10];
        NoofRecords: Integer;
        i: Integer;
        ContrInfo: Record "Control-Information";
        DepName: Text[200];
        DValues: Record "Dimension Value";
        VitalInfo: Record "prVital Setup Info";
        UserSetupMgt: Codeunit "User Setup Management";
        PayrollUserMgt: Codeunit "Payroll User Mgt";
        UserSetup: Record "User Setup";
        Emp: Record "HR Employees";
        CurGroup: Text[100];
        NewProcessPayroll: Codeunit NewPayrollProcessing;

    local procedure FilterPage()
    var
        UserSet: Record "User Setup";
    begin
        if UserSetup."Payroll Substitute" <> '' then begin
            if PayrollUserMgt.GetPayrollFilter <> '' then begin
                rec.FilterGroup(2);
                //SETFILTER("Payroll Filter Group",'%1|%2',PayrollUserMgt.GetPayrollFilter,PayrollUserMgt.GetPayrollSubFilter(UserSetup."Payroll Substitute"));
                rec.SetRange("Payroll Filter Group", PayrollUserMgt.GetPayrollSubFilter(UserSetup."Payroll Substitute"));
                CurGroup := rec.GetFilter("Payroll Filter Group");
                rec.FilterGroup(0);
            end;
        end;
    end;

    local procedure FilterPage2()
    var
        UserSet: Record "User Setup";
    begin
        if PayrollUserMgt.GetPayrollFilter <> '' then begin
            rec.FilterGroup(2);
            rec.SetRange("Payroll Filter Group", PayrollUserMgt.GetPayrollFilter);
            CurGroup := rec.GetFilter("Payroll Filter Group");
            rec.FilterGroup(0);
        end;
    end;

    local procedure SecurityPageFilter()
    begin
        Emp.Reset;
        Emp.SetRange(Emp."User ID", UserId);
        if Emp.FindFirst then begin
            if Emp.Available = false then
                rec.SetFilter("Payroll Filter Group", 'AA')
            else begin
                if UserSetup.Get(UserId) then begin
                    Emp.SetRange(Emp."User ID", UserSetup."Payroll Substitute");
                    if Emp.FindFirst then begin
                        if Emp.Available = true then
                            FilterPage2
                        else
                            FilterPage;
                    end;
                end;
            end;
        end;
    end;
}
