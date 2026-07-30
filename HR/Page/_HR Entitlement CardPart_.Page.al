page 54422 "HR Entitlement CardPart"
{
    PageType = CardPart;
    SourceTable = "HR Entitlement Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = all;
            }
            field("Application No."; Rec."Application No.")
            {
                ApplicationArea = all;
                Visible = false;
            }
            field(Answer; rec.Answer)
            {
                MultiLine = true;
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
}
