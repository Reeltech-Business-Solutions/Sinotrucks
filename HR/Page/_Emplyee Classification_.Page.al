page 54940 "Emplyee Classification"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "Employee Class";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Employee Classification';

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
