table 50001 "WithHold Tax"
{
    Caption = 'WithHold Tax';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Withholding Tax";
    LookupPageId = "Withholding Tax";

    fields
    {
        field(1; "WHT Code"; Code[50])
        {
            Caption = 'WHT Code';
            DataClassification = ToBeClassified;
        }
        field(2; Description; text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Percentage; Decimal)
        {
            Caption = 'WHT Percentage';
            DataClassification = ToBeClassified;
        }
        field(4; "G/L Entries"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "WHT Account"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
        field(6; "VAT Account"; Code[20])
        {
            TableRelation = "G/L Account";
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "WHT Code")
        {
            Clustered = true;
        }
    }
}
