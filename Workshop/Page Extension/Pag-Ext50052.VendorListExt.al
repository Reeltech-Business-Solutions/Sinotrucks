pageextension 50052 VendorListExt extends "Vendor List"
{
    layout
    {
        addafter("Payments (LCY)")
        {
            field("Net Change"; Rec."Net Change")
            {
                applicationarea = All;
            }
            field(netChangeLCY; Rec."Net Change (LCY)")
            {
                applicationarea = All;
            }

        }
    }
}
