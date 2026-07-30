table 54404 Department
{
    Caption = 'Division';

    fields
    {
        field(1; Code; Code[20])
        {
        }
        field(4; Description; Text[100])
        {
        }
        field(2; "Dim. Code"; Code[20])
        {
        }
        field(3; "Department Name"; Text[50])
        {
        }
    }
    keys
    {
        key(Key1; "Dim. Code", Code)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Description)
        {
        }
    }
}
