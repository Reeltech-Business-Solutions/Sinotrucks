page 54606 "HR Particpant Group"
{
    PageType = Card;
    SourceTable = "HR Participant Group";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Caption = 'No.';
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(BU; rec.BU)
                {
                    ApplicationArea = all;
                }
            }
            part(Control6; "HR Particpant Line")
            {
                SubPageLink = "Doc No"=FIELD("No.");
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
