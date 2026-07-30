page 54510 "HR Applicant Qualifications"
{
    Caption = 'Applicant Qualifications';
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Applicant Qualifications';
    SaveValues = true;
    ShowFilter = true;
    SourceTable = "HR Applicant Qualifications";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = all;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Course of Study"; Rec."Course of Study")
                {
                    ApplicationArea = all;
                    Caption = 'Course of Study';
                }
                field("Class of Degree"; Rec."Class of Degree")
                {
                    ApplicationArea = all;
                }
                field("Score ID"; Rec."Score ID")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
            }
        }
    }
    actions
    {
    }
}
