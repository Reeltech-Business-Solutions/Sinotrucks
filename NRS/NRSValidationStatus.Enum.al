enum 50181 "NRS Validation Status"
{
    Extensible = true;
    Caption = 'NRS Validation Status';

    value(0; "Not Validated")
    {
        Caption = 'Not Validated';
    }
    value(1; Validated)
    {
        Caption = 'Validated';
    }
    value(2; Failed)
    {
        Caption = 'Failed';
    }
}
