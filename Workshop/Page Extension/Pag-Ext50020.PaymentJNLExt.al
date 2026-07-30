pageextension 50024 PaymentJNLExt extends "Payment Journal"
{
    layout
    {
        modify("Recipient Bank Account")
        {
            visible = false;
        }
        modify("Message to Recipient")
        {
            visible = false;
        }
        modify("Creditor No.")
        {
            visible = false;
        }
        modify(Correction)
        {
            visible = false;
        }
        modify("Exported to Payment File")
        {
            visible = false;
        }
        modify(TotalExportedAmount)
        {
            visible = false;
        }
        modify("Has Payment Export Error")
        {
            visible = false;
        }
        modify("Remit-to Code")
        {
            visible = false;
        }
        addafter("Creditor No.")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = All;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
