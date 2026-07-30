page 54701 "HR Appraisal Next KPI"
{
    PageType = ListPart;
    SourceTable = "HR Appraisal Goal Setting L";
    SourceTableView = WHERE("KPI Period"=CONST(Next));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Planned Targets/Objectives"; Rec."Planned Targets/Objectives")
                {
                    Caption = 'Key Result Areas';
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    Caption = 'Key Performance Indicator';
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("Measurement Criteria"; Rec."Measurement Criteria")
                {
                    Caption = 'Key performance Objective';
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("Target Score %"; Rec."Target Score %")
                {
                    Caption = 'Target Score';
                    ApplicationArea = All;
                }
                field("Agreement With Rating"; Rec."Agreement With Rating")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
