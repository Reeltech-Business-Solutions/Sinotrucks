pageextension 50180 "NRS Posted Sales Invoices" extends "Posted Sales Invoices"
{
    layout
    {
        addafter("No.")
        {
            field("NRS IRN Status"; Rec."NRS IRN Status")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies whether an NRS IRN has been generated for this invoice.';
                StyleExpr = NRSStatusStyle;
            }
            field("NRS IRN"; Rec."NRS IRN")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Invoice Reference Number returned by NRS.';
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(NRSGenerateIRN)
            {
                ApplicationArea = All;
                Caption = 'Generate NRS IRN';
                ToolTip = 'Generates NRS Invoice Reference Numbers for the selected posted invoices.';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    EInvoiceMgt.GenerateForSelected(SalesInvHeader);
                    CurrPage.Update(false);
                end;
            }
            action(NRSGenerateQR)
            {
                ApplicationArea = All;
                Caption = 'Generate NRS QR Code';
                ToolTip = 'Generates NRS QR codes for the selected posted invoices.';
                Image = Purchasing;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    EInvoiceMgt.GenerateQRForSelected(SalesInvHeader);
                    CurrPage.Update(false);
                end;
            }
            action(NRSShowQR)
            {
                ApplicationArea = All;
                Caption = 'Show NRS QR Code';
                ToolTip = 'Displays the QR code for this invoice.';
                Image = ViewDetails;

                trigger OnAction()
                var
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    EInvoiceMgt.ShowQRForInvoice(Rec);
                end;
            }
            action(NRSValidate)
            {
                ApplicationArea = All;
                Caption = 'Validate NRS Invoice';
                ToolTip = 'Validates the selected invoices against NRS (UBL) before transmission.';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                begin
                    CurrPage.SetSelectionFilter(SalesInvHeader);
                    ValidateMgt.ValidateForSelected(SalesInvHeader);
                    CurrPage.Update(false);
                end;
            }
            action(NRSViewLog)
            {
                ApplicationArea = All;
                Caption = 'NRS IRN Log';
                ToolTip = 'Opens the NRS IRN log for this invoice.';
                Image = Log;

                trigger OnAction()
                var
                    IRNLog: Record "NRS IRN Log";
                begin
                    IRNLog.SetRange("Source Table No.", Database::"Sales Invoice Header");
                    IRNLog.SetRange("Document No.", Rec."No.");
                    Page.Run(Page::"NRS IRN Log", IRNLog);
                end;
            }
        }
    }

    var
        NRSStatusStyle: Text;

    trigger OnAfterGetRecord()
    begin
        case Rec."NRS IRN Status" of
            Rec."NRS IRN Status"::Generated:
                NRSStatusStyle := 'Favorable';
            Rec."NRS IRN Status"::Failed:
                NRSStatusStyle := 'Unfavorable';
            Rec."NRS IRN Status"::Duplicate:
                NRSStatusStyle := 'Ambiguous';
            else
                NRSStatusStyle := 'Standard';
        end;
    end;
}
