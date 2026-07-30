page 54597 "Hr Hmo Picture"
{
    DataCaptionFields = "First Name", "Last Name";
    PageType = Card;
    SourceTable = "HR HMO Beneficiary";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Picture 1"; Rec."Picture 1")
                {
                    ApplicationArea = all;
                }
                field("Picture 2"; Rec."Picture 2")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
