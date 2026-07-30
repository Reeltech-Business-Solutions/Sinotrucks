page 51542 "Approver User Setup List"
{
    AutoSplitKey = true;
    Caption = 'Approver User Setup';
    PageType = List;
    SourceTable = "Approval User Setup";
    SourceTableView = SORTING("Sequence No.");
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Approval Type"; rec."Approval Type")
                {
                    ApplicationArea = All;
                }
                field("Approver ID"; rec."Approver ID")
                {
                    // LookupPageID = rec."Approval User Setup N";
                    ApplicationArea = All;
                }
                field("Approver Name"; rec."Approver Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("E-Mail"; rec."E-Mail")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sequence No."; rec."Sequence No.")
                {
                    ApplicationArea = All;
                }
                field("User ID"; rec."User ID")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        rec.FILTERGROUP(2);
        rec.SETRANGE("User ID", USERID);
        rec.FILTERGROUP(0);
    end;
}

