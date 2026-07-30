page 54957 "HR Exit Interview Template"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Exit Interview Template';
    SourceTable = "HR Exit Interview Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field(Question; rec.Question)
                {
                    ApplicationArea = all;
                }
                field(Segment; rec.Segment)
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
