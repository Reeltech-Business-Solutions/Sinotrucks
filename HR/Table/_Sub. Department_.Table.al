table 54405 "Sub. Department"
{
    Caption = 'Unit/Section';

    fields
    {
        field(2; Code; Code[20])
        {
        }
        field(3; Name; Code[20])
        {
        }
        field(1; "Dept. Code"; Code[20])
        {
        }
        field(4; Description; Text[100])
        {
        }
    }
    keys
    {
        key(Key1; Code, "Dept. Code")
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
