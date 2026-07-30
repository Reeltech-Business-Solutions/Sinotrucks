page 54674 "HR Appraisal Behavioural A"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "HR Appraisal Goal Setting L";
    SourceTableView = WHERE("Evaluation Type"=CONST(Behavioural));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Behavioural Group"; Rec."Behavioural Group")
                {
                    Editable = false;
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
                    Editable = FieldEdit;
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    Editable = FieldEdit;
                    ApplicationArea = all;
                }
                field(Timing; rec.Timing)
                {
                    Editable = FieldEdit;
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Weight; rec.Weight)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Actual Results (Self)"; Rec."Actual Results (Self)")
                {
                    Editable = FieldEdit;
                    ApplicationArea = all;
                }
                field("Agreed Score"; Rec."Agreed Score")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnAfterGetRecord()
    begin
        if rec."Appraisal No" <> '' then begin
            HRAppraisal.Get(rec."Appraisal No");
            if HRAppraisal.Status <> HRAppraisal.Status::Open then FieldEdit:=false
            else
                FieldEdit:=true;
        end;
    end;
    trigger OnOpenPage()
    begin
        if rec."Appraisal No" <> '' then begin
            HRAppraisal.Get(rec."Appraisal No");
            if HRAppraisal.Status <> HRAppraisal.Status::Open then FieldEdit:=false
            else
                FieldEdit:=true;
        end;
    end;
    var HRAppraisal: Record "HR Appraisal Goal Setting H";
    FieldEdit: Boolean;
}
