page 54500 "HR Drivers Card"
{
    PageType = Card;
    SourceTable = "HR Drivers";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = all;
                }
                field("Driver License Number"; Rec."Driver License Number")
                {
                    ApplicationArea = all;
                }
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = all;
                }
                field("Renewal Interval"; Rec."Renewal Interval")
                {
                    ApplicationArea = all;
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = all;
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = all;
                }
                field("Year Of Experience"; Rec."Year Of Experience")
                {
                    ApplicationArea = all;
                }
                field(Grade; rec.Grade)
                {
                    ApplicationArea = all;
                }
                field(Active; rec.Active)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755013; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1102755014; Notes)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
}
