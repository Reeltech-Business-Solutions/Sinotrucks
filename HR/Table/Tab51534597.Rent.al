table 53457 Rent
{
    Caption = 'Rent';
    DataClassification = ToBeClassified;
    //Code by Ifeanyi Ayodeji, Mr Idowu, Folayinka
    fields
    {
        field(1; "No."; Code[50])
        {
            Caption = 'Rent Code';
            DataClassification = ToBeClassified;
            //TableRelation = "No. Series";


            trigger OnValidate()
            var
                GeneralLedgerSetup: record "General Ledger Setup";
            begin
                if "No." < xRec."No." then
                    if not rec.Get(rec."No.") then begin
                        GeneralLedgerSetup.Get();
                        NewNoSeriesMgt.TestManual(GeneralLedgerSetup."Rent Code Nos.");
                        "No. Series" := '';
                        //  NoSeriesMgt.InitSeries(GeneralLedgerSetup."Rent code Nos.", xRec."No.", 0D, "No.", "No.");

                    end;
            end;

        }
        field(2; "Property Address"; Text[50])
        {
            Caption = 'Property Address';
        }
        field(3; "Contact's Name"; Text[50])
        {
            Caption = 'Contact''s Name';
        }
        field(4; "Contact Phone No."; Code[15])
        {
            Caption = 'Contact Phone No.';
        }
        field(5; "Contact Email"; Code[15])
        {
            Caption = 'Contact Email';
        }
        field(6; "Size(Sqm)"; Decimal)
        {
            Caption = 'Size(Sqm)';


            trigger OnValidate()

            var
                RentCal: Record Rent;
                YearlyRent: Decimal;
            begin
                YearlyRent := (Rec."Rate Per Sqm" * rec."Size(Sqm)");
                Rec."Amount Per Year" := YearlyRent;
            end;
        }
        field(7; "Rate Per Sqm"; Decimal)
        {
            Caption = 'Rate Per Sqm';

            trigger OnValidate()

            var
                RentCal: Record Rent;
                YearlyRent: Decimal;
            begin
                YearlyRent := Rec."Rate Per Sqm" * Rec."Size(Sqm)";
                //Coded by Ifeanyi Ayodeji
                rec.Validate("Amount Per Year", YearlyRent);
            end;

        }
        field(8; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(9; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(10; "Amount Per Year"; Decimal)
        {
            Caption = 'Amount Per Year';
            trigger OnValidate()
            var
                Rent1cal: Record Rent;
                MonthlyRent: Decimal;
            begin
                MonthlyRent := Rec."Amount Per Year" / 12;
                Rec."Monthly Amount" := MonthlyRent;
            end;


        }
        field(11; "Monthly Amount"; Decimal)
        {
            Caption = 'Monthly Amount';
        }
        field(12; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        if "No." = '' then begin
            GeneralLedgerSetup.Get();
            GeneralLedgerSetup.TestField("Rent Code Nos.");
            "No. Series" := GeneralLedgerSetup."Rent Code Nos.";
            if NewNoSeriesMgt.AreRelated(GeneralLedgerSetup."Rent Code Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NewNoSeriesMgt.GetNextNo("No. Series");
            // NoSeriesMgt.InitSeries(GeneralLedgerSetup."Rent Code Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        YearlyRent: Decimal;

        rentCal: Record Rent;

        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        GeneralLedgerSetup: record "General Ledger Setup";
        NewNoSeriesMgt: Codeunit "No. Series";


}
