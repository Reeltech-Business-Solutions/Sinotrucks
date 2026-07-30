page 54499 "HR Drivers List"
{
    CardPageID = "HR Drivers Card";
    InsertAllowed = true;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Drivers List';
    SourceTable = "HR Drivers";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

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
            systempart(Control1102755004; Outlook)
            {
                ApplicationArea = all;
            }
            systempart(Control1102755006; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
