page 54440 "Product Stage"
{
    PageType = Card;
    SourceTable = "Product Stage";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Product Code"; rec."Product Code")
                {
                    ApplicationArea = All;
                }
                field("Product Description"; rec."Product Description")
                {
                    ApplicationArea = All;
                }
            }
            part("Product Stage Lines"; "Product Stage Lines")
            {
                SubPageLink = "Product Code"=FIELD("Product Code");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
