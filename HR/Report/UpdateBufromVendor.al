report 50302 UpdateBuyfromVendor
{
    Caption = 'Update Buy From Vendor';
    ProcessingOnly = true;
    usageCategory = ReportsAndAnalysis;
    permissions = TableData "Purch. Rcpt. Line" = RIMD;


    dataset
    {
        dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
        {
            requestfilterfields = "Order No.";

            trigger OnAfterGetRecord()
            var
                purchaseReceiptHeader: Record "Purch. Rcpt. Header";
            begin
                if purchaseReceiptHeader.Get("Document No.") then begin
                    "Buy-from Vendor No." := purchaseReceiptHeader."Buy-from Vendor No.";
                    Modify(true);
                end;
            end;

            trigger OnPreDataItem()
            begin

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
