pageextension 50183 "NRS Item Card" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            group(NRSEInvoicing)
            {
                Caption = 'NRS E-Invoicing';

                field("NRS HSN Code"; Rec."NRS HSN Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Harmonized System of Nomenclature (HSN) code for this item.';
                }
                field("NRS Product Category"; Rec."NRS Product Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product category this item belongs to.';
                }
                field("NRS ISIC Code"; Rec."NRS ISIC Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the International Standard Industry Classification (ISIC) code.';
                }
                field("NRS Service Category"; Rec."NRS Service Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the service category, ensuring accurate ISIC categorization.';
                }
            }
        }
    }
}
