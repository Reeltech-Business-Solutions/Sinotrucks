page 50390 "NRS States"
{
    Caption = 'NRS States';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "NRS State";

    layout
    {
        area(Content)
        {
            repeater(States)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the NRS state code (e.g. NG-LA for Lagos).';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the state name.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(LoadStates)
            {
                ApplicationArea = All;
                Caption = 'Load Nigerian States';
                ToolTip = 'Loads the standard 36 states and FCT with their NG-XX codes.';
                Image = Refresh;

                trigger OnAction()
                var
                    RefData: Codeunit "NRS Reference Data";
                begin
                    RefData.SeedNigerianStates();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        RefData: Codeunit "NRS Reference Data";
    begin
        if Rec.IsEmpty() then
            RefData.SeedNigerianStates();
    end;
}
