page 54720 "Tariff Codes"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Tariff Codes';
    SourceTable = "Tariff Codes";

    layout
    {
        area(content)
        {
            repeater(Control1102758000)
            {
                ShowCaption = false;

                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field(Percentage; rec.Percentage)
                {
                    ApplicationArea = all;
                }
                field("Account No."; Rec."Account No.")
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
