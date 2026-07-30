table 54408 "Transaction % Setup"
{
    Caption = 'Transaction % Setup';

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Salary Grade"; Code[20])
        {
        }
        field(4; Percentage; Decimal)
        {
        }
    }
    keys
    {
        key(PK; Code, "Salary Grade")
        {
        }
    }
}