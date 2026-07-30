pageextension 50016 TransferOrderListExt extends "Transfer Orders"
{
    actions
    {
        modify("P&osting")
        {
            Enabled = rec.Status = Rec.Status::Released;
        }
        modify("Re&lease")
        {
            Visible = false;
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetSecurityFilterOnRespCenter();
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
}
