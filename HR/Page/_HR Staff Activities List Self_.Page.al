page 54696 "HR Staff Activities List Self"
{
    CardPageID = "HR Staff Activities";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Company Activities";
    SourceTableView = WHERE("Activity Type"=CONST(Staff));
    AdditionalSearchTerms = 'HR Staff Activities List Self';

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
    /*FILTERGROUP(2);
        SETFILTER("Created By",USERID);
        FILTERGROUP(0);
         */
    end;
}
