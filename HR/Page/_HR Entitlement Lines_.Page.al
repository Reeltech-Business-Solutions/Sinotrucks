page 54415 "HR Entitlement Lines"
{
    PageType = ListPart;
    SourceTable = "HR Entitlement Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; rec."Application No.")
                {
                    ApplicationArea = all;
                }
                field(Question; rec.Question)
                {
                    ApplicationArea = all;
                }
                field("Yes/No"; rec."Yes/No")
                {
                    ApplicationArea = all;
                }
                field(Option; rec.Option)
                {
                    ApplicationArea = all;
                }
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = all;
                }
                field("Question Header"; rec."Question Header")
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
