page 54561 "Employee Log Entries"
{
    Caption = 'Change Log Entries';
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Change Log Entries';
    UsageCategory = Lists;
    SourceTable = "Change Log Entry";
    SourceTableView = SORTING("Table No.", "Date and Time")ORDER(Descending);

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Date and Time"; Rec."Date and Time")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Table No."; Rec."Table No.")
                {
                    Lookup = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Field No."; Rec."Field No.")
                {
                    Lookup = false;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    DrillDown = false;
                    ApplicationArea = all;
                }
                field("Type of Change"; Rec."Type of Change")
                {
                    ApplicationArea = all;
                }
                field("Old Value"; Rec."Old Value")
                {
                    ApplicationArea = all;
                }
                field("Old Value Local"; rec.GetLocalOldValue)
                {
                    Caption = 'Old Value (Local)';
                    ApplicationArea = all;
                }
                field("New Value"; Rec."New Value")
                {
                    ApplicationArea = all;
                }
                field("New Value Local"; rec.GetLocalNewValue)
                {
                    Caption = 'New Value (Local)';
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("&Print")
            {
                Caption = '&Print';
                Image = Print;
                Promoted = true;
                ApplicationArea = all;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ChangeLogEntriesRep: Report "Change Log Entries";
                begin
                    ChangeLogEntriesRep.SetTableView(Rec);
                    ChangeLogEntriesRep.Run;
                end;
            }
        }
    }
}
