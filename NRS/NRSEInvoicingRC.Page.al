page 50384 "NRS E-Invoicing RC"
{
    Caption = 'NRS E-Invoicing';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Activities; "NRS Activities")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Embedding)
        {
            action(PostedSalesInvoices)
            {
                ApplicationArea = All;
                Caption = 'Posted Sales Invoices';
                ToolTip = 'Open posted sales invoices and generate IRNs.';
                RunObject = page "Posted Sales Invoices";
                Image = Invoice;
            }
            action(EInvoices)
            {
                ApplicationArea = All;
                Caption = 'NRS E-Invoices';
                ToolTip = 'Browse all e-invoices, edit statuses, and open each as an invoice card.';
                RunObject = page "NRS E-Invoices";
                Image = Invoice;
            }
            action(IRNLog)
            {
                ApplicationArea = All;
                Caption = 'NRS IRN Log';
                ToolTip = 'Review every IRN generation attempt.';
                RunObject = page "NRS IRN Log";
                Image = Log;
            }
        }
        area(Sections)
        {
            group(Setup)
            {
                Caption = 'Setup';

                action(NRSSetupAction)
                {
                    ApplicationArea = All;
                    Caption = 'NRS Setup';
                    ToolTip = 'Configure NRS credentials and endpoint.';
                    RunObject = page "NRS Setup";
                    Image = Setup;
                }
                action(ItemCategoryMapAction)
                {
                    ApplicationArea = All;
                    Caption = 'NRS Item Category Mapping';
                    ToolTip = 'Map each BC item category (TRUCK, SPARE PART, LUBRICANT, ...) to its HSN/ISIC classification.';
                    RunObject = page "NRS Item Category Map";
                    Image = ItemGroup;
                }
            }
        }
        area(Processing)
        {
            action(OpenSetup)
            {
                ApplicationArea = All;
                Caption = 'NRS Setup';
                ToolTip = 'Configure NRS credentials and endpoint.';
                RunObject = page "NRS Setup";
                Image = Setup;
            }
        }
    }
}
