page 50147 "Staff Advance Lines API"
{
    APIGroup = 'StaffAdv';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    EntityCaption = 'staffAdvanceLinesAPI';
    DelayedInsert = true;
    EntityName = 'Staffadvanceline';
    EntitySetName = 'Staffadvancelines';
    PageType = API;
    SourceTable = "Staff Advance Lines";
    ODataKeyFields = SystemId;
    Extensible = false;
    //Editable = false;
    //InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    Editable = false;
                }
                field(advanceType; Rec."Advance Type")
                {
                    Caption = 'Advance Type';
                    ApplicationArea = All;
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(gLAccountNo; Rec."Account No.")
                {
                    Caption = 'Account No.';
                    ApplicationArea = All;
                }
                field(accountName; Rec."Account Name")
                {
                    Caption = 'Account Name';
                    ApplicationArea = All;
                }
                field(purpose; Rec.Purpose)
                {
                    Caption = 'Purpose';
                    ApplicationArea = All;
                }
                field(currencyCode; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ApplicationArea = All;
                }
                field(amount; Rec.Amount)
                {
                    Caption = 'Amount';
                    ApplicationArea = All;
                }
                field(amountLCY; Rec."Amount LCY")
                {
                    Caption = 'Amount LCY';
                    ApplicationArea = All;
                }
                field(dueDate; Rec."Due Date")
                {
                    Caption = 'Due Date';
                    ApplicationArea = All;
                }
                field(dateIssued; Rec."Date Issued")
                {
                    Caption = 'Date Issued';
                    ApplicationArea = All;
                }
                field(globalDimension1Code; Rec."Global Dimension 1 Code")
                {
                    Caption = 'Global Dimension 1 Code';
                    ApplicationArea = All;
                }
                field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                {
                    Caption = 'Shortcut Dimension 2 Code';
                    ApplicationArea = All;
                }
                field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ApplicationArea = All;
                }

                field(shortcutDimension7Code; Rec."Shortcut Dimension 7 Code")
                {
                    Caption = 'Shortcut Dimension 3 Code';
                    ApplicationArea = All;
                }


                field("HeaderId"; Rec."Header Id")
                {
                    Caption = 'HeaderId';
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        StaffAdvHeader: Record "Staff Advance Header";
        StaffAdvLine: Record "Staff Advance Lines";
    begin
        if IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := StaffAdvHeader."No.";
            StaffAdvLine.SetRange("No.", Rec."No.");
            if StaffAdvLine.FindLast() then
                Rec."Line No." := StaffAdvLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StaffAdvHeader: Record "Staff Advance Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."No." := StaffAdvHeader."No.";
        end;
    end;



}


