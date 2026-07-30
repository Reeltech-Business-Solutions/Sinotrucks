page 54698 "HR Job Working Relationship"
{
    Editable = true;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR Job Working Relationship';
    SourceTable = "HR Job Working Relationship";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Working Relationship Code"; Rec."Working Relationship Code")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = all;
                }
                field("No. of Occupants"; Rec."No. of Occupants")
                {
                    ApplicationArea = all;
                }
                field("Vacant Position"; Rec."Vacant Position")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
