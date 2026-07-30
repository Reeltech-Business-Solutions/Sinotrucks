table 54406 "Employee Work Schedule"
{
    Caption = 'Employee Work Schedule';

    fields
    {
        field(1; Code; Code[50])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; Code)
        {
        }
    }
}
