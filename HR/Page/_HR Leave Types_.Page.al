page 54473 "HR Leave Types"
{
    CardPageID = "HR Leave Types Card";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Leave Types';
    SourceTable = "HR Leave Types";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
                ShowCaption = false;

                field("Code"; rec.Code)
                {
                    Style = StandardAccent;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Days; rec.Days)
                {
                    ApplicationArea = all;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                    ApplicationArea = all;
                }
                field("Inclusive of Non Working Days"; Rec."Inclusive of Non Working Days")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755003; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1102755004; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
    trigger OnInit()
    begin
        CurrPage.LookupMode:=true;
    end;
}
