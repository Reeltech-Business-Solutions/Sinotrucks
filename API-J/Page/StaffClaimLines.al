page 50559 "staff claim line"
{
    PageType = API;
    SourceTable = "Staff Claim Lines";
    APIGroup = 'claim';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    //EntityCaption = 'staffAdvanceRetLinesAPI';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';


    ODataKeyFields = SystemId;
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
                field(advance_type; Rec."Advance Type")

                {
                    //TableRelation = "Receipts and Payment Types".Code WHERE(Type = CONST(Advance));

                }
                field(no; Rec."no")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }

                field("description"; Rec."Account Name")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field(amount; Rec."Amount")
                {
                    trigger OnValidate()
                    begin
                        Rec."Requested Amount" := Rec."Amount";
                    end;

                }

                field("Requested_Amount"; Rec."Requested Amount")
                {

                }

                field(narration; Rec.Purpose)
                {

                }




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
        StaffClaimHeader: Record "Staff Claims Header";
        StaffClaimLine: Record "Staff Claim Lines";
        StaffAdvanceLines: Record "Staff Claim Lines";
        RecPay: Record "Receipts and Payment Types";
    begin
        if IsDeepInsert then begin
            StaffClaimHeader.GetBySystemId(Rec."Header Id");
            Rec."No" := StaffClaimHeader."No.";
            StaffClaimLine.SetRange("No", Rec."No");
            if StaffClaimLine.FindLast() then begin
                Rec."Line No." := StaffClaimLine."Line No." + 10000;
                //  Rec."Requested Amount" := Rec.Amount;
            end
            else begin
                Rec."Line No." := 10000;
                // Rec."Requested Amount" := Rec.Amount;
            end;


        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        StaffClaimHeader: Record "Staff Claims Header";
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            StaffClaimHeader.GetBySystemId(Rec."Header Id");
            Rec."No" := StaffClaimHeader."No.";
            Rec."Requested Amount" := Rec.Amount;

        end;
    end;




}


