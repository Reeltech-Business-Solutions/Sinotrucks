page 54603 "HR Appraisal Obj Template"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Appraisal Obj Template";
    AdditionalSearchTerms = 'HR Appraisal Obj Template';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Behavioural Category"; Rec."Behavioural Category")
                {
                    ApplicationArea = all;
                }
                field(Level; rec.Level)
                {
                    ApplicationArea = all;
                }
                field(Grade; rec.Grade)
                {
                    Editable = false;
                    ApplicationArea = all;
                    Caption = 'Step';
                    Visible = false;
                }
                field(Criteria; rec.Criteria)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Weigthed Score"; Rec."Weigthed Score")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
