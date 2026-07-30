page 50106 "Workshop/Rolecenter"
{
    ApplicationArea = All;
    Caption = 'Workshop/Procurement';
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
        area(sections)
        {
            group("Purchase")
            {
                group(Requisition)
                {
                    action("Purchase Local Req")
                    {
                        Caption = 'Purchase Requisition';
                        RunObject = page "Purchase Local Req List";
                        ApplicationArea = All;
                    }

                    action("Purchase Foreign Req List")
                    {
                        Caption = 'Purchase Requisition(Foreign)';
                        RunObject = page "Purchase Foreign Req List";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Approved Purchase Requisition")
                    {
                        RunObject = page "Approved Purchase Req.";
                        ApplicationArea = All;
                    }
                    action("RFQ List")
                    {
                        Caption = 'RFQ List';
                        RunObject = page "RFQ List";
                        ApplicationArea = All;
                    }
                    action("Purchase Requisition Archives")
                    {
                        Caption = 'Purchase Requisition Archives';
                        RunObject = page "Purchase Requisition Archives";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Approved Req-PRO")
                    {
                        Caption = 'Purchase Requisition Approved List';
                        RunObject = page "Approved Req-PRO";
                        ApplicationArea = All;
                        Visible = false;
                    }

                }
                group(Quotes1)
                {
                    Caption = 'Purchase Quote';
                    action("Local Purchase Quote")
                    {
                        RunObject = page "Local Purchase Quote List";
                        ApplicationArea = All;
                    }
                    action("Foreign Purchase Quote")
                    {
                        RunObject = page "Foreign Purchase Quotes";
                        ApplicationArea = All;
                    }
                    action("All Purchase Quote")
                    {
                        RunObject = page "Purchase Quotes";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Quotation Request Vendor")
                    {
                        RunObject = page "Quotation Request Vendors";
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
                group("Purchase Order")
                {
                    action("Local Purchases")
                    {
                        Caption = 'Local Purchase Order';
                        RunObject = page "Local Purchase Order List";
                        ApplicationArea = All;
                    }
                    action("Foreign Purchase List")
                    {
                        Caption = 'Foreign Purchases';
                        RunObject = page "Foreign Purchase Order List";
                        ApplicationArea = All;
                    }
                }

            }
            group("Workshop Management")
            {
                Caption = 'WORKSHOP';
                action("Service Item List")
                {

                    RunObject = page "Service Item List";
                    ApplicationArea = All;
                }

                action("Vehicle Registration")
                {
                    RunObject = page "Vehicle Registration List";
                    ApplicationArea = All;
                }

                group("Service Quote")
                {
                    action("Service Quotes - External")
                    {
                        RunObject = page "Service Quotes - External";
                        Caption = 'Service Quotes';
                        ApplicationArea = All;
                    }

                }
                group(Job)
                {
                    action("Job List")
                    {
                        RunObject = page "Job List - Internal";
                        ApplicationArea = All;
                    }


                    action("Posted Jobs Sales Invoices")
                    {
                        RunObject = page "Posted Jobs Sales Invoices";
                        ApplicationArea = All;
                    }
                }

                group("Material Issue")
                {
                    action("Job Material Request List")
                    {
                        RunObject = page "Job Material Request List";
                        ApplicationArea = All;
                    }
                    action("Store Material Issue List Job")
                    {
                        RunObject = page "Store Material Issue List";
                        ApplicationArea = All;
                        caption = 'Store Material Issue List';
                    }
                    action("Store Material Return List")
                    {
                        RunObject = page "Store Material Return List";
                        ApplicationArea = All;
                    }

                }
                // group("Purchase")
                // {
                //     action("Local Req")
                //     {
                //         Caption = 'Purchase Requisition';
                //         ApplicationArea = All;
                //         RunObject = page "Purchase Local Req List";
                //     }

                //     action("Approved Purch Req")
                //     {
                //         ApplicationArea = All;
                //         Caption = 'Approved Purchase Requisition';
                //         RunObject = page "Approved Purchase Req.";
                //     }
            }
            group("Quality Assurance")
            {
                action("Quality Check")
                {
                    Caption = 'Quality Check Assurance Form';
                    ApplicationArea = All;
                    RunObject = page "Quality CheckList";
                }

                action("Job & List")
                {
                    caption = 'Job List (Quality check & Quality Check Completed)';
                    RunObject = page "Job List -Quality Check";
                    ApplicationArea = All;
                }
            }

            group("Posted Documents")
            {
                action("Posted Material Issue")
                {
                    RunObject = page "Posted Material Issue List";
                    ApplicationArea = All;
                    Caption = 'Posted Material Issue';
                    Image = PostedReceipts;
                }
                action("Posted Job Material Req. List")
                {
                    RunObject = page "Posted Job Material Req. List";
                    ApplicationArea = All;
                }


                action("Posted Material Return")
                {
                    RunObject = page "Posted Material Return List";
                    ApplicationArea = All;
                }

            }
        }
        area(Creation)
        {
            action(Vendors)
            {
                ApplicationArea = All;
                RunObject = page "Vendor List";
            }
        }
    }
}

