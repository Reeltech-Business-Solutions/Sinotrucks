table 50183 "NRS QR Buffer"
{
    Caption = 'NRS QR Buffer';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; IRN; Text[100])
        {
            Caption = 'IRN';
        }
        field(3; "QR Image"; Media)
        {
            Caption = 'QR Image';
        }
    }

    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
}
