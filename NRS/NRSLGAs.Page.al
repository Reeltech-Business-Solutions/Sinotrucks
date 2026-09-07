page 50391 "NRS LGAs"
{
    Caption = 'NRS LGAs';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "NRS LGA";

    layout
    {
        area(Content)
        {
            repeater(LGAs)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the NRS LGA code (e.g. NG-LA-LIS).';
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Local Government Area name.';
                }
                field("State Code"; Rec."State Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the state this LGA belongs to.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(LoadLGAs)
            {
                ApplicationArea = All;
                Caption = 'Load NRS LGAs';
                ToolTip = 'Loads the full NRS Local Government Area list (all states).';
                Image = Refresh;

                trigger OnAction()
                var
                    RefData: Codeunit "NRS Reference Data";
                begin
                    RefData.SeedNigerianStates();
                    RefData.SeedNigerianLGAs();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        RefData: Codeunit "NRS Reference Data";
    begin
        if Rec.IsEmpty() then begin
            RefData.SeedNigerianStates();
            RefData.SeedNigerianLGAs();
        end;
    end;
}
