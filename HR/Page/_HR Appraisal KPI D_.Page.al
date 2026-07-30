page 54677 "HR Appraisal KPI D"
{
    DeleteAllowed = true;
    ApplicationArea = All;
    PageType = ListPart;
    SourceTable = "HR Appraisal Goal Setting L";
    SourceTableView = WHERE("Evaluation Type" = CONST(KPI), "Behavioural Group" = CONST('INTERNAL PROCESS'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Behavioural Group"; Rec."Behavioural Group")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Appraisal No"; Rec."Appraisal No")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Planned Targets/Objectives"; Rec."Planned Targets/Objectives")
                {
                    Editable = RateEdit;
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    Editable = RateEdit;
                    MultiLine = true;
                    ApplicationArea = all;
                    Visible = true;
                }
                field(Timing; rec.Timing)
                {
                    ApplicationArea = all;
                }
                field("Target Score %"; Rec."Target Score %")
                {
                    ApplicationArea = all;
                }
                field(Ratings; rec.Ratings)
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                field(Score; rec.Score)
                {
                    ApplicationArea = all;
                }
                field(Weight; rec.Weight)
                {
                    Caption = 'Supervisor Score';
                    Editable = false;
                    ApplicationArea = all;
                    Visible = true;
                }
                field("Self Rating"; Rec."Self Rating")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnInit()
    begin
        RateEdit := TRUE;
    end;

    trigger OnAfterGetRecord()
    begin
        if rec."Appraisal No" <> '' then begin
            HRAppraisal.Get(rec."Appraisal No");
            if HRAppraisal.Status <> HRAppraisal.Status::Open then begin
                //IF (HRAppraisal.Status <> HRAppraisal.Status::"Pending Approval") OR (HRAppraisal.Status <> HRAppraisal.Status::Open) THEN BEGIN
                FieldEdit := true;
                RateEdit := false;
            end
            else begin
                FieldEdit := false;
                RateEdit := true;
            end;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Evaluation Type" := rec."Evaluation Type"::KPI;
        rec."Behavioural Group" := 'INTERNAL PROCESS';
    end;

    trigger OnOpenPage()
    begin
        if rec."Appraisal No" <> '' then begin
            HRAppraisal.Get(rec."Appraisal No");
            if HRAppraisal.Status <> HRAppraisal.Status::Open then begin
                FieldEdit := true;
                RateEdit := false;
            end
            else begin
                FieldEdit := false;
                RateEdit := true;
            end;
        end;
    end;

    var
        AppraisalHalf: Option First,Second;
        HRAppraisalGoalSettingL: Record "HR Appraisal Goal Setting L";
        HRAppraisal: Record "HR Appraisal Goal Setting H";
        FieldEdit: Boolean;
        RateEdit: Boolean;

    local procedure SetAppraisalHalf()
    begin
    end;
}
