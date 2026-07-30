page 54565 "HR Appraisal Evaluation Area"
{
    PageType = Document;
    SourceTable = "HR Appraisal Evaluation Areas";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Group; rec.Group)
                {
                    ApplicationArea = all;
                }
                field("Sub Category"; Rec."Sub Category")
                {
                    ApplicationArea = all;
                }
                field("Assign To"; Rec."Assign To")
                {
                    ApplicationArea = all;
                }
            }
            part(Control1102755005; "HR Appraisal Evaluation Descri")
            {
                SubPageLink = "Evaluation Area"=FIELD(Code);
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
