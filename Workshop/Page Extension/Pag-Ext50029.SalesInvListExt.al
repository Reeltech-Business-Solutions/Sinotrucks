pageextension 50029 SalesInvListExt extends "Sales Invoice List"
{
    trigger OnOpenPage()
    begin
        Rec.SetFilter("Summary Invoice", '%1', false);
    end;
}
