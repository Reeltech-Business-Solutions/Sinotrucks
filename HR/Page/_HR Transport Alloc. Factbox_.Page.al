page 54491 "HR Transport Alloc. Factbox"
{
    PageType = CardPart;
    SourceTable = "HR Transport Allocations H";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control1000000017)
            {
                ShowCaption = false;

                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    ApplicationArea = all;
                }
                field("Date of Allocation"; Rec."Date of Allocation")
                {
                    ApplicationArea = all;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = all;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = all;
                }
                field("Vehicle Reg Number"; Rec."Vehicle Reg Number")
                {
                    ApplicationArea = all;
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = all;
                }
                field("Destination(s)"; Rec."Destination(s)")
                {
                    ApplicationArea = all;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = all;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = all;
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = all;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = all;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = all;
                }
                field("Time In"; Rec."Time In")
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
