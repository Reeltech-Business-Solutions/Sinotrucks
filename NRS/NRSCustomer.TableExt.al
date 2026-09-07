tableextension 50181 "NRS Customer Ext" extends Customer
{
    fields
    {
        // Retired: the TIN sent to NRS now comes from the standard VAT Registration No.
        field(50180; "NRS TIN"; Text[50])
        {
            Caption = 'NRS TIN';
            DataClassification = CustomerContent;
            ObsoleteState = Pending;
            ObsoleteReason = 'Use the standard VAT Registration No. on the customer instead.';
        }
        // Retired: the email sent to NRS now comes from the standard E-Mail field.
        field(50181; "NRS Email"; Text[100])
        {
            Caption = 'NRS Email';
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
            ObsoleteState = Pending;
            ObsoleteReason = 'Use the standard E-Mail on the customer instead.';
        }
        field(50182; "NRS Business Desc."; Text[250])
        {
            Caption = 'NRS Business Description';
            DataClassification = CustomerContent;
        }
        field(50183; "NRS LGA Code"; Code[20])
        {
            Caption = 'NRS LGA Code';
            DataClassification = CustomerContent;
            // The lookup is filtered to the chosen State, so only that State's LGAs show.
            TableRelation = "NRS LGA".Code where("State Code" = field("NRS State Code"));

            trigger OnValidate()
            var
                LGA: Record "NRS LGA";
            begin
                // Back-fill the State from the chosen LGA so the two always stay consistent.
                if ("NRS LGA Code" <> '') and LGA.Get("NRS LGA Code") then
                    "NRS State Code" := LGA."State Code";
            end;
        }
        field(50184; "NRS State Code"; Code[10])
        {
            Caption = 'NRS State Code';
            DataClassification = CustomerContent;
            TableRelation = "NRS State".Code;

            trigger OnValidate()
            var
                LGA: Record "NRS LGA";
            begin
                // If the LGA no longer belongs to the selected State, clear it.
                if "NRS LGA Code" <> '' then
                    if LGA.Get("NRS LGA Code") and (LGA."State Code" <> "NRS State Code") then
                        "NRS LGA Code" := '';
            end;
        }
        // Retired: the country sent to NRS now comes from the standard Country/Region Code.
        field(50185; "NRS Country Code"; Code[10])
        {
            Caption = 'NRS Country Code';
            DataClassification = CustomerContent;
            InitValue = 'NG';
            ObsoleteState = Pending;
            ObsoleteReason = 'Use the standard Country/Region Code on the customer instead.';
        }
        field(50186; "NRS Invoice Kind"; Enum "NRS Invoice Kind")
        {
            Caption = 'NRS Invoice Kind';
            DataClassification = CustomerContent;
            // Blank => B2B is used as the fallback.
        }
    }
}
