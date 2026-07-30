page 54404 "prStaff Dimensions"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prStaff Dimensions";
    AdditionalSearchTerms = 'Staff Dimensions';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(New)
            {
                field("Employee Code"; rec."Employee Code")
                {
                    ApplicationArea = all;
                }
                field("Dimension 0"; rec."Dimension 0")
                {
                    ApplicationArea = all;
                }
                field("Dimension 1"; rec."Dimension 1")
                {
                    ApplicationArea = all;
                }
                field("Dimension 2"; rec."Dimension 2")
                {
                    ApplicationArea = all;
                }
                field("Dimension 3"; rec."Dimension 3")
                {
                    ApplicationArea = all;
                }
                field("Dimension 4"; rec."Dimension 4")
                {
                    ApplicationArea = all;
                }
                field("Dimension 5"; rec."Dimension 5")
                {
                    ApplicationArea = all;
                }
                field(Percentage; rec.Percentage)
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
