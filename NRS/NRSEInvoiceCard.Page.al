page 50187 "NRS E-Invoice Card"
{
    Caption = 'NRS E-Invoice';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "NRS IRN Log";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Invoice)
            {
                Caption = 'Invoice';

                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the posted sales invoice number.';
                }
                field(CustomerName; CustomerName)
                {
                    Caption = 'Customer';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the bill-to customer.';
                }
                field(SellToCustNo; SellToCustNo)
                {
                    Caption = 'Customer No.';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the customer number.';
                }
                field(PostingDate; PostingDate)
                {
                    Caption = 'Posting Date';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the posting date.';
                }
                field(DueDate; DueDate)
                {
                    Caption = 'Due Date';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the due date.';
                }
                field(CurrencyCode; CurrencyCode)
                {
                    Caption = 'Currency Code';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the invoice currency.';
                }
            }
            part(Lines; "Posted Sales Invoice Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("Document No.");
                Editable = false;
            }
            group(Totals)
            {
                Caption = 'Totals';

                field(TotalAmount; TotalAmount)
                {
                    Caption = 'Amount';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the total excluding VAT.';
                }
                field(TotalInclVAT; TotalInclVAT)
                {
                    Caption = 'Amount Including VAT';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the total including VAT.';
                }
            }
            group(EInvoice)
            {
                Caption = 'NRS E-Invoice';

                field(IRN; Rec.IRN)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the Invoice Reference Number.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the IRN status. You can override it here.';

                    trigger OnValidate()
                    begin
                        Rec.SyncStatusToDocument();
                    end;
                }
                field("Validation Status"; Rec."Validation Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the validation status. You can override it here.';
                }
                field("Response Message"; Rec."Response Message")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the latest message from NRS.';
                }
                field("Validation Message"; Rec."Validation Message")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the validation message from NRS, including the specific fields it rejected.';
                }
                field("Error Message"; Rec."Error Message")
                {
                    ApplicationArea = All;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Specifies the full raw response body from NRS when a call fails. Read this for the exact validation errors.';
                }
                field("HTTP Status Code"; Rec."HTTP Status Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the HTTP status code returned by NRS (e.g. 200 = OK, 400 = validation error).';
                }
                field("Generated At"; Rec."Generated At")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies when the IRN was generated.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(GenerateIRN)
            {
                ApplicationArea = All;
                Caption = 'Generate IRN';
                ToolTip = 'Generates (or re-generates) the IRN for this invoice.';
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    if SalesInvHeader.Get(Rec."Document No.") then
                        EInvoiceMgt.GenerateForInvoice(SalesInvHeader, true);
                    CurrPage.Update(false);
                end;
            }
            action(GenerateQR)
            {
                ApplicationArea = All;
                Caption = 'Generate QR Code';
                ToolTip = 'Generates the QR code for this invoice.';
                Image = Purchasing;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    EInvoiceMgt: Codeunit "NRS E-Invoice Mgt.";
                begin
                    if SalesInvHeader.Get(Rec."Document No.") then begin
                        EInvoiceMgt.GenerateQRForInvoice(SalesInvHeader);
                        EInvoiceMgt.ShowQRForInvoice(SalesInvHeader);
                    end;
                    CurrPage.Update(false);
                end;
            }
            action(ValidateInvoice)
            {
                ApplicationArea = All;
                Caption = 'Validate';
                ToolTip = 'Validates this invoice against NRS.';
                Image = CheckList;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                    ValidateMgt: Codeunit "NRS Validate Invoice Mgt.";
                begin
                    if SalesInvHeader.Get(Rec."Document No.") then
                        ValidateMgt.ValidateForInvoice(SalesInvHeader);
                    CurrPage.Update(false);
                end;
            }
            action(DownloadRequestJson)
            {
                ApplicationArea = All;
                Caption = 'Download Request JSON';
                ToolTip = 'Downloads the exact JSON payload last sent to NRS for this invoice (for troubleshooting).';
                Image = Export;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    BodyText: Text;
                    FileName: Text;
                begin
                    BodyText := Rec.GetRequestBody();
                    if BodyText = '' then begin
                        Message('No request has been captured yet. Sign or validate this invoice first, then try again.');
                        exit;
                    end;
                    TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
                    OutStr.Write(BodyText);
                    TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
                    FileName := 'NRS-Request-' + Rec."Document No." + '.json';
                    DownloadFromStream(InStr, '', '', '', FileName);
                end;
            }
            action(ViewReport)
            {
                ApplicationArea = All;
                Caption = 'View Invoice Report';
                ToolTip = 'Previews/prints the NRS e-invoice report, including the QR code.';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader.SetRange("No.", Rec."Document No.");
                    Report.Run(Report::"NRS E-Invoice", true, false, SalesInvHeader);
                end;
            }
            action(OpenPostedInvoice)
            {
                ApplicationArea = All;
                Caption = 'Open Posted Invoice';
                ToolTip = 'Opens the underlying posted sales invoice.';
                Image = Invoice;

                trigger OnAction()
                begin
                    Rec.ShowDocument();
                end;
            }
        }
    }

    var
        CustomerName: Text[100];
        SellToCustNo: Code[20];
        CurrencyCode: Code[10];
        PostingDate: Date;
        DueDate: Date;
        TotalAmount: Decimal;
        TotalInclVAT: Decimal;

    trigger OnAfterGetRecord()
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        Clear(CustomerName);
        Clear(SellToCustNo);
        Clear(CurrencyCode);
        Clear(PostingDate);
        Clear(DueDate);
        Clear(TotalAmount);
        Clear(TotalInclVAT);
        if Rec."Source Table No." <> Database::"Sales Invoice Header" then
            exit;
        if not SalesInvHeader.Get(Rec."Document No.") then
            exit;
        CustomerName := CopyStr(SalesInvHeader."Bill-to Name", 1, MaxStrLen(CustomerName));
        SellToCustNo := SalesInvHeader."Bill-to Customer No.";
        CurrencyCode := SalesInvHeader."Currency Code";
        PostingDate := SalesInvHeader."Posting Date";
        DueDate := SalesInvHeader."Due Date";
        TotalAmount := SalesInvHeader.Amount;
        TotalInclVAT := SalesInvHeader."Amount Including VAT";
    end;
}
