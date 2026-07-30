page 54434 "Processed Deduction Variations"
{
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Processed Deduction Variations';
    SourceTable = "prPayroll Variations";
    SourceTableView = WHERE(Processed=CONST(true), "Transaction Type"=CONST(Deduction));

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = all;
                }
                field("Employee Names"; Rec."Employee Names")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        blnIsLoan:=FALSE;
                        IF objTransCodes.GET(rec."Transaction Code")THEN rec."Transaction Name":=objTransCodes."Transaction Name";
                        rec."Payroll Period":=SelectedPeriod;
                        rec."Period Month":=PeriodMonth;
                        rec."Period Year":=PeriodYear;
                        IF objTransCodes."Special Transactions" = 8 THEN blnIsLoan:=TRUE;
                        /*IF objTransCodes."Is Formula"=TRUE THEN
                        BEGIN
                         empCode:="Employee Code";
                         CLEAR(objOcx);
                         curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes.Formula);
                         Amount:=curTransAmount;
                        END;
                        */
                        //*************ENTER IF EMPLOYER DEDUCTION IS SET UP
                        curTransAmount:=0;
                    /*
                        IF objTransCodes."Include Employer Deduction"=TRUE THEN
                        BEGIN
                          curTransAmount:=objOcx.fnDisplayFrmlValues(empCode,PeriodMonth,PeriodYear,objTransCodes."Is Formula for employer");
                          "Employer Amount":=curTransAmount;
                        END;
                        */
                    end;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Frequency; rec.Frequency)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("No of Units"; Rec."No of Units")
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF(blnIsLoan = TRUE) AND (rec.Balance > 0) AND (rec.Amount > 0)THEN BEGIN
                            rec."#of Repayments":=ROUND(rec.Balance / rec.Amount, 1, '>');
                            rec."#of Repayments":=ROUND(rec."#of Repayments", 1, '>');
                        END;
                    end;
                }
                field(Balance; rec.Balance)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF(blnIsLoan = TRUE) AND (rec.Balance > 0) AND (rec.Amount > 0)THEN BEGIN
                            rec."#of Repayments":=ROUND(rec.Balance / rec.Amount, 1, '>');
                            rec."#of Repayments":=ROUND(rec."#of Repayments", 1, '>');
                        END;
                    end;
                }
                field("#of Repayments"; Rec."#of Repayments")
                {
                    Editable = true;
                    Visible = true;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        IF blnIsLoan = TRUE THEN BEGIN
                            rec."#of Repayments":=ROUND(rec.Balance / rec.Amount, 1, '>');
                            rec."#of Repayments":=ROUND(rec."#of Repayments", 1, '>');
                        END;
                    end;
                }
                field("Amortized Loan Total Repay Amt"; Rec."Amortized Loan Total Repay Amt")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Membership; rec.Membership)
                {
                    ApplicationArea = all;
                }
                field("Loan Number"; Rec."Loan Number")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Reference No"; Rec."Reference No")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Suspended; rec.Suspended)
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Stop for Next Period"; Rec."Stop for Next Period")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = all;
                }
                field("Employer Balance"; Rec."Employer Balance")
                {
                    ApplicationArea = all;
                }
                field(Processed; rec.Processed)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Process All")
            {
                Caption = 'Process All';
                Image = Recalculate;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction()
                begin
                    IF NOT CONFIRM('This will effect the changes to the employee transactions. ' + 'Do you wish to continue?', FALSE)THEN BEGIN
                        EXIT;
                    END;
                    objPayrollPeriod.RESET;
                    objPayrollPeriod.SETRANGE(objPayrollPeriod.Closed, FALSE);
                    IF objPayrollPeriod.FIND('-')THEN BEGIN
                        TransVariation.RESET;
                        TransVariation.SETRANGE(TransVariation.Processed, FALSE);
                        TransVariation.SETRANGE(TransVariation."Payroll Period", objPayrollPeriod."Date Opened");
                        IF TransVariation.FIND('-')THEN BEGIN
                            REPEAT EmpTrans.RESET;
                                EmpTrans.SETCURRENTKEY(EmpTrans."Employee Code", EmpTrans."Transaction Code");
                                EmpTrans.SETRANGE(EmpTrans."Employee Code", rec."Employee Code");
                                EmpTrans.SETRANGE(EmpTrans."Transaction Code", TransVariation."Transaction Code");
                                EmpTrans.SETRANGE(EmpTrans."Payroll Period", objPayrollPeriod."Date Opened");
                                IF EmpTrans.FIND('-')THEN BEGIN
                                    EmpTrans.Amount:=TransVariation.Amount;
                                    objEmpTrans.Balance:=TransVariation.Balance;
                                    EmpTrans."No Of Repayments":=TransVariation."#of Repayments";
                                    EmpTrans."No of Units":=TransVariation."No of Units";
                                    EmpTrans."Employer Amount":=TransVariation."Employer Amount";
                                    EmpTrans."Employer Balance":=TransVariation."Employer Balance";
                                    EmpTrans."Start Date":=TransVariation."Start Date";
                                    EmpTrans."End Date":=TransVariation."End Date";
                                    EmpTrans.Membership:=TransVariation.Membership;
                                    EmpTrans."Loan Number":=TransVariation."Loan Number";
                                    EmpTrans."Payroll Code":=TransVariation."Payroll Code";
                                    EmpTrans.Suspended:=TransVariation.Suspended;
                                    EmpTrans.MODIFY;
                                    TransVariation.Processed:=TRUE;
                                    TransVariation.MODIFY;
                                END
                                ELSE
                                BEGIN
                                    EmpTransR.INIT;
                                    EmpTransR."Employee Code":=TransVariation."Employee Code";
                                    EmpTransR."Transaction Code":=TransVariation."Transaction Code";
                                    EmpTransR."Period Month":=objPayrollPeriod."Period Month";
                                    EmpTransR."Period Year":=objPayrollPeriod."Period Year";
                                    EmpTransR."Payroll Period":=objPayrollPeriod."Date Opened";
                                    EmpTransR."Transaction Name":=TransVariation."Transaction Name";
                                    EmpTransR.Amount:=TransVariation.Amount;
                                    EmpTransR.Balance:=TransVariation.Balance;
                                    EmpTransR."No Of Repayments":=TransVariation."#of Repayments";
                                    EmpTransR."No of Units":=TransVariation."No of Units";
                                    EmpTransR."Employer Amount":=TransVariation."Employer Amount";
                                    EmpTransR."Employer Balance":=TransVariation."Employer Balance";
                                    EmpTransR."Start Date":=TransVariation."Start Date";
                                    EmpTransR."End Date":=TransVariation."End Date";
                                    EmpTransR.Membership:=TransVariation.Membership;
                                    EmpTransR."Loan Number":=TransVariation."Loan Number";
                                    EmpTransR."Payroll Code":=TransVariation."Payroll Code";
                                    EmpTransR.Suspended:=TransVariation.Suspended;
                                    EmpTransR.INSERT;
                                    TransVariation.Processed:=TRUE;
                                    TransVariation.MODIFY;
                                END;
                            UNTIL TransVariation.NEXT = 0;
                        END;
                    END;
                end;
            }
        }
    }
    trigger OnInit()
    begin
        objPeriod.RESET;
        objPeriod.SETRANGE(objPeriod.Closed, FALSE);
        IF objPeriod.FIND('-')THEN BEGIN
            SelectedPeriod:=objPeriod."Date Opened";
            PeriodName:=objPeriod."Period Name";
            PeriodMonth:=objPeriod."Period Month";
            PeriodYear:=objPeriod."Period Year";
        //objEmpTrans.RESET;
        //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
        END;
        //Filter per period  - Dennis
        rec.SETFILTER("Payroll Period", FORMAT(objPeriod."Date Opened"));
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Transaction Type":=rec."Transaction Type"::Deduction;
    end;
    var objTransCodes: Record "prTransaction Codes";
    SelectedPeriod: Date;
    objPeriod: Record "prPayroll Periods";
    PeriodName: Text[30];
    PeriodTrans: Record "prPeriod Transactions";
    PeriodMonth: Integer;
    PeriodYear: Integer;
    blnIsLoan: Boolean;
    objEmpTrans: Record "prEmployee Transactions";
    transType: Text[30];
    //objOcx: Codeunit "prPayrollProcessing";
    strExtractedFrml: Text[30];
    curTransAmount: Decimal;
    empCode: Text[30];
    EmpTrans: Record "prEmployee Transactions";
    EmpTransR: Record "prEmployee Transactions";
    TransVariation: Record "prPayroll Variations";
    objPayrollPeriod: Record "prPayroll Periods";
}
