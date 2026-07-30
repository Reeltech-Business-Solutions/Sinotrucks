tableextension 54412 MiscArticleInfo extends "Misc. Article Information"
{
    fields
    {
        field(51534; Returned; Boolean)
        {
        }
        field(51535; "Status On Return"; Option)
        {
            OptionMembers = Ok, "Needs Repair", "Needs Maintenance";
        }
        field(51536; "Date Returned"; Date)
        {
        }
        field(51537; Recommendations; Text[150])
        {
        }
        field(51538; "Received By"; Code[30])
        {
            Editable = false;
        }
    }
}
