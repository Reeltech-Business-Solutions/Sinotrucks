page 54647 "Payroll Classification"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Payroll Classification";
    AdditionalSearchTerms = 'Payroll Classification';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
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
