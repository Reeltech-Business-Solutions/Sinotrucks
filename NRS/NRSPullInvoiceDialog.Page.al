page 54396 "NRS Pull Invoice Dialog"
{
    Caption = 'Pull NRS Invoice';
    PageType = StandardDialog;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Pull)
            {
                field(IRN; IRNVar)
                {
                    Caption = 'IRN';
                    ApplicationArea = All;
                    ToolTip = 'Enter the IRN of the signed invoice a supplier transmitted to you.';
                }
            }
        }
    }

    var
        IRNVar: Text[100];

    procedure GetIRN(): Text
    begin
        exit(IRNVar);
    end;
}
