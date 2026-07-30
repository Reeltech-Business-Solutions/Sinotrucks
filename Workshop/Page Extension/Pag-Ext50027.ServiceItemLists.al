pageextension 50027 "Service Item Lists" extends "Service Item List"
{

    layout
    {
        addafter("No.")
        {
            field(Description1; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
        addbefore(Description)
        {

            field("Flee Veht No."; Rec."Flee Veht No.")
            {
                Caption = 'Fleet No.';
                ApplicationArea = All;
                Visible = false;
            }
            field(Make; Rec.Make)
            {
                ApplicationArea = All;
            }
            field(Model; Rec.Model)
            {
                ApplicationArea = All;
            }

        }
        modify("Ship-to Code")
        {
            Visible = false;
        }
        modify("Search Description")
        {
            Visible = false;
        }
        modify("Item No.")
        {
            Visible = false;
        }
        modify("Item Description")
        {
            Visible = false;
        }
        modify("Warranty Ending Date (Labor)")
        {
            Visible = false;
        }
        modify("Warranty Ending Date (Parts)")
        {
            Visible = false;
        }
        modify("Warranty Starting Date (Labor)")
        {
            Visible = false;
        }
        modify("Warranty Starting Date (Parts)")
        {
            Visible = false;
        }
        modify("Serial No.")
        {
            Visible = false;
        }


    }
}

