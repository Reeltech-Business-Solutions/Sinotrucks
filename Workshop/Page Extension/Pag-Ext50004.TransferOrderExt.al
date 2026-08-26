pageextension 50004 TransferOrderExt extends "transfer order"
{
    layout
    {
        addafter(Status)
        {
            field("Approval Status"; Rec."Approval Status")
            {
                ApplicationArea = All;
                Editable = EditStatus;

            }
            field("Created By"; Rec."Created By")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Created Date"; Rec."Created Date")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify(Status)
        {
            Visible = false;
        }
        modify("Direct Transfer")
        {
            Editable = false;
        }

    }
    actions
    {

        addbefore(Release)
        {
            group(Approvals)
            {
                Image = Approvals;

                action(Approval)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var

                        ApprovalType: Enum "Approval Document Type";
                        ApprovalEntries: Page "Approval Entries";

                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Transfer Header", ApprovalType::"Transfer Order", Rec."No.");
                        ApprovalEntries.Run();

                    end;

                }
                action(SendApproval)
                {
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprMgt: Codeunit "Approval Mgmt. ExtCal";
                        TransfLine: Record "Transfer Line";
                    begin
                        TransfLine.Reset();
                        TransfLine.SetRange("Document No.", Rec."No.");
                        if TransfLine.IsEmpty then
                            Error('Please fill in the details on the Lines');

                        if ApprMgt.CheckTransferOrderApprovalsWorkflowEnable(Rec) then
                            ApprMgt.OnSendTransferOrderForApproval(Rec);
                    end;
                }
                action(CancelApproval)
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approval Mgmt. ExtCal";
                    begin
                        ApprovalMgt.OnCancelTransferOrderForApproval(Rec);
                    end;
                }
            }
        }

        modify(Post)
        {
            Enabled = rec.Status = rec.Status::Released;
        }
        modify("P&osting")
        {
            Enabled = rec.Status = rec.Status::Released;
        }
        modify("Re&lease")
        {
            Visible = false;
        }
        modify("Reo&pen")
        {
            visible = false;
            trigger OnAfterAction()
            begin

                // if userset.Get(UserId) then begin
                //     if userset."Reopen Doc" = false then
                //         Error('You are not permitted to perform this action')
                //     else
                //         if Confirm('Do you want to ReOpen purchase requisition status?') then begin
                //             if Rec.status = Rec.status::Released then begin
                //                 Rec.Validate("Approval Status", Rec."Approval Status"::Open);
                //                 Rec.Modify();
                //             end;

                //         end;
                // end;
            end;
        }


    }
    trigger OnOpenPage()
    begin
        if UserSet.Get(UserId) then begin
            if UserSet."Reopen TFOrder" = false then
                EditStatus := false else
                EditStatus := true;
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        if rec."No." <> '' then begin
            if rec."Approval Status" = Rec."Approval Status"::Released then begin
                Rec.Status := Rec.Status::Released;
            end else
                rec.Status := Rec.Status::Open;
        end;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if rec."No." <> '' then begin
            if rec."Approval Status" = Rec."Approval Status"::Released then begin
                Rec.Status := Rec.Status::Released;
            end else
                rec.Status := Rec.Status::Open;
        end;
    end;

    var
        userset: record "User Setup";
        EditStatus: Boolean;
}
