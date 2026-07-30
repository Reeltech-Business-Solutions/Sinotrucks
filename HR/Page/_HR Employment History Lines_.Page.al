page 54520 "HR Employment History Lines"
{
    Caption = 'Employment History Lines';
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Employment History Lines';
    SourceTable = "HR Employment History";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = all;
                }
                field(From; rec.From)
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Key Experience"; Rec."Key Experience")
                {
                    ApplicationArea = all;
                }
                field("Salary On Leaving"; Rec."Salary On Leaving")
                {
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = all;
                }
                field("Reason For Leaving"; Rec."Reason For Leaving")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
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
