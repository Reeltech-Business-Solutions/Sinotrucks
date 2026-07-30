page 54782 "HR Oral Interview Group"
{
    CardPageID = "HR Oral Interview Grp Card";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Oral Interview Group';
    SourceTable = "HR Oral Interview Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Oral Interview Category"; Rec."Oral Interview Category")
                {
                    ApplicationArea = All;
                }
                field("Oral Interview Description"; Rec."Oral Interview Description")
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
