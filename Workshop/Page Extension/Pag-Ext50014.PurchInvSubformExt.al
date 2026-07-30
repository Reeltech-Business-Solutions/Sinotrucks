pageextension 50014 PurchInvSubformExt extends "Purch. Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Withholding Tax Group Code"; Rec."Withholding Tax Group Code")
            {
                ApplicationArea = All;
            }
            field("Import file No."; Rec."Import file No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
