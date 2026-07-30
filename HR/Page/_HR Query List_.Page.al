page 54406 "HR Query List"
{
    CardPageID = "HR Query Card";
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Disciplinary Cases";
    AdditionalSearchTerms = 'HR Query List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Supervisor No."; rec."Supervisor No.")
                {
                    ApplicationArea = all;
                }
                field("Supervisor Name"; rec."Supervisor Name")
                {
                    ApplicationArea = all;
                }
                field("Employee No"; rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Case Number"; rec."Case Number")
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
        rec.SetFilter("User ID", UserId)end;
    var UserMgt: Codeunit "User Setup Management BR";
}
