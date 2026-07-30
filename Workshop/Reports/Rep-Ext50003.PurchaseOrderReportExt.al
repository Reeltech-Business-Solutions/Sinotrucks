reportextension 50003 PurchaseOrderReportExt extends "Order"
{
    dataset
    {
        add("Purchase Header")
        {
            column(CompanyInfo1; CompanyInfo1.Picture)
            {

            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo1.Get();
        CompanyInfo1.CalcFields(Picture);
    end;

    var
        CompanyInfo1: Record "Company Information";
}
