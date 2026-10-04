page 50393 "NRS Received Invoices"
{
    Caption = 'NRS Received Invoices';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "NRS Received Invoice";
    CardPageId = "NRS Received Invoice";
    Editable = false;
    SourceTableView = sorting("Pulled At") order(descending);

    layout
    {
        area(Content)
        {
            repeater(Invoices)
            {
                field("IRN"; Rec."IRN") { ApplicationArea = All; ToolTip = 'Invoice Reference Number.'; }
                field("Supplier Name"; Rec."Supplier Name") { ApplicationArea = All; ToolTip = 'The supplier who issued the invoice.'; }
                field("Supplier TIN"; Rec."Supplier TIN") { ApplicationArea = All; ToolTip = 'Supplier TIN.'; }
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; ToolTip = 'The customer (you).'; }
                field("Issue Date"; Rec."Issue Date") { ApplicationArea = All; ToolTip = 'Invoice issue date.'; }
                field("Payment Status"; Rec."Payment Status") { ApplicationArea = All; ToolTip = 'Payment status reported by NRS.'; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; ToolTip = 'Currency.'; }
                field("Tax Inclusive Amount"; Rec."Tax Inclusive Amount") { ApplicationArea = All; ToolTip = 'Total including VAT.'; }
                field("Payable Amount"; Rec."Payable Amount") { ApplicationArea = All; ToolTip = 'Amount payable.'; }
                field("Pulled At"; Rec."Pulled At") { ApplicationArea = All; ToolTip = 'When this invoice was pulled from NRS.'; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(PullInvoice)
            {
                ApplicationArea = All;
                Caption = 'Pull Invoice by IRN';
                ToolTip = 'Pull a signed invoice a supplier transmitted to you, by entering its IRN.';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    PullMgt: Codeunit "NRS Pull Invoice Mgt.";
                    Dlg: Page "NRS Pull Invoice Dialog";
                begin
                    if Dlg.RunModal() <> Action::OK then
                        exit;
                    if Dlg.GetIRN() = '' then
                        exit;
                    if PullMgt.PullInvoice(Dlg.GetIRN()) then
                        CurrPage.Update(false);
                end;
            }
            action(Refresh)
            {
                ApplicationArea = All;
                Caption = 'Refresh from NRS';
                ToolTip = 'Re-pull the selected invoice from NRS to update its status and details.';
                Image = RefreshLines;

                trigger OnAction()
                var
                    PullMgt: Codeunit "NRS Pull Invoice Mgt.";
                begin
                    if Rec.IRN = '' then
                        exit;
                    if PullMgt.PullInvoice(Rec.IRN) then
                        CurrPage.Update(false);
                end;
            }
        }
    }
}
