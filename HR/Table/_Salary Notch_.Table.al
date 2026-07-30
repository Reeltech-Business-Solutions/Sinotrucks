table 54554 "Salary Notch"
{
    fields
    {
        field(1; "Salary Grade"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Salary Grades"."Salary Grade";
        }
        field(2; "Salary Notch"; Code[20])
        {
            NotBlank = true;
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Basic  Pay"; Decimal)
        {

            trigger OnValidate()
            begin
                "Annual Salary Amount" := "Basic  Pay" * 12;
            end;
        }
        field(5; "Hourly Rate"; Decimal)
        {
        }
        field(6; "Annual Salary Amount"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Annual Salary Amount" > 0 then "Basic  Pay" := "Annual Salary Amount" / 12;
            end;
        }
        field(7; Gross; Decimal)
        {
            trigger OnValidate()
            var
                salaryStepN: Record "Salary Step/Notch Transactions";
            begin

                if Trans.Get('BPAY') then
                    rec.Validate("Basic  Pay", (Gross * (Trans."% Setup" / 100)));
                salaryStepN.Init();
                salaryStepN.SETRANGE(salaryStepN."Salary grade", "Salary Grade");
                salaryStepN.SETRANGE(salaryStepN."Salary Step/Notch", "Salary Notch");
                if salaryStepN.Find('-') then
                    repeat
                        if Trans.Get(salaryStepN."Transaction Code") then begin
                            salaryStepN.Validate(salaryStepN.Amount, (rec.Gross * (Trans."% Setup" / 100)));
                            salaryStepN.Modify();
                            //     if salaryStepN."Transaction Code" = 'PALLIATIVE' then
                            //         salaryStepN.Validate(salaryStepN.Amount, (rec."Gross Total" * (Trans."% Setup 1" / 100)));
                            //     salaryStepN.Modify();
                        end;
                    until salaryStepN.Next = 0;
                // if Gross <> 0 then
                // Pallative := ((Gross))
                Trans.SetFilter(Palliative, '%1', true);
                if Trans.FindFirst() then
                    Pallative := Gross * Trans."% Setup" / 100;

                //"Gross Total" := ((Gross / 0.4) * 1);
                "Gross Total" := Pallative + Gross;
                "Annual Salary Amount" := "Gross Total" * 12;

            end;




        }
        field(8; Status; Option)
        {
            OptionMembers = Active,Inactive;
        }

        field(9; "Gross Total"; Decimal)
        {

            trigger onvalidate()
            begin
                "Gross Total" := ((Gross / 0.4) * 10);
            end;
        }
        field(10; "Pallative"; Decimal)
        {

        }
    }
    keys
    {
        key(Key1; "Salary Grade", "Salary Notch")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
    var
        Trans: Record "prTransaction Codes";

}
