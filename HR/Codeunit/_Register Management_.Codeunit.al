codeunit 54512 "Register Management"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;
    var RegisterNo: Integer;
    FromEntryNo: Integer;
    ToEntryNo: Integer;
    [Scope('Cloud')]
    procedure ResetValues()
    begin
        RegisterNo:=0;
        FromEntryNo:=0;
        ToEntryNo:=0;
    end;
    [Scope('Cloud')]
    procedure SetRegisterNumber(var "No.": Integer)
    begin
        RegisterNo:="No.";
    end;
    [Scope('Cloud')]
    procedure SetFromEntryNumber(var "No.": Integer)
    begin
        FromEntryNo:="No.";
    end;
    [Scope('Cloud')]
    procedure SetToEntryNumber(var "No.": Integer)
    begin
        ToEntryNo:="No.";
    end;
    [Scope('Cloud')]
    procedure GetRegisterNumber()RegisterNumber: Integer begin
        RegisterNumber:=RegisterNo;
        exit(RegisterNumber);
    end;
    [Scope('Cloud')]
    procedure GetFromEntryNo()EntryNo: Integer begin
        EntryNo:=FromEntryNo;
        exit(EntryNo);
    end;
    [Scope('Cloud')]
    procedure GetToEntryNo()EntryNo: Integer begin
        EntryNo:=ToEntryNo;
        exit(EntryNo);
    end;
}
