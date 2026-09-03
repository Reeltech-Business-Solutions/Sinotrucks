pageextension 50182 "NRS Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            group(NRSEInvoicing)
            {
                Caption = 'NRS E-Invoicing';

                field("NRS TIN"; Rec."NRS TIN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer TIN (or RN-<incorporation> in B2B when no TIN yet).';
                }
                field("NRS Email"; Rec."NRS Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer email used on the e-invoice.';
                }
                field("NRS Invoice Kind"; Rec."NRS Invoice Kind")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the invoice kind for this customer (B2B, B2C, B2G, G2B). Blank uses the setup default.';
                }
                field("NRS Business Desc."; Rec."NRS Business Desc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a short description of the customer business.';
                }
                field("NRS LGA Code"; Rec."NRS LGA Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer Local Government Area (e.g. NG-FC-AML). Required by the Validate endpoint.';
                }
                field("NRS State Code"; Rec."NRS State Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer State (e.g. NG-FC). Required by the Validate endpoint.';
                }
                field("NRS Country Code"; Rec."NRS Country Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the country code for the customer address (e.g. NG).';
                }
            }
        }
    }
}
