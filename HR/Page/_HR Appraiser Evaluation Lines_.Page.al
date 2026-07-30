page 54562 "HR Appraiser Evaluation Lines"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Evaluations";
    SourceTableView = WHERE(Category=CONST("JOB SPECIFIC EVALUATION AREA"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000009)
            {
                ShowCaption = false;

                field(Category; rec.Category)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Group; rec.Group)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Evaluation Code"; Rec."Evaluation Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Evaluation Description"; Rec."Evaluation Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Total Target"; Rec."Total Target")
                {
                    ApplicationArea = all;
                }
                field("Achievement % (Self)."; Rec."Achievement % (Self).")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Appraisal Rating"; Rec."Appraisal Rating")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Achievement % (Manager)."; Rec."Achievement % (Manager).")
                {
                    ApplicationArea = all;
                }
                field("Appraiser Remarks"; Rec."Appraiser Remarks")
                {
                    ApplicationArea = all;
                }
                field("Mgt Review Score"; Rec."Mgt Review Score")
                {
                    ApplicationArea = all;
                }
                field("Msg Review Remarks"; Rec."Msg Review Remarks")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    var YesNo: Boolean;
    HRAppraisalEvaluations: Record "HR Appraisal Evaluations";
    HREmp: Record "HR Employees";
    HRAppraisalRatings: Record "HR Appraisal Career Dev";
    TotalScore: Decimal;
    [Scope('Cloud')]
    procedure TotScore()
    begin
    end;
}
