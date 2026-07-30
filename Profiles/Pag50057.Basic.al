page 50057 "Basic"
{
    ApplicationArea = All;
    Caption = 'Inventory/Procurement';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {

            group(Control1900724808)
            {
                ShowCaption = false;

                part("User Tasks Activities"; "User Tasks Activities")
                {
                    ApplicationArea = All;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = All;
                }
                part(ApprovalsActivities; "Approvals Activities")
                {
                    ApplicationArea = Suite;
                }
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group("Purchase Req")
            {

                Caption = 'Purchase';
                group(Requisition)
                {
                    action("Purchase Requisition")
                    {
                        Caption = 'Purchase Requisition';
                        ApplicationArea = all;
                        RunObject = page "Purchase Local Req List";
                    }
                    action("Approved Purch Req")
                    {
                        ApplicationArea = All;
                        Caption = 'Approved Purchase Requisition';
                        RunObject = page "Approved Purchase Req.";
                    }
                    action("RFQ List")
                    {
                        Caption = 'RFQ List';
                        RunObject = page "RFQ List";
                        ApplicationArea = All;
                    }
                }
                group(PurchaseQuotes)
                {
                    Caption = 'Purchase Quotes';

                    action("Foreign Purchase Quotes")
                    {
                        ApplicationArea = All;
                        Caption = 'Foreign Purchase Quotes';
                        RunObject = page "Foreign Purchase Quotes";
                    }
                    action("Local Purchase Quotes")
                    {
                        ApplicationArea = All;
                        Caption = 'Local Purchase Quotes';
                        RunObject = page "Local Purchase Quote List";
                    }

                }
                group("Purchase Order")
                {
                    action(LocalPurchOrders)
                    {
                        ApplicationArea = all;
                        Caption = 'Local Purchase Orders';
                        RunObject = page "Local Purchase Order List";
                    }
                    action(ForeignPurchOrders)
                    {
                        ApplicationArea = All;
                        Caption = 'Foreign Purchase Orders';
                        RunObject = page "Foreign Purchase Order List";
                    }
                }
                group(PostedDocuments)
                {
                    Caption = 'Posted Documents';

                    action("Posted Purcahse Invoices")
                    {
                        ApplicationArea = All;
                        RunObject = page "Posted Purchase Invoices";
                    }
                    action("Posted Purch. Credit Memo")
                    {
                        ApplicationArea = All;
                        RunObject = page "Posted Purchase Credit Memos";
                    }
                }

            }
            group(Workshop)
            {
                action("Job List")
                {
                    ApplicationArea = All;
                    RunObject = page "Job List - Internal";
                }

                group("Material Issue")
                {
                    action("Job Material Request")
                    {
                        ApplicationArea = all;
                        caption = 'Job Material Request';
                        RunObject = Page "Job Material Request List";

                    }
                    action("Store Material Issue")
                    {
                        ApplicationArea = all;
                        caption = 'Store Material Issue';
                        RunObject = Page "Store Material Issue List";

                    }
                    action("Store Material Return")
                    {
                        ApplicationArea = all;
                        caption = 'Store Material Return';
                        RunObject = Page "Store Material Return List";

                    }
                }

                group("Posted Document")
                {
                    action("Posted Matrial Issue")
                    {
                        ApplicationArea = all;
                        caption = 'Posted Material Issue';
                        RunObject = Page "Posted Material Issue List";

                    }
                    action("Posted Job Material Req. List")
                    {
                        ApplicationArea = all;
                        caption = 'Posted Job Material Req. List';
                        RunObject = Page "Posted Job Material Req. List";

                    }
                    action("Posted Material Return")
                    {
                        ApplicationArea = all;
                        caption = 'Posted Material Return';
                        RunObject = Page "Posted Material Return List";
                    }
                }

            }
        }
        area(Embedding)
        {
            action(Items)
            {
                ApplicationArea = All;
                RunObject = page "Item List";
            }
            action("Vendor Local List")
            {
                RunObject = page " Vendor Local List";
                ApplicationArea = All;
            }
            action("Vendor Foreign List")
            {
                RunObject = page " Vendor Foreign List";
                ApplicationArea = All;
            }
            action("Transfer Order")
            {
                ApplicationArea = All;
                RunObject = page "Transfer Orders";
            }

        }
    }

}
