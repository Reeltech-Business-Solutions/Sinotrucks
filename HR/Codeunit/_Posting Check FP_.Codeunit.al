codeunit 54519 "Posting Check FP"
{
    SingleInstance = true;

    trigger OnRun()
    begin
    end;
    var Post: Boolean;
    blnState: Boolean;
    blnJrnlState: Boolean;
    FromNo: Code[20];
    ToNo: Code[20];
    [Scope('Cloud')]
    procedure SetCheck(var blnPost: Boolean)
    begin
        Post:=blnPost;
    end;
    [Scope('Cloud')]
    procedure GetCheck()blnPost: Boolean begin
        blnPost:=Post;
    end;
    [Scope('Cloud')]
    procedure ResetState()
    begin
        blnState:=false;
        FromNo:='';
        ToNo:='';
    end;
    [Scope('Cloud')]
    procedure SetState(Post: Boolean)
    begin
        blnState:=Post;
    end;
    [Scope('Cloud')]
    procedure GetState()ActState: Boolean begin
        ActState:=blnState;
        exit(ActState);
    end;
    [Scope('Cloud')]
    procedure FromEntryNo(var FromNoReg: Code[20])
    begin
        FromNo:=FromNoReg;
    end;
    [Scope('Cloud')]
    procedure ToEntryNo(var ToNoReg: Code[20])
    begin
        ToNo:=ToNoReg;
    end;
    [Scope('Cloud')]
    procedure GetFromRegNo()FromRegisterNo: Code[20]begin
        FromRegisterNo:=FromNo;
    end;
    [Scope('Cloud')]
    procedure GetToRegNo()ToRegisterNo: Code[20]begin
        ToRegisterNo:=ToNo;
    end;
}
