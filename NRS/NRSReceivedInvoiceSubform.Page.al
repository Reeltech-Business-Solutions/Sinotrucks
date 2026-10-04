page 50495 "NRS Received Invoice Subform"
{
    Caption = 'Lines';
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = "NRS Received Invoice Line";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Item Name"; Rec."Item Name") { ApplicationArea = All; ToolTip = 'Item name.'; }
                field("Description"; Rec."Description") { ApplicationArea = All; ToolTip = 'Line description.'; }
                field("Sellers Item Id"; Rec."Sellers Item Id") { ApplicationArea = All; ToolTip = 'Seller''s item identification.'; }
                field("HSN Code"; Rec."HSN Code") { ApplicationArea = All; ToolTip = 'HSN code.'; }
                field("Product Category"; Rec."Product Category") { ApplicationArea = All; ToolTip = 'Product category.'; }
                field("Quantity"; Rec."Quantity") { ApplicationArea = All; ToolTip = 'Invoiced quantity.'; }
                field("Price Amount"; Rec."Price Amount") { ApplicationArea = All; ToolTip = 'Unit price.'; }
                field("Line Extension Amount"; Rec."Line Extension Amount") { ApplicationArea = All; ToolTip = 'Line amount.'; }
            }
        }
    }
}
