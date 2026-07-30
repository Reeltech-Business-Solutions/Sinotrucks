page 54692 "HR Staff Activities List"
{
    CardPageID = "HR Staff Activities";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Company Activities";
    SourceTableView = WHERE("Activity Type"=CONST(Staff));
    AdditionalSearchTerms = 'HR Staff Activities List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
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
                field(Subject; rec.Subject)
                {
                    ApplicationArea = all;
                }
            }
            systempart(Control8; MyNotes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        rec.FilterGroup(2);
        rec.SetFilter("Created By", UserId);
        rec.FilterGroup(0);
    end;
}
