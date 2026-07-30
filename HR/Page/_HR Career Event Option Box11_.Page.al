page 54463 "HR Career Event Option Box11"
{
    PageType = Card;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            label(MessageTextBox)
            {
                CaptionClass = Format(MessageText);
                MultiLine = true;
                ApplicationArea = All;
            }
            label(Control1102755000)
            {
                ShowCaption = false;
                ApplicationArea = All;
            }
            field(ReasonText; ReasonText)
            {
                Caption = 'Reason';
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean begin
        if CloseAction = ACTION::No then NoOnPush;
        if CloseAction = ACTION::Yes then YesOnPush;
    end;
    var MessageText: Text[250];
    ResultEvent: Boolean;
    ReasonText: Text[100];
    CareerHistory: Record "HR Employees";
    ResultReason: Text[100];
    [Scope('Cloud')]
    procedure SetMessage(Message: Text[200])
    begin
        MessageText:=StrSubstNo(Message);
    end;
    [Scope('Cloud')]
    procedure ReturnResult()Result: Boolean begin
        Result:=ResultEvent;
    end;
    [Scope('Cloud')]
    procedure ReturnReason()ReturnReason: Text[100]begin
        ReturnReason:=ReasonText;
    end;
    local procedure YesOnPush()
    begin
        ResultEvent:=true;
    end;
    local procedure NoOnPush()
    begin
        ResultEvent:=false;
    end;
}
