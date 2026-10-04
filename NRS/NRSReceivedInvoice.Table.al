table 50188 "NRS Received Invoice"
{
    Caption = 'NRS Received Invoice';
    DataClassification = CustomerContent;
    LookupPageId = "NRS Received Invoices";
    DrillDownPageId = "NRS Received Invoices";

    fields
    {
        field(1; "IRN"; Text[100]) { Caption = 'IRN'; }
        field(10; "Invoice Type Code"; Text[10]) { Caption = 'Invoice Type Code'; }
        field(11; "Issue Date"; Date) { Caption = 'Issue Date'; }
        field(12; "Due Date"; Date) { Caption = 'Due Date'; }
        field(13; "Payment Status"; Text[20]) { Caption = 'Payment Status'; }
        field(14; "Currency Code"; Code[10]) { Caption = 'Currency Code'; }
        field(20; "Supplier Name"; Text[150]) { Caption = 'Supplier Name'; }
        field(21; "Supplier TIN"; Text[50]) { Caption = 'Supplier TIN'; }
        field(22; "Supplier Email"; Text[100]) { Caption = 'Supplier Email'; }
        field(30; "Customer Name"; Text[150]) { Caption = 'Customer Name'; }
        field(31; "Customer TIN"; Text[50]) { Caption = 'Customer TIN'; }
        field(40; "Tax Exclusive Amount"; Decimal) { Caption = 'Tax Exclusive Amount'; }
        field(41; "Tax Amount"; Decimal) { Caption = 'Tax Amount'; }
        field(42; "Tax Inclusive Amount"; Decimal) { Caption = 'Tax Inclusive Amount'; }
        field(43; "Payable Amount"; Decimal) { Caption = 'Payable Amount'; }
        field(50; "Pulled At"; DateTime) { Caption = 'Pulled At'; }
        field(51; "Raw Response"; Blob) { Caption = 'Raw Response'; }
    }

    keys
    {
        key(PK; "IRN") { Clustered = true; }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "IRN", "Supplier Name", "Payable Amount")
        {
        }
    }

    procedure SetRawResponse(ResponseText: Text)
    var
        OutStr: OutStream;
    begin
        Clear("Raw Response");
        if ResponseText = '' then
            exit;
        "Raw Response".CreateOutStream(OutStr, TextEncoding::UTF8);
        OutStr.Write(ResponseText);
    end;

    procedure GetRawResponse() Result: Text
    var
        InStr: InStream;
        Line: Text;
    begin
        CalcFields("Raw Response");
        if not "Raw Response".HasValue() then
            exit('');
        "Raw Response".CreateInStream(InStr, TextEncoding::UTF8);
        while not InStr.EOS() do begin
            InStr.ReadText(Line);
            Result += Line;
        end;
    end;
}
