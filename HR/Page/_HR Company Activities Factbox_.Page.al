page 54488 "HR Company Activities Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Company Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control1102755018)
            {
                ShowCaption = false;

                label(Control1102755019)
                {
                    CaptionClass = Text1;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
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
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Responsible';
                }
                field("Email Message"; Rec."Email Message")
                {
                    ApplicationArea = all;
                }
                label(Control1102755020)
                {
                    CaptionClass = Text2;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field(Costs; rec.Costs)
                {
                    ApplicationArea = all;
                }
                field("Contribution Amount (If Any)"; Rec."Contribution Amount (If Any)")
                {
                    ApplicationArea = all;
                }
                field("G/L Account No"; Rec."G/L Account No")
                {
                    ApplicationArea = all;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = all;
                }
                field("Bal. Account Type"; Rec."Bal. Account Type")
                {
                    ApplicationArea = all;
                }
                field("Bal. Account No"; Rec."Bal. Account No")
                {
                    ApplicationArea = all;
                }
                field(Posted; rec.Posted)
                {
                    ApplicationArea = all;
                }
                label(Control1102755012)
                {
                    CaptionClass = Text3;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field(Closed; rec.Closed)
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
    var Text1: Label 'Activity Description';
    Text2: Label 'Activity Cost';
    Text3: Label 'Activity Status';
}
