page 54517 "HR Applicant Referees"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Applicant Referees";
    AdditionalSearchTerms = 'HR Applicant Referees';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field(Names; rec.Names)
                {
                    ApplicationArea = all;
                }
                field(Designation; rec.Designation)
                {
                    ApplicationArea = all;
                }
                field(Institution; rec.Institution)
                {
                    ApplicationArea = all;
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = all;
                }
                field("Telephone No"; Rec."Telephone No")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
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
