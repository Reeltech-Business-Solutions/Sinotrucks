tableextension 50044 CustLedgerEntryExt extends "Cust. Ledger Entry"
{

    fields
    {
        field(50308; "OEM Code"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50309; "LPO"; Text[50])
        {

        }

    }

}
