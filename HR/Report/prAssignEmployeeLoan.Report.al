report 50102 prAssignEmployeeLoan
{
    ApplicationArea = All;
    Caption = 'prAssignEmployeeLoan';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(prAssignEmployeeLoan; prAssignEmployeeLoan)
        {
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
