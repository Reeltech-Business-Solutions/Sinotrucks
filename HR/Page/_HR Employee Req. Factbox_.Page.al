page 54492 "HR Employee Req. Factbox"
{
    PageType = ListPart;
    SourceTable = "HR Jobs";
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            field("Job ID"; Rec."Job ID")
            {
                ApplicationArea = all;
            }
            field("No of Posts"; Rec."No of Posts")
            {
                ApplicationArea = all;
            }
            field("Position Reporting to"; Rec."Position Reporting to")
            {
                ApplicationArea = all;
            }
            field("Occupied Positions"; Rec."Occupied Positions")
            {
                ApplicationArea = all;
            }
            field("Vacant Positions"; Rec."Vacant Positions")
            {
                ApplicationArea = all;
            }
            field(Category; rec.Category)
            {
                ApplicationArea = all;
            }
            field(Grade; rec.Grade)
            {
                ApplicationArea = all;
            }
            field("Employee Requisitions"; Rec."Employee Requisitions")
            {
                ApplicationArea = all;
            }
            field("Supervisor Name"; Rec."Supervisor Name")
            {
                ApplicationArea = all;
            }
            //field(Status; rec."Global Dimension 2 Code"Status)
            //{
            //ApplicationArea = all;
            // }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
}
