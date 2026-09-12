pageextension 50051 BankAcctListExt extends "Bank Account List"
{
    layout
    {
        addafter(BalanceLCY)
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
