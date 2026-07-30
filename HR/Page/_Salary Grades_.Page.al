page 54622 "Salary Grades"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Salary Grades";
    AdditionalSearchTerms = 'Salary Grades';

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;

                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Pays NHF"; Rec."Pays NHF")
                {
                    ApplicationArea = all;
                }
                field("Pays NSITF"; Rec."Pays NSITF")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("Salary Notches")
            {
                Caption = 'Salary Notches';

                action(Notch)
                {
                    Caption = 'Notch';
                    Image = NumberGroup;
                    RunObject = Page "Salary Notches";
                    RunPageLink = "Salary Grade"=FIELD("Salary Grade");
                    ApplicationArea = All;
                }
            }
        }
    }
}
