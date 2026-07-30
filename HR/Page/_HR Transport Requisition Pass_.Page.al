page 54485 "HR Transport Requisition Pass"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Transport Allocations";
    SourceTableView = SORTING("Allocation No", "Requisition No");
    AdditionalSearchTerms = 'HR Transport Requisition Pass';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;

                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;
                }
                field("Passenger/s Full Name/s"; Rec."Passenger/s Full Name/s")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(From; rec.From)
                {
                    ApplicationArea = all;
                }
                field("To"; Rec."To")
                {
                    ApplicationArea = all;
                }
                field(Dept; rec.Dept)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
