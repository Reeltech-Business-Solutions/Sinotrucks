reportextension 50004 SalesInvExt extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Header)
        {
            column(CompanyInfo; CompanyInfo.Picture)
            {

            }
            column(TotalAmount; ROUND(TotalAmountInclVAT, 1, '<'))
            {

            }
            column(Your_Reference; "Your Reference")
            {

            }
            column(Service_Vehicle; "Service Vehicle")
            {

            }
        }

    }
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);

    end;

    var
        CompanyPic: Record "Company Information";
        TotalAmount: Decimal;
}
