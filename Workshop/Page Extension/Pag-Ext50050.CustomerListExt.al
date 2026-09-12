pageextension 50050 "Customer ListExt" extends "Customer List"
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
