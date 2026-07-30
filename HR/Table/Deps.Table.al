table 54407 Deps
{
    fields
    {
        field(1; CODE; Code[20])
        {
        }
        field(2; "NAME TEXT"; Text[80])
        {
        }
        field(3; "Gross Pay"; Decimal)
        {
        }
        field(4; "Basic Salary"; Decimal)
        {
        }
        field(5; Allowances; Decimal)
        {
        }
        field(6; "Employer Pension"; Decimal)
        {
        }
        field(7; "Gross Payjn"; Decimal)
        {
        }
        field(8; "Basic Salaryjn"; Decimal)
        {
        }
        field(9; Allowancesjn; Decimal)
        {
        }
        field(10; "Employer Pensionjn"; Decimal)
        {
        }
        field(11; "Prev Net Pay"; Decimal)
        {
        }
        field(12; "Curr Net Pay"; Decimal)
        {
        }
        field(13; "Current Month Filter"; Date)
        {
        }
        field(14; "Previous Month Filter"; Date)
        {
        }
        field(15; "Location/Division"; Code[20])
        {
        }
    }
    keys
    {
        key(Key1; CODE)
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; CODE, "NAME TEXT")
        {
        }
    }
}
