page 54780 "HR Oral Interview Template"
{
    PageType = ListPart;
    SourceTable = "HR Oral Interview Template";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Oral Interview Group"; Rec."Oral Interview Group")
                {
                    ApplicationArea = All;
                }
                field("Oral Interview Code"; Rec."Oral Interview Code")
                {
                    ApplicationArea = All;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Target Score"; Rec."Target Score")
                {
                    ApplicationArea = All;
                }
                field("Experience Level"; Rec."Experience Level")
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
