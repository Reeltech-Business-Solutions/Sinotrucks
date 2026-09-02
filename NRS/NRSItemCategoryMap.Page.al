page 50388 "NRS Item Category Map"
{
    Caption = 'NRS Item Category Mapping';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "NRS Item Category Map";

    layout
    {
        area(Content)
        {
            repeater(Mapping)
            {
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Business Central item category (e.g. TRUCK, SPARE PART, LUBRICANT).';
                }
                field("HSN Code"; Rec."HSN Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the HSN code sent for goods in this category (e.g. 8704 for trucks, 8708 for spare parts).';
                }
                field("Product Category"; Rec."Product Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the product category sent for items in this category.';
                }
                field("ISIC Code"; Rec."ISIC Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Optional: ISIC code, if items in this category should be classified as a service.';
                }
                field("Service Category"; Rec."Service Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Optional: service category, if items in this category should be classified as a service.';
                }
            }
        }
    }
}
