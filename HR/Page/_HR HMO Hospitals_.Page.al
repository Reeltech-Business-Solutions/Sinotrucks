page 54454 "HR HMO Hospitals"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR HMO Hospitals';
    SourceTable = "HR HMO Hospital";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Hospital Code"; Rec."Hospital Code")
                {
                    ApplicationArea = all;
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Address; rec.Address)
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
