page 50394 "NRS Received Invoice"
{
    Caption = 'NRS Received Invoice';
    PageType = Document;
    ApplicationArea = All;
    SourceTable = "NRS Received Invoice";
    InsertAllowed = false;
    DeleteAllowed = false;
    Editable = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("IRN"; Rec."IRN") { ApplicationArea = All; ToolTip = 'Invoice Reference Number.'; }
                field("Invoice Type Code"; Rec."Invoice Type Code") { ApplicationArea = All; ToolTip = 'Invoice type code (380 invoice, 381 credit note, 383 debit note).'; }
                field("Issue Date"; Rec."Issue Date") { ApplicationArea = All; ToolTip = 'Issue date.'; }
                field("Due Date"; Rec."Due Date") { ApplicationArea = All; ToolTip = 'Due date.'; }
                field("Payment Status"; Rec."Payment Status") { ApplicationArea = All; ToolTip = 'Payment status.'; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; ToolTip = 'Currency.'; }
                field("Pulled At"; Rec."Pulled At") { ApplicationArea = All; ToolTip = 'When this invoice was pulled from NRS.'; }
            }
            group(Supplier)
            {
                Caption = 'Supplier';
                field("Supplier Name"; Rec."Supplier Name") { ApplicationArea = All; ToolTip = 'Supplier name.'; }
                field("Supplier TIN"; Rec."Supplier TIN") { ApplicationArea = All; ToolTip = 'Supplier TIN.'; }
                field("Supplier Email"; Rec."Supplier Email") { ApplicationArea = All; ToolTip = 'Supplier email.'; }
            }
            group(Customer)
            {
                Caption = 'Customer';
                field("Customer Name"; Rec."Customer Name") { ApplicationArea = All; ToolTip = 'Customer name.'; }
                field("Customer TIN"; Rec."Customer TIN") { ApplicationArea = All; ToolTip = 'Customer TIN.'; }
            }
            part(Lines; "NRS Received Invoice Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = IRN = field(IRN);
            }
            group(Totals)
            {
                Caption = 'Totals';
                field("Tax Exclusive Amount"; Rec."Tax Exclusive Amount") { ApplicationArea = All; ToolTip = 'Total excluding VAT.'; }
                field("Tax Amount"; Rec."Tax Amount") { ApplicationArea = All; ToolTip = 'VAT amount.'; }
                field("Tax Inclusive Amount"; Rec."Tax Inclusive Amount") { ApplicationArea = All; ToolTip = 'Total including VAT.'; }
                field("Payable Amount"; Rec."Payable Amount") { ApplicationArea = All; ToolTip = 'Amount payable.'; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RefreshCard)
            {
                ApplicationArea = All;
                Caption = 'Refresh from NRS';
                ToolTip = 'Re-pull this invoice from NRS to update its status and details.';
                Image = RefreshLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;

                trigger OnAction()
                var
                    PullMgt: Codeunit "NRS Pull Invoice Mgt.";
                begin
                    PullMgt.PullInvoice(Rec.IRN);
                    CurrPage.Update(false);
                end;
            }
            action(ShowRaw)
            {
                ApplicationArea = All;
                Caption = 'Download Response JSON';
                ToolTip = 'Downloads the raw JSON response received from NRS for this invoice.';
                Image = Export;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    BodyText: Text;
                    FileName: Text;
                begin
                    BodyText := Rec.GetRawResponse();
                    if BodyText = '' then begin
                        Message('No raw response stored for this invoice.');
                        exit;
                    end;
                    TempBlob.CreateOutStream(OutStr, TextEncoding::UTF8);
                    OutStr.Write(BodyText);
                    TempBlob.CreateInStream(InStr, TextEncoding::UTF8);
                    FileName := 'NRS-Received-' + Rec.IRN + '.json';
                    DownloadFromStream(InStr, '', '', '', FileName);
                end;
            }
        }
    }
}
