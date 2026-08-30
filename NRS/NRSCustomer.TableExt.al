tableextension 50181 "NRS Customer Ext" extends Customer
{
    fields
    {
        field(50180; "NRS TIN"; Text[50])
        {
            Caption = 'NRS TIN';
            DataClassification = CustomerContent;
        }
        field(50181; "NRS Email"; Text[100])
        {
            Caption = 'NRS Email';
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(50182; "NRS Business Desc."; Text[250])
        {
            Caption = 'NRS Business Description';
            DataClassification = CustomerContent;
        }
        field(50183; "NRS LGA Code"; Text[20])
        {
            Caption = 'NRS LGA Code';
            DataClassification = CustomerContent;
        }
        field(50184; "NRS State Code"; Text[20])
        {
            Caption = 'NRS State Code';
            DataClassification = CustomerContent;
        }
        field(50185; "NRS Country Code"; Code[10])
        {
            Caption = 'NRS Country Code';
            DataClassification = CustomerContent;
            InitValue = 'NG';
        }
        field(50186; "NRS Invoice Kind"; Text[10])
        {
            Caption = 'NRS Invoice Kind';
            DataClassification = CustomerContent;
            // Blank => the Default Invoice Kind from NRS Setup is used (e.g. B2B, B2C, B2G, G2B).
        }
    }
}
