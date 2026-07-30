page 54661 "HR HMO List"
{
    CardPageID = "HR HMO Card";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR HMO List';
    SourceTable = "HR HMO";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field(Department; rec.Department)
                {
                    ApplicationArea = all;
                }
                field("Job Level"; Rec."Job Level")
                {
                    ApplicationArea = all;
                }
                field("Number of Beneficiaries"; Rec."Number of Beneficiaries")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("HR HMO List")
            {
                Caption = 'HR HMO List';
                ApplicationArea = All;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                RunObject = Report "HR HMO List";
            }
        }
    }
}
