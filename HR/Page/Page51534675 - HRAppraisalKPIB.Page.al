page 51543 "HR Appraisal KPI B"
{
    Caption = 'Financial';
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "HR Appraisal Goal Setting L";
    SourceTableView = WHERE("Evaluation Type" = CONST(KPI),
                            "Behavioural Group" = CONST('FINANCIAL'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Behavioural Group"; rec."Behavioural Group")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Appraisal No"; rec."Appraisal No")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Appraisal Period"; rec."Appraisal Period")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Planned Targets/Objectives"; rec."Planned Targets/Objectives")
                {
                    Editable = RateEdit;
                    ApplicationArea = all;
                }
                field("Target Score %"; rec."Target Score %")
                {
                    Caption = 'Weighting %';
                    ApplicationArea = all;
                }
                field(Timing; rec.Timing)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                    Editable = RateEdit;
                    MultiLine = true;
                    Visible = true;
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
                }
                field("Self Rating"; rec."Self Rating")
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
        if rec."Submit to HR" then
            PageEditable := false
        else
            PageEditable := true;

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
        //Half:=AppraisalHalf;
        rec."Behavioural Group" := 'FINANCIAL';
    end;

    trigger OnOpenPage()
    begin
        if rec."Submit to HR" then
            PageEditable := false
        else
            PageEditable := true;

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
        HRAppraisal: Record "HR Appraisal Goal Setting H";
        FieldEdit: Boolean;
        AppraisalHalf: Option First,Second;
        HRAppraisalGoalSettingL: Record "HR Appraisal Goal Setting L";
        PageEditable: Boolean;
        RateEdit: Boolean;

    local procedure SetAppraisalHalf()
    begin
    end;
}

