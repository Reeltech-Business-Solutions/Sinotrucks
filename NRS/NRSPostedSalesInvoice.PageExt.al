pageextension 50181 "NRS Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            group(NRSEInvoicing)
            {
                Caption = 'NRS E-Invoicing';

                field("NRS IRN Status"; Rec."NRS IRN Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether an NRS IRN has been generated for this invoice.';
                }
                field("NRS IRN"; Rec."NRS IRN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Invoice Reference Number returned by NRS.';
                }
                field("NRS IRN Generated At"; Rec."NRS IRN Generated At")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies when the IRN was generated.';
                }
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(NRSGenerateIRNCard)
            {
                ApplicationArea = All;
                Caption = 'Generate NRS IRN';
                ToolTip = 'Generates the NRS Invoice Reference Number for this invoice.';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                    ResultStatus: Enum "NRS IRN Status";
                    OkTxt: Label 'IRN generated: %1', Comment = '%1 = IRN';
                    DupTxt: Label 'An IRN already exists for this invoice.';
                    FailTxt: Label 'IRN generation failed. See the NRS IRN Log for details.';
                begin
                    ResultStatus := EInvoiceMgt.GenerateForInvoice(Rec, true);
                    CurrPage.Update(false);
                    case ResultStatus of
                        ResultStatus::Generated:
                            Message(OkTxt, Rec."NRS IRN");
                        ResultStatus::Duplicate:
                            Message(DupTxt);
                        else
                            Message(FailTxt);
                    end;
                end;
            }
            action(NRSGenerateQRCard)
            {
                ApplicationArea = All;
                Caption = 'Generate NRS QR Code';
                ToolTip = 'Generates the NRS QR code for this invoice.';
                Image = Purchasing;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                    OkTxt: Label 'QR code generated successfully.';
                    FailTxt: Label 'QR code generation failed. See the NRS IRN Log for details.';
                begin
                    if EInvoiceMgt.GenerateQRForInvoice(Rec) then begin
                        Message(OkTxt);
                        EInvoiceMgt.ShowQRForInvoice(Rec);
                    end else
                        Message(FailTxt);
                end;
            }
            action(NRSShowQRCard)
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
            action(NRSGenerateAndValidateCard)
            {
                ApplicationArea = All;
                Caption = 'Generate IRN && Validate';
                ToolTip = 'Generates the IRN and validates this invoice in one step.';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                    ResultStatus: Enum "NRS Validation Status";
                    OkTxt: Label 'IRN generated and invoice validated successfully.';
                    FailTxt: Label 'Generate + Validate did not complete. See the NRS IRN Log for details.';
                begin
                    ResultStatus := ValidateMgt.GenerateAndValidateForInvoice(Rec);
                    CurrPage.Update(false);
                    if ResultStatus = ResultStatus::Validated then
                        Message(OkTxt)
                    else
                        Message(FailTxt);
                end;
            }
            action(NRSValidateCard)
            {
                ApplicationArea = All;
                Caption = 'Validate NRS Invoice';
                ToolTip = 'Validates this invoice against NRS (UBL) before transmission.';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                    ResultStatus: Enum "NRS Validation Status";
                    OkTxt: Label 'Invoice validated successfully.';
                    FailTxt: Label 'Validation failed. See the NRS IRN Log for details.';
                begin
                    ResultStatus := ValidateMgt.ValidateForInvoice(Rec);
                    if ResultStatus = ResultStatus::Validated then
                        Message(OkTxt)
                    else
                        Message(FailTxt);
                end;
            }
            action(NRSViewLogCard)
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
}
