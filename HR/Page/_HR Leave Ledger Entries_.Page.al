page 54484 "HR Leave Ledger Entries"
{
    Caption = 'Leave Ledger Entries';
    DataCaptionFields = "Leave Period";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Leave Ledger Entries';
    SourceTable = "HR Leave Ledger Entries";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Leave Period"; Rec."Leave Period")
                {
                    ApplicationArea = all;
                }
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = all;
                }
                field("Staff Name"; Rec."Staff Name")
                {
                    ApplicationArea = all;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field("Leave Entry Type"; Rec."Leave Entry Type")
                {
                    ApplicationArea = all;
                }
                field("No. of days"; Rec."No. of days")
                {
                    ApplicationArea = all;
                }
                field("Leave Posting Description"; Rec."Leave Posting Description")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';

                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    //RunObject = Page Page544;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Navigate.SetDoc(rec."Posting Date", rec."Document No.");
                    Navigate.Run;
                end;
            }
        }
    }
    var Navigate: Page Navigate;
}
