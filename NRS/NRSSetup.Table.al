table 50180 "NRS Setup"
{
    Caption = 'NRS Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "API Key"; Text[100])
        {
            Caption = 'API Key';
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(3; "Base URL"; Text[250])
        {
            Caption = 'Base URL';
            ExtendedDatatype = URL;
        }
        // The secret itself is NOT stored here - only the Isolated Storage key (a GUID).
        field(4; "Client Secret Key"; Guid)
        {
            Caption = 'Client Secret Key';
            DataClassification = SystemMetadata;
        }
        field(10; "Business ID"; Text[100])
        {
            Caption = 'Business ID';
            DataClassification = CustomerContent;
        }
        field(11; "Service ID"; Text[50])
        {
            Caption = 'Service ID';
            DataClassification = CustomerContent;
        }
        field(12; Enabled; Boolean)
        {
            Caption = 'Enabled';
            DataClassification = CustomerContent;
        }
        field(20; Certificate; Blob)
        {
            Caption = 'Certificate';
            DataClassification = CustomerContent;
        }
        // ---- Supplier party (accounting_supplier_party) - required for Validate Invoice ----
        field(30; "Supplier Name"; Text[100])
        {
            Caption = 'Supplier Name';
            DataClassification = CustomerContent;
        }
        field(31; "Supplier TIN"; Text[50])
        {
            Caption = 'Supplier TIN';
            DataClassification = CustomerContent;
        }
        field(32; "Supplier Email"; Text[100])
        {
            Caption = 'Supplier Email';
            DataClassification = CustomerContent;
        }
        field(33; "Supplier Telephone"; Text[30])
        {
            Caption = 'Supplier Telephone';
            DataClassification = CustomerContent;
        }
        field(34; "Supplier Business Desc."; Text[250])
        {
            Caption = 'Supplier Business Description';
            DataClassification = CustomerContent;
        }
        field(35; "Supplier Street"; Text[100])
        {
            Caption = 'Supplier Street';
            DataClassification = CustomerContent;
        }
        field(36; "Supplier City"; Text[50])
        {
            Caption = 'Supplier City';
            DataClassification = CustomerContent;
        }
        field(37; "Supplier Postal Zone"; Text[20])
        {
            Caption = 'Supplier Postal Zone';
            DataClassification = CustomerContent;
        }
        field(38; "Supplier LGA Code"; Text[20])
        {
            Caption = 'Supplier LGA Code';
            DataClassification = CustomerContent;
        }
        field(39; "Supplier State Code"; Text[20])
        {
            Caption = 'Supplier State Code';
            DataClassification = CustomerContent;
        }
        field(40; "Supplier Country"; Code[10])
        {
            Caption = 'Supplier Country';
            DataClassification = CustomerContent;
            InitValue = 'NG';
        }
        // ---- Document defaults ----
        field(41; "Def. Invoice Type Code"; Text[10])
        {
            Caption = 'Default Invoice Type Code';
            DataClassification = CustomerContent;
        }
        field(42; "Def. Invoice Kind"; Text[10])
        {
            Caption = 'Default Invoice Kind';
            DataClassification = CustomerContent;
            InitValue = 'B2B';
        }
        field(43; "Def. Payment Status"; Text[10])
        {
            Caption = 'Default Payment Status';
            DataClassification = CustomerContent;
            InitValue = 'PENDING';
        }
        field(44; "Def. Tax Category"; Text[30])
        {
            Caption = 'Default Tax Category';
            DataClassification = CustomerContent;
        }
        field(45; "Def. Price Unit"; Code[10])
        {
            Caption = 'Default Price Unit';
            DataClassification = CustomerContent;
        }
        field(46; "Def. Payment Means Code"; Text[10])
        {
            Caption = 'Default Payment Means Code';
            DataClassification = CustomerContent;
        }
        field(47; "Def. Document Currency"; Code[10])
        {
            Caption = 'Default Document Currency';
            DataClassification = CustomerContent;
            InitValue = 'NGN';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        DefaultUrlTok: Label 'https://firseinvoicedemo.etranzactng.com/api/v3/app/invoice', Locked = true;

    /// <summary>Gets the single setup record, creating it with defaults if it does not exist.</summary>
    procedure GetRecordOnce()
    begin
        if not Get() then begin
            Init();
            "Base URL" := DefaultUrlTok;
            Insert();
        end;
    end;

    /// <summary>Stores the client secret securely in Isolated Storage (never in the table).</summary>
    [NonDebuggable]
    procedure SetClientSecret(Secret: Text)
    begin
        if IsNullGuid("Client Secret Key") then begin
            "Client Secret Key" := CreateGuid();
            Modify();
        end;

        if Secret = '' then begin
            if not IsolatedStorage.Delete(Format("Client Secret Key"), DataScope::Company) then;
            exit;
        end;

        if EncryptionEnabled() then
            IsolatedStorage.SetEncrypted(Format("Client Secret Key"), Secret, DataScope::Company)
        else
            IsolatedStorage.Set(Format("Client Secret Key"), Secret, DataScope::Company);
    end;

    /// <summary>Reads the client secret back from Isolated Storage as a SecretText.</summary>
    [NonDebuggable]
    procedure GetClientSecret() Secret: SecretText
    begin
        if IsNullGuid("Client Secret Key") then
            exit;
        if IsolatedStorage.Get(Format("Client Secret Key"), DataScope::Company, Secret) then
            exit(Secret);
    end;

    /// <summary>Returns true when a client secret has been configured.</summary>
    procedure HasClientSecret(): Boolean
    begin
        if IsNullGuid("Client Secret Key") then
            exit(false);
        exit(IsolatedStorage.Contains(Format("Client Secret Key"), DataScope::Company));
    end;

    /// <summary>Validates that the setup is complete before an API call.</summary>
    procedure CheckReady()
    begin
        GetRecordOnce();
        TestField(Enabled);
        TestField("API Key");
        TestField("Base URL");
        TestField("Business ID");
        TestField("Service ID");
        if not HasClientSecret() then
            Error(SecretMissingErr);
    end;

    /// <summary>Validates that the setup, including the certificate, is complete before a QR call.</summary>
    procedure CheckReadyForQR()
    begin
        CheckReady();
        if not HasCertificate() then
            Error(CertMissingErr);
    end;

    procedure SetCertificate(CertValue: Text)
    var
        OutStr: OutStream;
    begin
        Clear(Certificate);
        if CertValue <> '' then begin
            Certificate.CreateOutStream(OutStr, TextEncoding::UTF8);
            OutStr.Write(CertValue);
        end;
        Modify();
    end;

    procedure GetCertificate(): Text
    var
        InStr: InStream;
        Result: Text;
    begin
        CalcFields(Certificate);
        if not Certificate.HasValue() then
            exit('');
        Certificate.CreateInStream(InStr, TextEncoding::UTF8);
        InStr.ReadText(Result);
        exit(Result);
    end;

    procedure HasCertificate(): Boolean
    begin
        CalcFields(Certificate);
        exit(Certificate.HasValue());
    end;

    /// <summary>Validates that the supplier party + document defaults needed for Validate Invoice are set.</summary>
    procedure CheckReadyForValidate()
    begin
        CheckReady();
        TestField("Supplier Name");
        TestField("Supplier TIN");
        TestField("Supplier Email");
        TestField("Supplier Street");
        TestField("Supplier City");
        TestField("Supplier LGA Code");
        TestField("Supplier State Code");
        TestField("Supplier Country");
        TestField("Def. Invoice Type Code");
        TestField("Def. Invoice Kind");
        TestField("Def. Document Currency");
        TestField("Def. Tax Category");
        TestField("Def. Price Unit");
    end;

    var
        SecretMissingErr: Label 'The NRS client secret has not been configured. Open the NRS Setup page and enter it.';
        CertMissingErr: Label 'The NRS certificate has not been configured. Open the NRS Setup page and paste the certificate value (from crypto_keys.txt).';
}
