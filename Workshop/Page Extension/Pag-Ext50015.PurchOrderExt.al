pageextension 50015 PurchOrderExt extends "Purchase Order"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Withholding Tax Group Code"; Rec."Withholding Tax Group Code")
            {
                ApplicationArea = All;

                trigger OnValidate()
                var
                    WHT: Record "WithHold Tax";
                begin
                    if WHT.Get(rec."Withholding Tax Group Code") then
                        rec."WHT %" := WHT.Percentage;
                end;
            }
            field("WHT %"; Rec."WHT %")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("1Posting description"; Rec."Posting Description")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
            }
        }
        addafter(Status)
        {
            field("Service Qte No."; Rec."Service Qte No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Project No."; Rec."Project No.")
            {
                ApplicationArea = All;
                Caption = 'Job No.';
            }


        }

    }
    actions
    {
        addafter("Whse. Receipt Lines")
        {
            action("Generate with-Holding Tax")
            {
                ApplicationArea = All;
                caption = 'Generate WithHolding Tax';
                Image = CalculateCost;
                promoted = true;
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
}
