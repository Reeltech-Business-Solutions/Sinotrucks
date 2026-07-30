tableextension 54413 EmployeeExt extends Employee
{
    fields
    {
        field(51534; new_relationshipmanager; Boolean)
        {
            Caption = 'new_relationshipmanager';
            DataClassification = ToBeClassified;
        }

        // modify("E-Mail")
        // {
        //     trigger OnBeforeValidate()
        //     begin
        //         Rec."E-Mail" := LowerCase(Rec."E-Mail");
        //     end;
        // }
    }
}
