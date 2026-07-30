page 54883 "HR Oral Evaluation Template"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Oral Evaluation Template';
    SourceTable = "HR Oral Interview Template";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Experience Level"; Rec."Experience Level")
                {
                    ApplicationArea = All;
                }
                field("Oral Interview Code"; Rec."Oral Interview Code")
                {
                    ApplicationArea = All;
                }
                field("Oral Interview Group"; Rec."Oral Interview Group")
                {
                    ApplicationArea = All;
                }
                field("Target Score"; Rec."Target Score")
                {
                    ApplicationArea = All;
                }
                field(Rating; rec.Rating)
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
