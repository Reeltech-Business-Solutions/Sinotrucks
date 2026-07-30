page 54894 "HREmployee Exit Deductions"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HREmployee Exit Deductions';
    SourceTable = "HR Employee Exit Deductions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
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
