pageextension 50049 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("due date")
        {
            field("Quote Valid Until Date"; Rec."Quote Valid Until Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
