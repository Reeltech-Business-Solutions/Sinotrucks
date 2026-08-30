codeunit 50180 "NRS E-Invoice Mgt."
{
    // eTranzact / NRS e-invoicing integration.
    // Credentials, business_id, service_id and Base URL come from the "NRS Setup" page.
    // Signature = Base64( HMAC-SHA256( requestBody + timestamp ) ), secret used as a UTF-8 string.
    // Headers: x-api-key, x-api-signature, x-api-timestamp, Content-Type: application/json.
    //
    // Robustness model: each document is processed independently. The network call is isolated in
    // a TryFunction so a failure on one record never aborts a batch, and every attempt (success,
    // duplicate or failure) is written to the "NRS IRN Log" for audit and retry.

    Permissions = tabledata "NRS IRN Log" = RIMD,
                  tabledata "NRS QR Buffer" = RIMD,
                  tabledata "Sales Invoice Header" = RM;

    var
        GenerateIrnPathTok: Label 'generate-irn', Locked = true;
        GenerateQrPathTok: Label 'generate-qr-code', Locked = true;
        ConnErrTxt: Label 'Could not reach the NRS e-invoicing service. Check network access / firewall.';
        NothingSelectedTxt: Label 'No invoices were selected.';
        SummaryTxt: Label 'IRN generation complete.\n\nProcessed: %1\nGenerated: %2\nDuplicates (already issued): %3\nFailed: %4\nSkipped (already generated): %5', Comment = '%1..%5 are counts';
        ConfirmBatchTxt: Label 'Generate NRS IRNs for %1 selected invoice(s)?', Comment = '%1 = count';
        QRConfirmTxt: Label 'Generate NRS QR codes for %1 selected invoice(s)?', Comment = '%1 = count';
        QRSummaryTxt: Label 'QR code generation complete.\n\nProcessed: %1\nGenerated: %2\nFailed: %3', Comment = '%1..%3 are counts';
        NoQRTxt: Label 'No QR code is available for this invoice. Generate one first.';

    /// <summary>Batch entry point from the Posted Sales Invoices list. Processes every selected record.</summary>
    procedure GenerateForSelected(var SalesInvHeader: Record "Sales Invoice Header")
    var
        NRSSetup: Record "NRS Setup";
        ResultStatus: Enum "NRS IRN Status";
        TotalCount: Integer;
        GeneratedCount: Integer;
        DuplicateCount: Integer;
        FailCount: Integer;
        SkippedCount: Integer;
    begin
        NRSSetup.CheckReady();

        if SalesInvHeader.IsEmpty() then begin
            Message(NothingSelectedTxt);
            exit;
        end;

        if not Confirm(ConfirmBatchTxt, false, SalesInvHeader.Count()) then
            exit;

        SalesInvHeader.FindSet();
        repeat
            TotalCount += 1;
            if (SalesInvHeader."NRS IRN Status" = SalesInvHeader."NRS IRN Status"::Generated) then
                SkippedCount += 1
            else begin
                ResultStatus := GenerateForInvoice(SalesInvHeader, false);
                case ResultStatus of
                    ResultStatus::Generated:
                        GeneratedCount += 1;
                    ResultStatus::Duplicate:
                        DuplicateCount += 1;
                    else
                        FailCount += 1;
                end;
            end;
        until SalesInvHeader.Next() = 0;

        Message(SummaryTxt, TotalCount, GeneratedCount, DuplicateCount, FailCount, SkippedCount);
    end;

    /// <summary>
    /// Generates (or re-generates, when Force = true) the IRN for a single posted invoice.
    /// Writes the outcome to the log and reflects it on the invoice header. Returns the resulting status.
    /// </summary>
    procedure GenerateForInvoice(SalesInvHeader: Record "Sales Invoice Header"; Force: Boolean): Enum "NRS IRN Status"
    var
        NRSSetup: Record "NRS Setup";
        IRNLog: Record "NRS IRN Log";
        ClientSecret: SecretText;
        InvoiceNumber: Text;
        IssuanceDate: Text;
        ResponseText: Text;
        IRN: Text;
        RespMsg: Text;
        HttpStatusCode: Integer;
        NewStatus: Enum "NRS IRN Status";
        Sent: Boolean;
    begin
        NRSSetup.CheckReady();

        if (not Force) and (SalesInvHeader."NRS IRN Status" = SalesInvHeader."NRS IRN Status"::Generated) then
            exit(SalesInvHeader."NRS IRN Status");

        InvoiceNumber := SalesInvHeader."No.";
        IssuanceDate := Format(SalesInvHeader."Posting Date", 0, '<Year4><Month,2><Day,2>');
        ClientSecret := NRSSetup.GetClientSecret();

        Sent := SendGenerateIRN(NRSSetup, ClientSecret, InvoiceNumber, IssuanceDate, HttpStatusCode, ResponseText);

        GetOrInitLog(IRNLog, Database::"Sales Invoice Header", SalesInvHeader."No.");
        IRNLog."Posting Date" := SalesInvHeader."Posting Date";
        IRNLog."Invoice Number" := CopyStr(InvoiceNumber, 1, MaxStrLen(IRNLog."Invoice Number"));
        IRNLog."Business ID" := NRSSetup."Business ID";
        IRNLog."Service ID" := NRSSetup."Service ID";
        IRNLog."HTTP Status Code" := HttpStatusCode;
        IRNLog.IRN := '';
        IRNLog."Error Message" := '';
        IRNLog.StampAudit();

        if not Sent then begin
            NewStatus := NewStatus::Failed;
            IRNLog.Status := NewStatus;
            IRNLog."Response Message" := CopyStr(ConnErrTxt, 1, MaxStrLen(IRNLog."Response Message"));
        end else begin
            ParseResponse(ResponseText, HttpStatusCode, IRN, RespMsg, NewStatus);
            IRNLog.Status := NewStatus;
            IRNLog.IRN := CopyStr(IRN, 1, MaxStrLen(IRNLog.IRN));
            IRNLog."Response Message" := CopyStr(RespMsg, 1, MaxStrLen(IRNLog."Response Message"));
            if NewStatus = NewStatus::Failed then
                IRNLog."Error Message" := CopyStr(ResponseText, 1, MaxStrLen(IRNLog."Error Message"));
        end;

        SaveLog(IRNLog);
        UpdateInvoiceHeader(SalesInvHeader."No.", IRNLog);

        exit(IRNLog.Status);
    end;

    // ----------------------------------------------------------------------------------
    // QR code (optional)
    // ----------------------------------------------------------------------------------

    /// <summary>Batch QR generation from the Posted Sales Invoices list.</summary>
    procedure GenerateQRForSelected(var SalesInvHeader: Record "Sales Invoice Header")
    var
        NRSSetup: Record "NRS Setup";
        TotalCount: Integer;
        SuccessCount: Integer;
        FailCount: Integer;
    begin
        NRSSetup.CheckReadyForQR();

        if SalesInvHeader.IsEmpty() then begin
            Message(NothingSelectedTxt);
            exit;
        end;

        if not Confirm(QRConfirmTxt, false, SalesInvHeader.Count()) then
            exit;

        SalesInvHeader.FindSet();
        repeat
            TotalCount += 1;
            if GenerateQRForInvoice(SalesInvHeader) then
                SuccessCount += 1
            else
                FailCount += 1;
        until SalesInvHeader.Next() = 0;

        Message(QRSummaryTxt, TotalCount, SuccessCount, FailCount);
    end;

    /// <summary>Generates and stores the QR code for one invoice. Returns true on success.</summary>
    procedure GenerateQRForInvoice(SalesInvHeader: Record "Sales Invoice Header"): Boolean
    var
        NRSSetup: Record "NRS Setup";
        IRNLog: Record "NRS IRN Log";
        ClientSecret: SecretText;
        InvoiceNumber: Text;
        IssuanceDate: Text;
        ResponseText: Text;
        QRBase64: Text;
        RespMsg: Text;
        HttpStatusCode: Integer;
        Sent: Boolean;
        Ok: Boolean;
    begin
        NRSSetup.CheckReadyForQR();

        InvoiceNumber := SalesInvHeader."No.";
        IssuanceDate := Format(SalesInvHeader."Posting Date", 0, '<Year4><Month,2><Day,2>');
        ClientSecret := NRSSetup.GetClientSecret();

        Sent := SendGenerateQR(NRSSetup, ClientSecret, InvoiceNumber, IssuanceDate, HttpStatusCode, ResponseText);

        GetOrInitLog(IRNLog, Database::"Sales Invoice Header", SalesInvHeader."No.");
        if IRNLog."Entry No." = 0 then begin
            IRNLog."Posting Date" := SalesInvHeader."Posting Date";
            IRNLog."Invoice Number" := CopyStr(InvoiceNumber, 1, MaxStrLen(IRNLog."Invoice Number"));
            IRNLog."Business ID" := NRSSetup."Business ID";
            IRNLog."Service ID" := NRSSetup."Service ID";
        end;
        IRNLog."HTTP Status Code" := HttpStatusCode;

        if Sent then begin
            ParseQRResponse(ResponseText, QRBase64, RespMsg);
            if QRBase64 <> '' then begin
                IRNLog.SetQRCode(QRBase64);
                IRNLog."Has QR Code" := true;
                IRNLog."QR Generated At" := CurrentDateTime();
                if RespMsg <> '' then
                    IRNLog."Response Message" := CopyStr(RespMsg, 1, MaxStrLen(IRNLog."Response Message"));
                Ok := true;
            end else
                IRNLog."Error Message" := CopyStr(ResponseText, 1, MaxStrLen(IRNLog."Error Message"));
        end else
            IRNLog."Error Message" := CopyStr(ConnErrTxt, 1, MaxStrLen(IRNLog."Error Message"));

        SaveLog(IRNLog);
        exit(Ok);
    end;

    /// <summary>Decodes the stored QR base64 into an image and opens the viewer for the invoice.</summary>
    procedure ShowQRForInvoice(SalesInvHeader: Record "Sales Invoice Header")
    var
        IRNLog: Record "NRS IRN Log";
        QRBuffer: Record "NRS QR Buffer";
        Base64Convert: Codeunit "Base64 Convert";
        TempBlob: Codeunit "Temp Blob";
        OutStr: OutStream;
        InStr: InStream;
        Base64Value: Text;
    begin
        IRNLog.SetRange("Source Table No.", Database::"Sales Invoice Header");
        IRNLog.SetRange("Document No.", SalesInvHeader."No.");
        if not IRNLog.FindFirst() then begin
            Message(NoQRTxt);
            exit;
        end;
        Base64Value := IRNLog.GetQRCode();
        if Base64Value = '' then begin
            Message(NoQRTxt);
            exit;
        end;

        if not QRBuffer.Get(SalesInvHeader."No.") then begin
            QRBuffer.Init();
            QRBuffer."Document No." := SalesInvHeader."No.";
            QRBuffer.Insert();
        end;
        Clear(QRBuffer."QR Image");
        QRBuffer.IRN := IRNLog.IRN;

        TempBlob.CreateOutStream(OutStr);
        Base64Convert.FromBase64(Base64Value, OutStr);
        TempBlob.CreateInStream(InStr);
        QRBuffer."QR Image".ImportStream(InStr, QRBuffer."Document No.");
        QRBuffer.Modify();

        QRBuffer.SetRecFilter();
        Page.Run(Page::"NRS QR Code", QRBuffer);
    end;

    local procedure SendGenerateQR(NRSSetup: Record "NRS Setup"; ClientSecret: SecretText; InvoiceNumber: Text; IssuanceDate: Text; var HttpStatusCode: Integer; var ResponseText: Text): Boolean
    var
        Crypto: Codeunit "Cryptography Management";
        Body: JsonObject;
        HmacAlg: Option HMACMD5,HMACSHA1,HMACSHA256,HMACSHA384,HMACSHA512;
        RawBody: Text;
        Timestamp: Text;
        Signature: Text;
        EndpointUrl: Text;
    begin
        Body.Add('invoice_number', InvoiceNumber);
        Body.Add('service_id', NRSSetup."Service ID");
        Body.Add('issuance_date', IssuanceDate);
        Body.Add('business_id', NRSSetup."Business ID");
        Body.Add('certificate', NRSSetup.GetCertificate());
        Body.WriteTo(RawBody);

        Timestamp := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z');
        Signature := Crypto.GenerateHashAsBase64String(RawBody + Timestamp, ClientSecret, HmacAlg::HMACSHA256);
        EndpointUrl := BuildUrl(NRSSetup."Base URL", GenerateQrPathTok);

        HttpStatusCode := 0;
        ResponseText := '';
        exit(TrySend(EndpointUrl, NRSSetup."API Key", Signature, Timestamp, RawBody, HttpStatusCode, ResponseText));
    end;

    local procedure ParseQRResponse(ResponseText: Text; var QRBase64: Text; var RespMsg: Text)
    var
        Json: JsonObject;
        DataToken: JsonToken;
        Tok: JsonToken;
    begin
        QRBase64 := '';
        RespMsg := '';
        if Json.ReadFrom(ResponseText) then begin
            if Json.Get('message', Tok) then
                if not Tok.AsValue().IsNull() then
                    RespMsg := Tok.AsValue().AsText();
            if Json.Get('data', DataToken) then
                if DataToken.IsObject() then
                    if DataToken.AsObject().Get('qr_code_base64', Tok) then
                        if not Tok.AsValue().IsNull() then
                            QRBase64 := Tok.AsValue().AsText();
        end;
    end;

    // ----------------------------------------------------------------------------------
    // Low-level request
    // ----------------------------------------------------------------------------------

    /// <summary>
    /// Signs a JSON body and POSTs it to a resource path under the configured Base URL.
    /// Returns true if a response was received (fills HTTP status + text). Caller must ensure setup is ready.
    /// Shared by the IRN, QR and Validate flows.
    /// </summary>
    procedure SendSigned(ResourcePath: Text; RawBody: Text; var HttpStatusCode: Integer; var ResponseText: Text): Boolean
    var
        NRSSetup: Record "NRS Setup";
        Crypto: Codeunit "Cryptography Management";
        ClientSecret: SecretText;
        HmacAlg: Option HMACMD5,HMACSHA1,HMACSHA256,HMACSHA384,HMACSHA512;
        Timestamp: Text;
        Signature: Text;
        EndpointUrl: Text;
    begin
        NRSSetup.GetRecordOnce();
        ClientSecret := NRSSetup.GetClientSecret();
        Timestamp := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z');
        Signature := Crypto.GenerateHashAsBase64String(RawBody + Timestamp, ClientSecret, HmacAlg::HMACSHA256);
        EndpointUrl := BuildUrl(NRSSetup."Base URL", ResourcePath);
        HttpStatusCode := 0;
        ResponseText := '';
        exit(TrySend(EndpointUrl, NRSSetup."API Key", Signature, Timestamp, RawBody, HttpStatusCode, ResponseText));
    end;

    local procedure SendGenerateIRN(NRSSetup: Record "NRS Setup"; ClientSecret: SecretText; InvoiceNumber: Text; IssuanceDate: Text; var HttpStatusCode: Integer; var ResponseText: Text): Boolean
    var
        Crypto: Codeunit "Cryptography Management";
        Body: JsonObject;
        HmacAlg: Option HMACMD5,HMACSHA1,HMACSHA256,HMACSHA384,HMACSHA512;
        RawBody: Text;
        Timestamp: Text;
        Signature: Text;
        EndpointUrl: Text;
    begin
        // Body - the four required Generate IRN parameters
        Body.Add('invoice_number', InvoiceNumber);
        Body.Add('service_id', NRSSetup."Service ID");
        Body.Add('issuance_date', IssuanceDate);
        Body.Add('business_id', NRSSetup."Business ID");
        Body.WriteTo(RawBody);

        // ISO-8601 UTC timestamp (CurrentDateTime is UTC on BC SaaS), +/- 5 min window allowed.
        Timestamp := Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z');

        // Sign the exact bytes we send. Secret key is treated as a UTF-8 string.
        Signature := Crypto.GenerateHashAsBase64String(RawBody + Timestamp, ClientSecret, HmacAlg::HMACSHA256);
        EndpointUrl := BuildUrl(NRSSetup."Base URL", GenerateIrnPathTok);

        HttpStatusCode := 0;
        ResponseText := '';
        exit(TrySend(EndpointUrl, NRSSetup."API Key", Signature, Timestamp, RawBody, HttpStatusCode, ResponseText));
    end;

    [TryFunction]
    local procedure TrySend(EndpointUrl: Text; ApiKey: Text; Signature: Text; Timestamp: Text; RawBody: Text; var HttpStatusCode: Integer; var ResponseText: Text)
    var
        Client: HttpClient;
        RequestMsg: HttpRequestMessage;
        ResponseMsg: HttpResponseMessage;
        Content: HttpContent;
        ContentHeaders: HttpHeaders;
        RequestHeaders: HttpHeaders;
    begin
        Content.WriteFrom(RawBody);
        Content.GetHeaders(ContentHeaders);
        if ContentHeaders.Contains('Content-Type') then
            ContentHeaders.Remove('Content-Type');
        ContentHeaders.Add('Content-Type', 'application/json');

        RequestMsg.Content := Content;
        RequestMsg.Method := 'POST';
        RequestMsg.SetRequestUri(EndpointUrl);
        RequestMsg.GetHeaders(RequestHeaders);
        RequestHeaders.Add('x-api-key', ApiKey);
        RequestHeaders.Add('x-api-signature', Signature);
        RequestHeaders.Add('x-api-timestamp', Timestamp);

        if not Client.Send(RequestMsg, ResponseMsg) then
            Error(ConnErrTxt);

        HttpStatusCode := ResponseMsg.HttpStatusCode();
        ResponseMsg.Content.ReadAs(ResponseText);
    end;

    local procedure ParseResponse(ResponseText: Text; HttpStatusCode: Integer; var IRN: Text; var RespMsg: Text; var NewStatus: Enum "NRS IRN Status")
    var
        Json: JsonObject;
        DataToken: JsonToken;
        Tok: JsonToken;
    begin
        IRN := '';
        RespMsg := '';

        if Json.ReadFrom(ResponseText) then begin
            if Json.Get('message', Tok) then
                if not Tok.AsValue().IsNull() then
                    RespMsg := Tok.AsValue().AsText();
            if Json.Get('data', DataToken) then
                if DataToken.IsObject() then
                    if DataToken.AsObject().Get('irn', Tok) then
                        if not Tok.AsValue().IsNull() then
                            IRN := Tok.AsValue().AsText();
        end;

        case true of
            (HttpStatusCode = 200) or (HttpStatusCode = 201):
                if IRN <> '' then
                    NewStatus := NewStatus::Generated
                else
                    NewStatus := NewStatus::Failed;
            HttpStatusCode = 409:
                NewStatus := NewStatus::Duplicate;
            else
                NewStatus := NewStatus::Failed;
        end;

        if (NewStatus = NewStatus::Failed) and (RespMsg = '') then
            RespMsg := CopyStr(ResponseText, 1, 250);
    end;

    // ----------------------------------------------------------------------------------
    // Persistence helpers
    // ----------------------------------------------------------------------------------

    local procedure GetOrInitLog(var IRNLog: Record "NRS IRN Log"; TableNo: Integer; DocNo: Code[20])
    begin
        IRNLog.Reset();
        IRNLog.SetRange("Source Table No.", TableNo);
        IRNLog.SetRange("Document No.", DocNo);
        if IRNLog.FindFirst() then
            exit;
        IRNLog.Init();
        IRNLog."Entry No." := 0;
        IRNLog."Source Table No." := TableNo;
        IRNLog."Document No." := DocNo;
    end;

    local procedure SaveLog(var IRNLog: Record "NRS IRN Log")
    begin
        if IRNLog."Entry No." = 0 then
            IRNLog.Insert(true)
        else
            IRNLog.Modify(true);
    end;

    local procedure UpdateInvoiceHeader(DocNo: Code[20]; var IRNLog: Record "NRS IRN Log")
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        if not SalesInvHeader.Get(DocNo) then
            exit;
        SalesInvHeader."NRS IRN" := CopyStr(IRNLog.IRN, 1, MaxStrLen(SalesInvHeader."NRS IRN"));
        SalesInvHeader."NRS IRN Status" := IRNLog.Status;
        SalesInvHeader."NRS IRN Log Entry No." := IRNLog."Entry No.";
        SalesInvHeader."NRS IRN Generated At" := IRNLog."Generated At";
        SalesInvHeader.Modify(false);
    end;

    local procedure BuildUrl(BaseUrl: Text; ResourcePath: Text): Text
    begin
        if BaseUrl.EndsWith('/') then
            BaseUrl := CopyStr(BaseUrl, 1, StrLen(BaseUrl) - 1);
        if ResourcePath.StartsWith('/') then
            ResourcePath := CopyStr(ResourcePath, 2);
        exit(BaseUrl + '/' + ResourcePath);
    end;
}
