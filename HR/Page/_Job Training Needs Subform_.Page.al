page 54586 "Job Training Needs Subform"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Jobx Training Needs";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Job Training Needs Subform';

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
