page 54657 "HR Canteen App List Self"
{
    Caption = 'HR Meal Ticket  List';
    CardPageID = "HR Canteen Application Card";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Hr Canteen Application";
    AdditionalSearchTerms = 'HR Meal Ticket  List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Ticket No."; Rec."Ticket No.")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = all;
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = all;
                }
                field("Visitor Name"; Rec."Visitor Name")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field(Posted; rec.Posted)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        rec.SetFilter("User ID", UserId);
    end;
}
