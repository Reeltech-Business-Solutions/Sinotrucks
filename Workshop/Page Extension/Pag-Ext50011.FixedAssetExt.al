pageextension 50011 FixedAssetExt extends "Fixed Asset Card"
{
    actions
    {
        addafter("Fixed &Asset")
        {
            group(RequestApprovals)
            {
                Caption = 'Request Approvals';
                action(Approvals)
                {
                    Image = Approvals;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalDocType: Enum "Approval Document Type";
                        approvalEntries: Page "Approval Entries";

                    begin
                        approvalEntries.SetRecordFilters(Database::"Fixed Asset", ApprovalDocType::"Fixed Asset", Rec."No.");
                    end;
                }
                action(SendApproval)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if ApprovalMgt.CheckFixedAssetApprovalsWorkflowEnable(Rec) then
                            ApprovalMgt.OnSendFixedAssetForApproval(Rec);
                    end;
                }
                action(CancelApproval)
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        ApprovalMgt.OnCancelFixedAssetForApproval(Rec);
                    end;
                }
            }
        }
    }
    var
        ApprovalMgt: Codeunit "Approval Mgmt. ExtCal";
}
