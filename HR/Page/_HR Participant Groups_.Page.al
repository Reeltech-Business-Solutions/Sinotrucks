page 54605 "HR Participant Groups"
{
    CardPageID = "HR Particpant Group";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Participant Groups';
    SourceTable = "HR Participant Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(BU; rec.BU)
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
