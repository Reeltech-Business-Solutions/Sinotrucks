page 54689 "HR Appraisal Objective List"
{
    CardPageID = "HR Appraisal Objective Header";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Appraisal Objective List';
    SourceTable = "HR Appraisal Objective Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Level; rec.Level)
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
