page 50389 "NRS Payment Update"
{
    Caption = 'Update NRS Payment Status';
    PageType = StandardDialog;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(Update)
            {
                Caption = 'Payment Update';

                field(PaymentStatus; PaymentStatusOpt)
                {
                    Caption = 'Payment Status';
                    OptionCaption = 'PAID,REJECTED,PARTIAL';
                    ApplicationArea = All;
                    ToolTip = 'Select the new payment status to report to NRS.';
                }
                field(PaidAmount; AmountVar)
                {
                    Caption = 'Amount (PARTIAL only)';
                    ApplicationArea = All;
                    ToolTip = 'For a PARTIAL payment, enter the amount paid so far. Ignored for PAID/REJECTED.';
                }
                field(RefText; ReferenceVar)
                {
                    Caption = 'Reference / Note';
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Optional note. For a PARTIAL payment, describe the payment (e.g. balance due date).';
                }
            }
        }
    }

    var
        PaymentStatusOpt: Option PAID,REJECTED,PARTIAL;
        AmountVar: Decimal;
        ReferenceVar: Text;

    /// <summary>Returns the selected status as the text NRS expects (PAID / REJECTED / PARTIAL).</summary>
    procedure GetStatusText(): Text
    begin
        exit(Format(PaymentStatusOpt));
    end;

    procedure GetAmount(): Decimal
    begin
        exit(AmountVar);
    end;

    procedure GetReference(): Text
    begin
        exit(ReferenceVar);
    end;
}
