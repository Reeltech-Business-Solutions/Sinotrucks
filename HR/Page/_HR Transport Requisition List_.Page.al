page 54547 "HR Transport Requisition List"
{
    CardPageID = "Hr Trasnsport Requisition Card";
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Transport Requisition";
    AdditionalSearchTerms = 'HR Transport Requisition List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    ApplicationArea = all;
                }
                field("Job Tittle"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = all;
                }
                field("Transport type"; Rec."Transport type")
                {
                    ApplicationArea = all;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = all;
                }
                field("Pickup Point"; Rec."Pickup Point")
                {
                    ApplicationArea = all;
                }
                field("From Destination"; Rec."From Destination")
                {
                    ApplicationArea = all;
                }
                field("To Destination"; Rec."To Destination")
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
