page 54750 "Responsibility Center List BR"
{
    Caption = 'Responsibility Center List';
    CardPageID = "Responsibility Center Card BR";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Responsibility Center BR";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Code"; rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Resp. Ctr.")
            {
                Caption = '&Resp. Ctr.';

                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Responsibility Center Card BR";
                    RunPageLink = Code=FIELD(Code);
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';

                    action("Dimensions-Single")
                    {
                        Caption = 'Dimensions-Single';
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID"=CONST(5714), "No."=FIELD(Code);
                        ShortCutKey = 'Shift+Ctrl+D';
                        ApplicationArea = All;
                    }
                    action("Dimensions-&Multiple")
                    {
                        Caption = 'Dimensions-&Multiple';
                        ApplicationArea = All;

                        trigger OnAction()
                        var
                            RespCenter: Record "Responsibility Center";
                        begin
                        /*CurrPage.SETSELECTIONFILTER(RespCenter);
                            DefaultDimMultiple.SetMultiRespCenter(RespCenter);
                            DefaultDimMultiple.RUNMODAL;  */
                        end;
                    }
                }
            }
        }
    }
}
