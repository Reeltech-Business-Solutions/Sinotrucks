page 50383 "NRS Activities"
{
    Caption = 'NRS E-Invoicing Activities';
    PageType = CardPart;
    SourceTable = "NRS Cue";
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            cuegroup(IRN)
            {
                Caption = 'Invoice Reference Numbers';

                field("Invoices Pending IRN"; Rec."Invoices Pending IRN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posted sales invoices that do not yet have an IRN.';
                    Style = Attention;

                    trigger OnDrillDown()
                    var
                        SalesInvHeader: Record "Sales Invoice Header";
                    begin
                        SalesInvHeader.SetRange("NRS IRN Status", SalesInvHeader."NRS IRN Status"::"Not Generated");
                        Page.Run(Page::"Posted Sales Invoices", SalesInvHeader);
                    end;
                }
                field("Generated Today"; Rec."Generated Today")
                {
                    ApplicationArea = All;
                    ToolTip = 'IRNs generated today.';
                    Style = Favorable;

                    trigger OnDrillDown()
                    begin
                        OpenLogByStatus("NRS IRN Status"::Generated, true);
                    end;
                }
                field("IRN Generated"; Rec."IRN Generated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Total IRNs successfully generated.';

                    trigger OnDrillDown()
                    begin
                        OpenLogByStatus("NRS IRN Status"::Generated, false);
                    end;
                }
                field("Duplicate IRN"; Rec."Duplicate IRN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Attempts rejected because an IRN already existed for the invoice.';
                    Style = Ambiguous;

                    trigger OnDrillDown()
                    begin
                        OpenLogByStatus("NRS IRN Status"::Duplicate, false);
                    end;
                }
                field("Failed IRN"; Rec."Failed IRN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Attempts that failed and may need to be retried.';
                    Style = Unfavorable;

                    trigger OnDrillDown()
                    begin
                        OpenLogByStatus("NRS IRN Status"::Failed, false);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        Rec.SetRange("Date Filter", Today());
    end;

    local procedure OpenLogByStatus(StatusValue: Enum "NRS IRN Status"; TodayOnly: Boolean)
    var
        IRNLog: Record "NRS IRN Log";
    begin
        IRNLog.SetRange(Status, StatusValue);
        if TodayOnly then
            IRNLog.SetRange("Generated Date", Today());
        Page.Run(Page::"NRS IRN Log", IRNLog);
    end;
}
