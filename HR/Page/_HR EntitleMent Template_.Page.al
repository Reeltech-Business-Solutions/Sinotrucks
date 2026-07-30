page 54423 "HR EntitleMent Template"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR EntitleMent Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field(Question; rec.Question)
                {
                    ApplicationArea = all;
                }
                field("Question Header"; Rec."Question Header")
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
