pageextension 50184 "NRS Posted Sales Cr.Memo" extends "Posted Sales Credit Memo"
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
                    ToolTip = 'Specifies whether an NRS IRN has been generated for this credit memo.';
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
                field("NRS Original Invoice No."; Rec."NRS Original Invoice No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the original posted invoice this credit note corrects. Its IRN is sent to NRS as the billing_reference. Use the "Set Original Invoice" action to change it.';
                }
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action(NRSSetOriginalCM)
            {
                ApplicationArea = All;
                Caption = 'Set Original Invoice';
                ToolTip = 'Sets the original posted invoice this credit note corrects (used for the NRS billing_reference).';
                Image = LinkWeb;

                trigger OnAction()
                var
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                    Dlg: Page "NRS Note Details";
                    DummyType: Enum "NRS Document Type";
                begin
                    // ShowDocType=false, so the document-type value is ignored for credit memos.
                    Dlg.InitDialog(false, DummyType, Rec."NRS Original Invoice No.");
                    if Dlg.RunModal() = Action::OK then begin
                        EInvoiceMgt.SetCreditMemoOriginal(Rec, Dlg.GetOrigNo());
                        CurrPage.Update(false);
                    end;
                end;
            }
            action(NRSGenerateIRNCMCard)
            {
                ApplicationArea = All;
                Caption = 'Generate NRS IRN';
                ToolTip = 'Generates the NRS Invoice Reference Number for this credit memo.';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    EInvoiceMgt.GenerateForCreditMemo(Rec, true);
                    CurrPage.Update(false);
                end;
            }
            action(NRSGenerateAndSignCMCard)
            {
                ApplicationArea = All;
                Caption = 'Generate IRN && Sign (Credit Note)';
                ToolTip = 'Generates the IRN and signs this credit memo with NRS as a credit note.';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                    ResultStatus: Enum "NRS Validation Status";
                    OkTxt: Label 'IRN generated and credit note signed successfully.';
                    FailTxt: Label 'Generate + Sign did not complete. See the NRS IRN Log for details.';
                begin
                    ResultStatus := ValidateMgt.GenerateAndValidateForCreditMemo(Rec);
                    CurrPage.Update(false);
                    if ResultStatus = ResultStatus::Validated then
                        Message(OkTxt)
                    else
                        Message(FailTxt);
                end;
            }
            action(NRSSignCMCard)
            {
                ApplicationArea = All;
                Caption = 'Sign Credit Note';
                ToolTip = 'Signs this credit memo with NRS (requires an IRN).';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                    ResultStatus: Enum "NRS Validation Status";
                    OkTxt: Label 'Credit note signed successfully.';
                    FailTxt: Label 'Signing failed. See the NRS IRN Log for details.';
                begin
                    ResultStatus := ValidateMgt.ValidateForCreditMemo(Rec);
                    if ResultStatus = ResultStatus::Validated then
                        Message(OkTxt)
                    else
                        Message(FailTxt);
                end;
            }
        }
    }
}
