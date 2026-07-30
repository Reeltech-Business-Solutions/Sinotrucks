report 50101 "prStaff Pension Balance"
{
    Caption = 'prStaff Pension Balance';

    dataset
    {
        dataitem(HREmployee; "HR-Employee")
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
