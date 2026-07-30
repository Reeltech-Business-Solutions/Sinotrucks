table 50115 "Approval code"
{
    Caption = 'Approval code';
    DataClassification = ToBeClassified;

    // DrillDownPageId = "Approval CodeList";

    fields
    {
        field(1; "Approval Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; Description; text[70])
        {
            DataClassification = ToBeClassified;

        }
    }

}
