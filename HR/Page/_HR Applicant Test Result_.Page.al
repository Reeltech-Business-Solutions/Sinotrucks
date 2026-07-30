page 54412 "HR Applicant Test Result"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Applicant Test Details";
    AdditionalSearchTerms = 'HR Applicant Test Result';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Test Code"; rec."Test Code")
                {
                    ApplicationArea = all;
                }
                field("Applicant No."; rec."Applicant No.")
                {
                    ApplicationArea = all;
                }
                field("Requisition No."; rec."Requisition No.")
                {
                    ApplicationArea = all;
                }
                field(Score; rec.Score)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Import Applicant Test Score")
            {
                Caption = 'Import Applicant Test Score';
                ApplicationArea = All;
                Promoted = true;
            ///RunObject = XMLport "Import Applicant Score";RBS Dennis 


            }
        }
    }
}
