enum 50180 "NRS IRN Status"
{
    Extensible = true;
    Caption = 'NRS IRN Status';

    value(0; "Not Generated")
    {
        Caption = 'Not Generated';
    }
    value(1; Generated)
    {
        Caption = 'Generated';
    }
    value(2; Failed)
    {
        Caption = 'Failed';
    }
    value(3; Duplicate)
    {
        Caption = 'Duplicate';
    }
}
