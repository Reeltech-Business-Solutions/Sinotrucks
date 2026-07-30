report 50037 "Workshop Job Status"
{
    ApplicationArea = All;
    Caption = 'Workshop Job Status';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './WorkshopJob.rdl';
    dataset
    {
        dataitem(Job; "job")
        {
            RequestFilterFields = "Workshop Status", "Global Dimension 1 Code";
            PrintOnlyIfDetail = true;

            column(JobNo_; "No.")
            {
            }
            column(Service_Vehicle; "Service Vehicle")
            {

            }
            column(KM_Odometer_Reading; Format("KM Odometer Reading"))
            {

            }
            column(Starting_Date; Format("Starting Date"))
            {

            }
            column(Ending_Date; Format("Ending Date"))
            {

            }
            column(Shortcut_Dimension_8_Code; "Shortcut Dimension 8 Code")
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }

            dataitem("Job Planning Line"; "Job Planning Line")
            {
                DataItemLink = "Job No." = FIELD("No.");
                RequestFilterFields = "Document Date";

                column(count; counter)
                {

                }
                column(Job_No_; "Job No.")
                {

                }
                column(Planning_Date; Format("Planning Date"))
                {

                }
                column(Planned_Delivery_Date; Format("Planned Delivery Date"))
                {

                }
                column(Document_No_; "Document No.")
                {

                }
                column(Type; "Type")
                {

                }
                column(No_; "No.")
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
                column(Quantity; Quantity)
                {

                }
                column(Qty__to_Assemble; "Qty. to Assemble")
                {

                }
                column(Consumed_Quantity; "Consumed Quantity")
                {

                }
                column(Consumed_Quantity_Usage; "Consumed Quantity Usage")
                {

                }

                column(Location_Code; "Location Code")
                {

                }
                column(Unit_Cost; "Unit Cost")
                {

                }

                column(Total_Cost; "Total Cost")
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Line_Amount; "Line Amount")
                {

                }
                column(Qty__to_Transfer_to_Journal; "Qty. to Transfer to Journal")
                {

                }
                column(Invoiced_Amount__LCY_; "Invoiced Amount (LCY)")
                {

                }
                column(workshop_status; job."Workshop Status")
                {

                }
                column(picture; CompanyInfo.Picture)
                {

                }
                column(Customer; job."Global Dimension 1 Code")
                {

                }
                column(VatAmount; VatAmount)
                {

                }
                column(TotalPrice; TotalPrice)
                {

                }

                trigger OnAfterGetRecord()
                begin
                    VatAmount := Abs(Round("Line Amount" * 7.5 / 100, 0.01));
                    TotalPrice := "Line Amount" + "VatAmount";
                end;


            }

            trigger OnPreDataItem()
            begin
                companyInfo.Get();
                companyInfo.CalcFields(Picture);
            end;

            trigger OnAfterGetRecord()
            begin
                counter += 1;
            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
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
        VatAmount: Decimal;
        TotalPrice: Decimal;

}

