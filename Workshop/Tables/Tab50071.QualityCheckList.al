table 50071 QualityCheckList
{
    Caption = 'QualityCheckList';
    DataClassification = ToBeClassified;
    // DrillDownPageId = "Quality List Check";
    //to   // LookupPageId = "Quality List Check";

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
        }
        field(2; "Description"; Text[250])
        {

        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
