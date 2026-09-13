pageextension 50183 "NRS Posted Sales Cr.Memos" extends "Posted Sales Credit Memos"
{
    layout
    {
        addlast(Control1)
        {
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
        }
    }

    actions
    {
        addlast(processing)
        {
            action(NRSGenerateAndSignCM)
            {
                ApplicationArea = All;
                Caption = 'Generate IRN && Sign (Credit Note)';
                ToolTip = 'Generates the IRN and signs the selected credit memos with NRS as credit notes.';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    CrMemoHeader: Record "Sales Cr.Memo Header";
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                begin
                    CurrPage.SetSelectionFilter(CrMemoHeader);
                    ValidateMgt.GenerateAndValidateForSelectedCreditMemos(CrMemoHeader);
                    CurrPage.Update(false);
                end;
            }
            action(NRSGenerateIRNCM)
            {
                ApplicationArea = All;
                Caption = 'Generate NRS IRN';
                ToolTip = 'Generates the NRS IRN for the selected credit memos.';
                Image = SendElectronicDocument;

                trigger OnAction()
                var
                    CrMemoHeader: Record "Sales Cr.Memo Header";
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    CurrPage.SetSelectionFilter(CrMemoHeader);
                    if CrMemoHeader.FindSet() then
                        repeat
                            EInvoiceMgt.GenerateForCreditMemo(CrMemoHeader, false);
                        until CrMemoHeader.Next() = 0;
                    CurrPage.Update(false);
                end;
            }
            action(NRSSignCM)
            {
                ApplicationArea = All;
                Caption = 'Sign Credit Note';
                ToolTip = 'Signs the selected credit memos with NRS (requires an IRN).';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    CrMemoHeader: Record "Sales Cr.Memo Header";
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                begin
                    CurrPage.SetSelectionFilter(CrMemoHeader);
                    ValidateMgt.ValidateForSelectedCreditMemos(CrMemoHeader);
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
