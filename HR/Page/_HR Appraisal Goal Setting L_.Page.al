page 54527 "HR Appraisal Goal Setting L"
{
    Editable = true;
    PageType = ListPart;
    SourceTable = "HR Appraisal Goal Setting L";
    SourceTableView = WHERE("KPI Period"=CONST(Current));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Serial No."; Rec."Serial No.")
                {
                    Caption = 'Serial No';
                    ApplicationArea = all;
                }
                field("Planned Targets/Objectives"; Rec."Planned Targets/Objectives")
                {
                    MultiLine = true;
                    ApplicationArea = all;
                    ToolTip = 'The Relevant Objectives of the BU or Department';
                }
                field(Description; rec.Description)
                {
                    MultiLine = true;
                    ApplicationArea = all;
                    ToolTip = 'Specific Summary of the Individual Objective- What Success will look like.';
                }
                field("Measurement Criteria"; Rec."Measurement Criteria")
                {
                    ApplicationArea = all;
                    Caption = 'Measurement of Success';
                    MultiLine = true;
                }
                field("Key Outputs"; Rec."Key Outputs")
                {
                    ApplicationArea = all;
                }
                field("KPI Period"; Rec."KPI Period")
                {
                    ApplicationArea = all;
                }
                field(Timing; rec.Timing)
                {
                    ApplicationArea = all;
                }
                field(Weight; rec.Weight)
                {
                    ApplicationArea = all;
                }
                field("Actual Results (Self)"; Rec."Actual Results (Self)")
                {
                    ApplicationArea = all;
                }
                field("Actual Results (Manager)"; Rec."Actual Results (Manager)")
                {
                    ApplicationArea = all;
                }
                field("Manager Score"; Rec."Manager Score")
                {
                    ApplicationArea = all;
                }
                field("Agreement With Rating"; Rec."Agreement With Rating")
                {
                    ApplicationArea = all;
                    Editable = "Agreement With RatingEditable";
                }
                field("Achievement % (Self)"; Rec."Achievement % (Self)")
                {
                    ApplicationArea = all;
                    Editable = ScoreVisible;
                }
                field("Agreed Score"; Rec."Agreed Score")
                {
                    ApplicationArea = all;
                }
                field("Appraiser Remarks"; Rec."Appraiser Remarks")
                {
                    ApplicationArea = all;
                    Caption = 'Manager''s Remarks';
                }
                field("Target Score %"; Rec."Target Score %")
                {
                    ApplicationArea = all;
                }
                field("Achievement % (Self)."; Rec."Achievement % (Self).")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Rating"; Rec."Appraisal Rating")
                {
                    ApplicationArea = all;
                }
                field("Achievement % (Manager)."; Rec."Achievement % (Manager).")
                {
                    ApplicationArea = all;
                }
                field("Mgt Review Score"; Rec."Mgt Review Score")
                {
                    ApplicationArea = all;
                }
                field(TotalWeighting; rec.TotalWeighting)
                {
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
        "Agreement With RatingEditable":=true;
        ScoreVisible:=true;
        "Appraisal RatingVisible":=true;
    end;
    trigger OnOpenPage()
    begin
        HRAppraisalGoalSettingH.SetRange("Appraisal No", rec."Appraisal No");
        if HRAppraisalGoalSettingH.Find('-')then if(HRAppraisalGoalSettingH.Status = HRAppraisalGoalSettingH.Status::Open)then begin //OR (HRAppraisalGoalSettingH.Status<>HRAppraisalGoalSettingH.Status::"Pending Approval") THEN BEGIN
                "Agreement With RatingEditable":=false;
                "Appraisal RatingVisible":=false;
                ScoreVisible:=false;
            end
            else
            begin
                "Agreement With RatingEditable":=true;
            end;
    end;
    var HRAppraisalGoalSettingH: Record "HR Appraisal Goal Setting H";
    [InDataSet]
    "Appraisal RatingVisible": Boolean;
    [InDataSet]
    ScoreVisible: Boolean;
    [InDataSet]
    "Agreement With RatingEditable": Boolean;
    PageEditable: Text[20];
}
