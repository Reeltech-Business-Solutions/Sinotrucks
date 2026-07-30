pageextension 50013 PurchInvExt extends "Purchase Invoice"
{
    layout
    {
        addafter(Status)
        {
            field("Withholding Tax Group Code"; Rec."Withholding Tax Group Code")
            {
                ApplicationArea = All;
            }
            field("WHT %"; Rec."WHT %")
            {
                ApplicationArea = All;
            }
            field("Import file No."; Rec."Import file No.")
            {
                ApplicationArea = All;
            }
        }
        modify(Status)
        {
            Editable = EditStatus;
        }
    }
    actions
    {
        addlast(processing)
        {
            action("Generate with-Holding Tax")
            {
                ApplicationArea = All;
                caption = 'Generate WithHolding Tax';
                Image = CalculateCost;
                promoted = true;
                Visible = false;
                //  Enabled = checkWthTax;
                PromotedCategory = process;
                trigger OnAction()
                var
                    PurchHeader: Record "Purchase Header";
                begin

                    //  SetCheckWthTax();

                    // if not checkWthTax then begin
                    //     Message('Withholding Tax has already been generated for this document.');
                    //     exit;
                    // end;

                    PurchHeader.Get(Rec."Document Type", Rec."No.");
                    rec.witholdingTax2();
                    //   rec.updateVat();

                    // SetCheckWthTax();
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if UserSet.Get(UserId) then begin
            if UserSet."LPO Status" = false then
                EditStatus := false else
                EditStatus := true;
        end;
    end;

    local procedure SetCheckWthTax()
    var
        PurchLine: Record "Purchase Line";
        Accessories: code[20];
    begin

        PurchLine.Reset();
        PurchLine.SetRange("Document Type", Rec."Document Type");
        PurchLine.SetRange("Document No.", Rec."No.");
        PurchLine.SetRange(Type, PurchLine.Type::"Charge (Item)");
        PurchLine.SetRange("No.", Accessories);
        if PurchLine.FindFirst() then
            checkWthTax := false;
    end;

    var

        WthTax: Record "WithHold Tax";
        checkWthTax: Boolean;
        UserSet: Record "User Setup";
        EditStatus: Boolean;
}
