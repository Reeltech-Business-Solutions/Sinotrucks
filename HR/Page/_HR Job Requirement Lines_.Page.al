page 54479 "HR Job Requirement Lines"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Job Requirement Lines';
    SourceTable = "HR Job Requirements";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Qualification Type"; Rec."Qualification Type")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Priority; rec.Priority)
                {
                    ApplicationArea = all;
                }
                field("Class of Degree"; Rec."Class of Degree")
                {
                    ApplicationArea = all;
                }
                field("Desired Score"; Rec."Desired Score")
                {
                    ApplicationArea = all;
                }
                field("Total (Stage)Desired Score"; Rec."Total (Stage)Desired Score")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Mandatory; rec.Mandatory)
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
