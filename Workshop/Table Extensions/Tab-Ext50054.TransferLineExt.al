tableextension 50054 "Transfer LineExt" extends "Transfer Line"
{
    fields
    {

        field(50000; "Quantity in Inventory"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("Item No."), "Location Code" = FIELD("Transfer-from Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "Location Code"; Code[50])
        {

        }

    }


}
