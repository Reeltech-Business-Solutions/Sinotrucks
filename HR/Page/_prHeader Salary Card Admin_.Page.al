page 54636 "prHeader Salary Card Admin"
{
    // strempcode,dtDOE,curbasicpay,blnpaye,blnnssf,blnnhif,selectedperio,dtopenperio,
    // membership,referenceno,dttermination,blngetspayereleif
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Navigate,Functions,Category9_caption,Category10_caption';
    SourceTable = "HR-Employee";
    SourceTableView = WHERE(Status = FILTER(Normal));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                    Enabled = true;
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                field(DepName; DepName)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Office; rec.Office)
                {
                    Caption = 'Unit';
                    ApplicationArea = all;
                }
                field("Payment Mode"; Rec."Payment Mode")
                {
                    ApplicationArea = all;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    Enabled = true;
                    ApplicationArea = all;
                }
                field("Contract End Date"; Rec."Contract End Date")
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

                    trigger OnValidate()
                    begin
                        if not Confirm('Changing the Grade will affect the Basic Salary and the salary notch\step transactions. ' + 'Do you wish to continue?', false) then begin
                            rec."Salary Notch/Step" := '';
                            Error('You have opted to abort the process.');
                        end;
                    end;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = all;
                }
            }
            part(Control1102756041; "prSalary Info")
            {
                SubPageLink = "Employee Code" = FIELD("No.");
                ApplicationArea = all;
            }
            group("Posting && Bank Details")
            {
                Caption = 'Posting && Bank Details';

                field("Hr Posting Group"; Rec."Posting Group")
                {
                    Caption = 'Posting Group';
                    Editable = true;
                    ApplicationArea = all;
                }
                field("Main Bank"; Rec."Main Bank")
                {
                    ApplicationArea = all;
                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    ApplicationArea = all;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = all;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = all;
                }
            }
            group("Other Details")
            {
                Caption = 'Other Details';

                field("ID Number"; Rec."ID Number")
                {
                    Caption = 'ID No.';
                    ApplicationArea = all;
                }
                field("PIN No."; Rec."PIN No.")
                {
                    Caption = 'Pension No.';
                    ApplicationArea = all;
                }
                field("Pension House"; Rec."Pension House")
                {
                    ApplicationArea = all;
                }
                field("NHF No."; Rec."NHF No.")
                {
                    ApplicationArea = all;
                }
                field("NSITF No."; Rec."NSITF No.")
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
                    ApplicationArea = all;
                }
                separator(Action1102756016)
                {
                }
                action("Banking Details")
                {
                    Caption = 'Banking Details';
                    Image = BankAccount;
                    RunObject = Page "prEmployee Banks";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                    ApplicationArea = all;
                }
                separator(Action1102756059)
                {
                }
                action("Pension Details")
                {
                    Caption = 'Pension Details';
                    Image = PlanningWorksheet;
                    RunObject = Page "Pension Contribution Details";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    ApplicationArea = all;
                }
            }
            group(Transactions)
            {
                Caption = 'Transactions';

                action("Payroll Transactions")
                {
                    Caption = 'Payroll Transactions';
                    Image = Trace;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "prList Transactions";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    ApplicationArea = all;
                }
                separator(Action1102756009)
                {
                }
                action("View Trans Codes")
                {
                    Caption = 'View Trans Codes';
                    Image = Track;
                    RunObject = Page "prList TransCode";
                    Visible = false;
                    ApplicationArea = all;
                }
                separator(Action1102756011)
                {
                }
                action("Insurance Policies")
                {
                    Caption = 'Insurance Policies';
                    Image = Insurance;
                    RunObject = Page "prInsurance Policies";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    Visible = false;
                    ApplicationArea = all;
                }
                separator(Action1102756013)
                {
                }
                action("Staff Loans")
                {
                    Caption = 'Staff Loans';
                    Image = Loaner;
                    RunObject = Page "prInsurance Policies";
                    Visible = false;
                    ApplicationArea = all;
                }
                separator(Action1102756000)
                {
                }
                action("Basic Salary Arrears")
                {
                    Caption = 'Basic Salary Arrears';
                    Image = CalculateRegenerativePlan;
                    //RunObject = Page "HR Deduction Account";
                    //RunPageLink = Code = FIELD("No.");
                    //RunPageView = SORTING(Code, Field7, Field8);
                    Visible = false;
                    ApplicationArea = all;
                }
                action("Staff Loan External")
                {
                    Image = Loaners;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category8;
                    PromotedIsBig = true;
                    RunObject = Page "HR Employees External Loans";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Salary Information")
                {
                    Caption = 'Salary Information';
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        PrSalaryInfo: Record "prSalary Card";
                    begin
                        //PrSalaryInfo.reset;
                        if PrSalaryInfo.Get(rec."No.") then
                            PAGE.Run(PAGE::"prSalary Info", PrSalaryInfo)
                        else begin
                            PrSalaryInfo.Init;
                            PrSalaryInfo."Employee Code" := rec."No.";
                            PrSalaryInfo.Insert(true);
                            PAGE.Run(PAGE::"prSalary Info", PrSalaryInfo)
                        end
                    end;
                }
            }
        }
        area(processing)
        {
            action("View Payslip")
            {
                Caption = 'View Payslip';
                Image = Payment;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Process;

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
                    REPORT.Run(54718, true, false, HrEmployee);
                end;
            }
            action("Process Current")
            {
                Caption = 'Process Current';
                Image = CalculatePlan;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Process;
                Visible = false;

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
                    REPORT.Run(54718, true, false, HrEmployee);
                end;
            }
            action("Process Payroll")
            {
                Caption = 'Process Payroll';
                Image = CalculateCalendar;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Process;
                Visible = True;

                trigger OnAction()
                begin
                    ContrInfo.Get;
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
                    prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", SelectedPeriod);
                    if prPeriodTransactions.Find('-') then prPeriodTransactions.DeleteAll;
                    //Delete all Records from prEmployer Deductions
                    prEmployerDeductions.Reset;
                    if ContrInfo."Multiple Payroll" then prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Code", PayrollCode);
                    prEmployerDeductions.SetRange(prEmployerDeductions."Payroll Period", SelectedPeriod);
                    if prEmployerDeductions.Find('-') then prEmployerDeductions.DeleteAll;
                    UserSetup.Get(UserId);
                    //error('%1',Userid);
                    //Use CODEUNIT
                    HrEmployee.Reset;
                    HrEmployee.SetRange(HrEmployee.Status, HrEmployee.Status::Normal);
                    HrEmployee.SetRange(HrEmployee."Posting Group", UserSetup."PayRoll Cent. Filter");
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
            action("New Salary")
            {
                Caption = 'New Salary';
                ApplicationArea = all;
                Image = NewSparkle;

                trigger OnAction()
                begin
                    prSalaryCard.Init;
                    prSalaryCard."Employee Code" := rec."No.";
                    prSalaryCard.Insert;
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        DepName := '';
        DValues.Reset;
        DValues.SetRange(DValues.Code, rec."Department Code");
        if DValues.Find('-') then DepName := DValues.Name;
    end;

    trigger OnInit()
    begin
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then begin
            SelectedPeriod := objPeriod."Date Opened";
            PeriodName := objPeriod."Period Name";
            PeriodMonth := objPeriod."Period Month";
            PeriodYear := objPeriod."Period Year";
        end;
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
        prSalaryCard: Record "prSalary Card";
        UserSetup: Record "User Setup";
}
