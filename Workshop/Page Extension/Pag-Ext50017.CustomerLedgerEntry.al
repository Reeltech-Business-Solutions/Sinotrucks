pageextension 50017 "Customer Ledger Entry" extends "Customer Ledger Entries"
{
    actions
    {
        addafter("Create Finance Charge Memo")
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print Receipt';
                Image = Print;
                Promoted = true;

                trigger OnAction()
                begin
                    Rec.Reset();
                    Rec.SetFilter("Document No.", Rec."Document No.");
                    Report.Run(Report::"Payment Receipt Report", true, true, Rec);
                end;
            }
        }
    }
}
