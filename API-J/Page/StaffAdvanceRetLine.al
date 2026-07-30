page 50149 "Staff Advance Ret API"
{
    PageType = API;
    SourceTable = "Staff Advan Surrender Details";
    APIGroup = 'StaffAdvRet';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    //EntityCaption = 'staffAdvanceRetLinesAPI';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';


    ODataKeyFields = SystemId;
    AutoSplitKey = true;
    //Extensible = false;
    //Editable = false;
    //InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    //  Editable = false;
                }
                field(advance_type; Rec."Imprest Type")

                {
                    //TableRelation = "Receipts and Payment Types".Code WHERE(Type = CONST(Advance));

                }
                field(no; Rec."Surrender Doc No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                // field("line_no"; Rec."Line No.")
                // {
                //     ToolTip = 'Specifies the value of the Line No. field.';
                //     ApplicationArea = All;
                // }

                // field(accountName; Rec."Account Name")
                // {
                //     Caption = 'Account Name';
                //     ApplicationArea = All;
                // }
                // field(depositAmount; Rec."Cash Receipt Amount")
                // {

                //     ApplicationArea = All;
                // }
                // field(currencyCode; Rec."Currency Code")
                // {
                //     Caption = 'Currency Code';
                //     ApplicationArea = All;
                // }
                // field(amount; Rec.Amount)
                // {
                //     Caption = 'Amount';
                //     ApplicationArea = All;
                // }
                // field(amountLCY; Rec."Amount LCY")
                // {
                //     Caption = 'Amount LCY';
                //     ApplicationArea = All;
                // }
                // field(dueDate; Rec."Due Date")
                // {
                //     Caption = 'Due Date';
                //     ApplicationArea = All;
                // }
                field(actual_amount_spent; Rec."Actual Spent")
                {

                }
                // field(dateIssued; Rec."Date Issued")
                // {
                //     Caption = 'Date Issued';
                //     ApplicationArea = All;
                // }

                // field(shortcutDimension2Code; Rec."Shortcut Dimension 2 Code")
                // {
                //     Caption = 'Shortcut Dimension 2 Code';
                //     ApplicationArea = All;
                // }
                // field(shortcutDimension3Code; Rec."Shortcut Dimension 3 Code")
                // {
                //     Caption = 'Shortcut Dimension 3 Code';
                //     ApplicationArea = All;
                // }


                field("header_id"; Rec."Header Id")
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
        StaffAdvHeader: Record "Staff Advanc Surrender Header";
        StaffAdvLine: Record "Staff Advan Surrender Details";
        StaffAdvanceLines: Record "Staff Advance Lines";
        RecPay: Record "Receipts and Payment Types";
    begin
        if IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."Surrender Doc No." := StaffAdvHeader."No.";
            StaffAdvLine.SetRange("Surrender Doc No.", Rec."Surrender Doc No.");
            if StaffAdvLine.FindLast() then
                Rec."Line No." := StaffAdvLine."Line No." + 10000
            else
                Rec."Line No." := 10000;
            Rec."Account Type" := Rec."Account Type"::"Employee";

            Rec."Open for Overexpenditure by" := UserId;
            Rec."Allow Overexpenditure" := true;
            Rec."Date opened for OvExpenditure" := today;


        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StaffAdvHeader: Record "Staff Advanc Surrender Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            StaffAdvHeader.GetBySystemId(Rec."Header Id");
            Rec."Surrender Doc No." := StaffAdvHeader."No.";
            Rec."Account Type" := Rec."Account Type"::"Employee";

            Rec."Open for Overexpenditure by" := UserId;
            Rec."Allow Overexpenditure" := true;
            Rec."Date opened for OvExpenditure" := today;

            // Rec.validate("Imprest Type");

        end;
    end;







}


