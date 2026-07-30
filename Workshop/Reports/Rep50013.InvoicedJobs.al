report 50013 "Invoiced Jobs"
{
    ApplicationArea = All;
    Caption = 'NBC Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './JobLedgerEntriesWorkshop2.rdl';
    dataset
    {
        dataitem(Job; "job")
        {
            RequestFilterFields = "Workshop Status";
            PrintOnlyIfDetail = true;

            column(JobNo_; "No.")
            {
            }
            column(Workshop_Status; "Workshop Status")
            {
            }
            column(Invoice_Exist; "Invoice Exist")
            {

            }
            column(FLeet_No_; "FLeet No.")
            {

            }
            column(Service_Vehicle; "Service Vehicle")
            {

            }
            column(KM_Odometer_Reading;"KM Odometer Reading")
            {

            }

            dataitem("Job Ledger Entry"; "Job Ledger Entry")
            {
                RequestFilterFields = "Posting Date", "Global Dimension 1 Code";
                DataItemLink = "Job No." = FIELD("No."), "Posting Date" = field("Posting Date Filter");

                column(count;
                counter)
                {

                }

                column("Document_No"; "Document No.")
                {

                }

                column("Posting_Date"; Format("Posting Date"))
                {

                }

                column(Service_Item_No_; "Service Item No.")
                {

                }

                column(AssetNo; AssetNo)
                {

                }

                column("Item_No"; "No.")
                {

                }

                column("Description"; "Description")
                {

                }

                column("Quantity"; Abs("Quantity"))
                {

                }

                column("Direct_Unit_Cost_LCY"; "Direct Unit Cost (LCY)")
                {

                }

                column("Unit_Cost_LCY"; "Unit Cost (LCY)")
                {

                }

                column("Total_Cost_LCY"; "Total Cost (LCY)")
                {

                }

                column(Unit_Price__LCY_; "Unit Price (LCY)")
                {

                }

                column("Total_Price_LCY"; "Total Price (LCY)")
                {

                }

                column("Location_Code"; "Location Code")
                {

                }

                column("Warranty_Start_Date"; Format("Warranty Start Date"))
                {

                }

                column("Warranty_End_Date"; Format("Warranty End Date"))
                {

                }
                column(picture; CompanyInfo.Picture)
                {

                }
                column(JobStaus; "Job Ledger Entry".GetFilters)
                {

                }
                column(Type; Type)
                {

                }
                column(Global_Dimension_1_Code; "Global Dimension 1 Code")
                {
                }
                column(VatAmount; VatAmount)
                {

                }


                trigger OnPreDataItem()
                begin
                    companyInfo.Get();
                    companyInfo.CalcFields(Picture);
                    //   setFilter("Entry Type", '%1', "Entry Type"::Sale);
                    setFilter("Posting Date", '%1..%2', startDate, endDate);
                    // Job.SetFilter("Invoice Exist", '%1', true);

                end;

                trigger OnAfterGetRecord()

                begin
                    counter += 1;

                    serviceItem.setRange("No.", "Service Item No.");
                    if serviceItem.FindFirst() then
                        AssetNo := serviceItem."Flee Veht No.";

                    VatAmount := Abs(Round("Line Amount" * 7.5 / 100, 0.01));
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(startDate; startDate)
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                        caption = 'Start Date';
                    }
                    field(endDate; endDate)
                    {
                        ShowMandatory = true;
                        ApplicationArea = All;
                        caption = 'End Date';
                    }

                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        counter: integer;
        companyInfo: Record "Company Information";
        startDate: Date;
        serviceItem: Record "Service Item";
        AssetNo: Text;
        endDate: Date;
        VatAmount: Decimal;
        ServiceLine: Record "Service Line";
}

