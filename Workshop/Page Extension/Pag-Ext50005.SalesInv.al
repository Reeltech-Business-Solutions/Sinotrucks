pageextension 50005 SalesInv extends "Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name 2")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
                Editable = false;

                trigger OnDrillDown()
                var
                    job: Record Job;

                begin
                    job.SetRange("No.", Rec."Job No.");
                    Page.Run(Page::"Job List - Internal", job);

                end;
            }
            field("Estimate No."; Rec."Estimate No.")
            {
                ApplicationArea = All;
                Editable = false;

                trigger OnDrillDown()
                var
                    ServiceQte: Record "Service Header";
                begin
                    ServiceQte.SetRange("No.", Rec."Estimate No.");
                    Page.Run(Page::"Service Quotes - External", ServiceQte);
                end;
            }
            field("Service Vehicle"; Rec."Service Vehicle")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Summary Invoice" := false;
    end;
}
