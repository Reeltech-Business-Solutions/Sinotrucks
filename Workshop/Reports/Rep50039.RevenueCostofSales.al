report 50039 "Revenue Cost of Sales"
{
    ApplicationArea = All;
    Caption = 'Revenue Cost of Sales';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './Revenue_CostofSale.rdl';
    dataset
    {
        dataitem(Job; "Job")
        {
            RequestFilterFields = "No.", "Posting Date Filter";

            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }

            column(InvoicedAmount; "Invoiced Amount")
            {
            }
            column(UsageCost; "Usage Cost")
            {
            }
            column(CalcRecogCostsGLAmount_Job; "Calc. Recog. Costs G/L Amount")
            {
            }
            column(Jobfilter; Job.GetFilter("Posting Date Filter"))
            {
            }
            column(Your_Reference; "Your Reference")
            {

            }
            column(Contract_Invoiced_Price; "Contract Invoiced Price")
            {

            }
            column(Cost_of_Sales; "Cost of Sales")
            {

            }
            column(ReportFilter; GetFilter("Posting Date Filter"))
            {
            }
            column(Invoiced_Amount; Abs("Invoiced Amount"))
            {

            }
            column(Status; Status)
            {

            }
            column(Bill_to_Name; "Bill-to Name")
            {

            }
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {

            }

            column(Starting_Date; Format("Starting Date"))
            {

            }
            column(Ending_Date; Format("Ending Date"))
            {

            }
            column(Creation_Date; Format("Creation Date"))
            {

            }
            column(CompanyInfo; CompanyInfo.Picture)
            {

            }
            column(job1; job.GetFilters)
            {

            }
            column(Profit; Abs(Profit))
            {

            }
            trigger OnAfterGetRecord()
            begin
                Profit := "Invoiced Amount" + "Cost of Sales";


            end;

            trigger OnPreDataItem()
            begin
                SetFilter("Invoiced Amount", '<>%1', 0);
                SetFilter(Status, '%1', Status::Completed);
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
    trigger OnPreReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;


    var
        CompanyInfo: Record "Company Information";
        Profit: Decimal;
        CostOfSales: Decimal;
}