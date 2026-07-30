report 50001 ClearLines
{
    Caption = 'ClearLines';
    ProcessingOnly = true;

    dataset
    {
        dataitem("HR Leave Reliver"; "HR Leave Reliver")
        {
            trigger OnPreDataItem()
            begin
                SetFilter("Application No.", '%1', '');
            end;
            trigger OnAfterGetRecord()
            begin
                "HR Leave Reliver".Delete();
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
