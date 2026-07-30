table 54555 "Salary Step/Notch Transactions"
{
    DrillDownPageID = "Salary Step/Notch Transactions";
    LookupPageID = "Salary Step/Notch Transactions";

    fields
    {
        field(1; "Salary Grade"; Code[20])
        {
            TableRelation = "Salary Grades"."Salary Grade";
        }
        field(2; "Salary Step/Notch"; Code[20])
        {
            TableRelation = "Salary Notch"."Salary Notch" WHERE("Salary Grade" = FIELD("Salary Grade"));
        }
        field(3; "Transaction Code"; Code[20])
        {
            TableRelation = "prTransaction Codes"."Transaction Code";

            trigger OnValidate()
            begin

                if Trans.Get("Transaction Code") then begin
                    //if SalaryNotch.Get("Salary Grade", "Salary Step/Notch") then begin
                    "Transaction Name" := Trans."Transaction Name";
                    "Transaction Type" := Trans."Transaction Type";
                    Formula := Trans.Formula;
                    // rec.Reset();

                end;
            end;
        }
        field(4; "Transaction Name"; Text[100])
        {
        }
        field(5; "Transaction Type"; Option)
        {
            OptionMembers = Income,Deduction;
        }
        field(6; Amount; Decimal)
        {
            trigger OnValidate()
            begin
                "Annual Amount" := Amount * 12;
            end;
            // DataClassification = ToBeClassified;
            // trigger OnValidate()
            // var
            //     TransactionRec: Record "prTransaction Codes";
            //     Usage: Decimal;
            //     Percentage: Decimal;
            // begin
            //     // Look up the transaction code in the "Transaction" table
            //     if TransactionRec.GET("Transaction Code") then begin
            //         // If the transaction code matches, fetch the value of the "Usage" field
            //         Usage := TransactionRec."% Setup";
            //         // Fetch the percentage of gross from the field in the record
            //         //Percentage := PercentageOfGross;
            //         // Calculate the amount based on the percentage of gross and the fetched usage value
            //         Amount := (Usage / 100) * gross;
            //     end;
            // end;


        }
        field(7; "% of Basic Pay"; Decimal)
        {

        }
        field(8; Formula; Code[100])
        {
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(10; "Annual Amount"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Annual Amount" > 0 then Amount := "Annual Amount" / 12;
            end;
        }
        field(11; Frequency; Option)
        {
            Description = 'Fixed,Varied,Quarterly,Annual';
            OptionMembers = "Fixed",Varied,Quarterly,Annual;
        }
        field(12; "% Setup"; Decimal)
        {
        }
        field(13; Gross; Decimal)
        {

        }
    }
    keys
    {
        key(Key1; "Salary Grade", "Salary Step/Notch", "Entry No")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
    var
        Trans: Record "prTransaction Codes";
        SalaryNotch: Record "Salary Notch";
        BasicPay: decimal;

}
