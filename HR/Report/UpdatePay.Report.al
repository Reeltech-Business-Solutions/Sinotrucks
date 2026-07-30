report 50115 UpdatePay
{
    Caption = 'UpdatePay';
    ProcessingOnly = true;

    dataset
    {
        dataitem("prPeriod Transactions"; "prPeriod Transactions")
        {
            trigger OnAfterGetRecord()
            begin
                DeleteAll();
            end;
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
