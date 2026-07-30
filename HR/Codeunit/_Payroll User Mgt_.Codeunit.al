codeunit 54515 "Payroll User Mgt"
{
    trigger OnRun()
    begin
    end;
    var UserSetup: Record "User Setup";
    HasEmployeeClass: Boolean;
    CompanyInfo: Record "Company Information";
    PayrollClass: Code[20];
    Pay: Code[20];
    GradeClass: Code[20];
    [Scope('Cloud')]
    procedure GetPayrollFilter(): Code[10]begin
        exit(GetPayrollFilter2(UserId));
    end;
    [Scope('Cloud')]
    procedure GetPayrollFilter2(UserCode: Code[50]): Code[10]begin
        CompanyInfo.Get;
        PayrollClass:=CompanyInfo."Responsibility Center";
        if UserSetup.Get(UserCode) and (UserCode <> '')then if UserSetup."PayRoll Cent. Filter" <> '' then PayrollClass:=UserSetup."PayRoll Cent. Filter";
        HasEmployeeClass:=true;
        exit(PayrollClass);
    end;
    [Scope('Cloud')]
    procedure GetPayrollSubFilter(UserCod: Code[50]): Code[10]begin
        exit(GetPayrollFilter2(UserCod));
    end;
    [Scope('Cloud')]
    procedure GetGradeFilter(): Code[10]begin
        exit(GetGradeFilter2(UserId));
    end;
    [Scope('Cloud')]
    procedure GetGradeFilter2(UserCode: Code[50]): Code[10]begin
        CompanyInfo.Get;
        GradeClass:=CompanyInfo."Responsibility Center";
        if UserSetup.Get(UserCode) and (UserCode <> '')then //  IF UserSetup."User ID" <> '' THEN //AND ("User ID" <> '') THEN
            if UserSetup."Grade Classification" <> '' then GradeClass:=UserSetup."Grade Classification";
        HasEmployeeClass:=true;
        exit(GradeClass);
    end;
    [Scope('Cloud')]
    procedure GetGradeSubFilter(UserCod: Code[50]): Code[10]begin
        exit(GetGradeFilter2(UserCod));
    end;
}
