page 54465 "HR Deductions Account"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Deductions Account';
    SourceTable = "HR Deduction Account";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = all;
                }
                field(NetPay; rec.NetPay)
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
