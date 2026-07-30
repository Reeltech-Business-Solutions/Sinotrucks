table 54550 "Salary Grades"
{
    fields
    {
        field(1; "Salary Grade"; Code[20])
        {
        }
        field(2; "Salary Amount"; Decimal)
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Pays NHF"; Boolean)
        {
        }
        field(5; "Pays NSITF"; Boolean)
        {
        }
        field(6; "Grade Classification"; Code[10])
        {
            TableRelation = "prEmployee Posting Group".Code;
        }
    }
    keys
    {
        key(Key1; "Salary Grade")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
}
