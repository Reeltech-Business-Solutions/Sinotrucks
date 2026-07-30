page 54613 "prSalary Arrears"
{
    PageType = Card;
    SourceTable = "prSalary Arrears";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Basic Pay Arrears")
            {
                Caption = 'Basic Pay Arrears';

                field("Employee Code"; Rec."Employee Code")
                {
                    Enabled = true;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        //Get the employee name
                        strEmpName:='';
                        objEmp.Reset;
                        objEmp.SetRange(objEmp."No.", rec."Employee Code");
                        if objEmp.Find('-')then strEmpName:=objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    end;
                }
                field(strEmpName; strEmpName)
                {
                    Caption = 'Name';
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = true;
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Period Month"; Rec."Period Month")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Period Year"; Rec."Period Year")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = all;
                }
                field("Current Basic"; Rec."Current Basic")
                {
                    ApplicationArea = all;
                }
                field("Salary Arrears"; Rec."Salary Arrears")
                {
                    Style = Strong;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("PAYE Arrears"; Rec."PAYE Arrears")
                {
                    Style = Strong;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnAfterGetRecord()
    begin
        strEmpCode:=rec."Employee Code";
        strTransCode:=rec."Transaction Code";
        //Get the employee name
        strEmpName:='';
        objEmp.Reset;
        objEmp.SetRange(objEmp."No.", rec."Employee Code");
        if objEmp.Find('-')then strEmpName:=objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
        //Get the open/current period
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-')then PeriodMonth:=PayPeriod."Period Month";
        PeriodYear:=PayPeriod."Period Year";
        rec."Period Month":=PeriodMonth;
        rec."Period Year":=PeriodYear;
        //Get the Salary Arrears code
        TransCode.SetRange(TransCode."Special Transactions", 6);
        if TransCode.Find('-')then strTransCode:=TransCode."Transaction Code";
        rec."Transaction Code":=strTransCode;
        //Get the staff current salary
        if SalCard.Get(rec."Employee Code")then begin
            rec."Current Basic":=SalCard."Basic Pay";
        end;
    end;
    var objOcx: Codeunit prPayrollProcessing;
    SalCard: Record "prSalary Card";
    PayPeriod: Record "prPayroll Periods";
    PeriodMonth: Integer;
    PeriodYear: Integer;
    TransCode: Record "prTransaction Codes";
    strTransCode: Text[30];
    strEmpCode: Text[30];
    SalArr: Record "prSalary Arrears";
    strEmpName: Text[50];
    objEmp: Record "HR-Employee";
}
