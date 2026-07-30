page 54482 "HR Company Activities List"
{
    CardPageID = "HR Company Activities Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Company Activities List';
    SourceTable = "HR Company Activities";
    SourceTableView = WHERE("Activity Type"=CONST(Company));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = false;
                ShowCaption = false;

                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Venue; rec.Venue)
                {
                    ApplicationArea = all;
                }
                field(Costs; rec.Costs)
                {
                    ApplicationArea = all;
                }
                field("Employee Responsible"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
                field("Activity  Status>"; rec.Status)
                {
                    Caption = 'Activity  Status';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Company Activities Factbox")
            {
                SubPageLink = Code=FIELD(Code);
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(reporting)
        {
            action("Company Activities")
            {
                Caption = 'Company Activities';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "IBS Notes 4";
                ApplicationArea = All;
            }
        }
    }
}
