page 54430 "Product Stage List"
{
    ApplicationArea = All;
    Caption = 'Product Stage List';
    CardPageId = "Product Stage";
    PageType = List;
    SourceTable = "Product Stage";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Product Code"; Rec."Product Code")
                {
                    ToolTip = 'Specifies the value of the Product Code field.';
                    ApplicationArea = All;
                }
                field("Product Description"; Rec."Product Description")
                {
                    ToolTip = 'Specifies the value of the Product Description field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
