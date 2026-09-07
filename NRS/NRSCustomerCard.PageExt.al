pageextension 50182 "NRS Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            group(NRSEInvoicing)
            {
                Caption = 'NRS E-Invoicing';

                field("NRS Invoice Kind"; Rec."NRS Invoice Kind")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice kind for this customer (B2B, B2C, B2G, G2B). Blank falls back to B2B.';
                }
                field("NRS Business Desc."; Rec."NRS Business Desc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a short description of the customer business.';
                }
                field("NRS State Code"; Rec."NRS State Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer State - select from the NRS state list (e.g. NG-LA). Required by NRS.';
                }
                field("NRS LGA Code"; Rec."NRS LGA Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer Local Government Area - select from the NRS LGA list (e.g. NG-LA-LIS). Required by NRS.';
                }
            }
        }
    }
}
