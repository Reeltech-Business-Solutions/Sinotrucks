page 54631 "HR Employees External Loans"
{
    CardPageID = "HR Employee External Loan";
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Employees External Loans';
    UsageCategory = Lists;
    SourceTable = "HR Employee Loan Ext";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field(Current; rec.Current)
                {
                    ApplicationArea = all;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = all;
                }
                field("Monthly Repayment"; Rec."Monthly Repayment")
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; Rec."End Date")
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
