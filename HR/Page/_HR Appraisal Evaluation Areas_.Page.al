page 54529 "HR Appraisal Evaluation Areas"
{
    CardPageID = "HR Appraisal Evaluation Area";
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Appraisal Evaluation Areas";
    AdditionalSearchTerms = 'HR Appraisal Evaluation Areas';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102760000)
            {
                Editable = true;
                ShowCaption = false;

                field("Categorize As"; Rec."Categorize As")
                {
                    ApplicationArea = all;
                }
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = all;
                }
                field(Group; rec.Group)
                {
                    ApplicationArea = all;
                }
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Include in Evaluation Form"; Rec."Include in Evaluation Form")
                {
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    Caption = 'Is For Supervisor Only';
                }
            }
        }
    }
    actions
    {
    }
    trigger OnInit()
    begin
        CurrPage.LookupMode:=true;
    end;
}
