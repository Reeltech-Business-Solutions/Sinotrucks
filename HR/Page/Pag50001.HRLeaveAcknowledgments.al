page 54663 "HR Leave Acknowledgments"
{
    CardPageID = "HR Leave Acknowledgement";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Leave Acknowledgments';
    SourceTable = "HR Leave Acknowledgement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("Leave No."; Rec."Leave No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
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


