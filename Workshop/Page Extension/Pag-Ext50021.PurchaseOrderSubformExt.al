pageextension 50021 PurchaseOrderSubformExt extends "Purchase Order Subform"
{
    layout
    {
        addbefore(Type)
        {
            field("Expense No."; Rec."Expense No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Qty. to Assign")
        {
            field("Service Quote No."; Rec."Service Quote No.")
            {
                ApplicationArea = All;
                Caption = 'Service Quote No.';

                trigger OnDrillDown()
                var
                    ServiceQte: Record "Service Header";
                    ServiceQtePg: Page "Service Quotes - External";
                begin
                    ServiceQte.SetRange("Document Type", ServiceQte."Document Type"::Quote);
                    ServiceQte.SetRange(ServiceQte."No.", Rec."Service Quote No.");
                    Page.Run(Page::"Service Quotes - External", ServiceQte);


                end;

            }
            field("1Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("1Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = All;
            }

        }
        addafter("Qty. Assigned")
        {
            field("PRF No."; Rec."PRF No.")
            {
                ApplicationArea = All;
            }
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
            }

            // field("VAT Bus. Posting Group1"; Rec."VAT Bus. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
            // field("VAT Prod. Posting Group1"; Rec."VAT Prod. Posting Group")
            // {
            //     ApplicationArea = All;
            // }
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;
        }
        modify("Job No.")
        {
            Visible = true;
        }
        modify("Job Task No.")
        {
            Visible = true;
        }

        modify("Gen. Bus. Posting Group")
        {
            editable = false;
        }

        modify("Gen. Prod. Posting Group")
        {
            editable = false;
        }
    }
}
