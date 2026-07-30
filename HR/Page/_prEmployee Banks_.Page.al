page 54402 "prEmployee Banks"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prEmployee Banks";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Employee Banks';

    layout
    {
        area(content)
        {
            repeater(new)
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = all;
                }
                field("Branch Code"; Rec."Branch Code")
                {
                    ApplicationArea = all;
                }
                field(Default; rec.Default)
                {
                    ApplicationArea = all;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = all;
                }
                field(Percentage; rec.Percentage)
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
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
