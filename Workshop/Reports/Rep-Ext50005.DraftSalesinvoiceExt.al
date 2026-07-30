reportextension 50005 DraftSalesinvoiceExt extends "Standard Sales - Draft Invoice"
{
    dataset
    {
        add(Totals)
        {
            column(TotalAmount; ROUND(TotalAmountInclVAT, 1, '<'))
            {

            }

        }

    }


    var
        TotalAmount: Decimal;
}
