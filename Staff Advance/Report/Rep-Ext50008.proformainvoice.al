reportextension 50008 "Proforma Inv. Ext" extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        add(Line)
        {
            // Bound to a PICTURE content control in the Word layout.
            // Never returns an empty string - see codeunit 50110.
            column(ItemPictureBase64; ItemPicture64)
            {
            }
 
            column(RackRate; Line."Unit Price")
            {
            }
 
            // Diagnostic only - bind to a text content control while you are
            // chasing the missing-lines issue, then remove it again.
            // column(LineTypeText; Format(Line.Type))
            // {
            // }
        }
 
        add(Header)
        {
            column(AmountInWords; AmountInWordsTxt)
            {
            }
            column(CustomerName; CustomerNameTxt)
            {
            }
            column(companyInfo; Tin)
            {
            }
            column(validityDate; Header."Quote Valid Until Date")
            {
            }
        }
 
        modify(Header)
        {
            trigger OnAfterAfterGetRecord()
            var
                TotalInclVAT: Decimal;
                CurrText: Text[30];
                SubUnitText: Text[30];
            begin
                TotalInclVAT := GetDocumentTotalInclVAT(Header);
 
                if Header."Currency Code" = '' then begin
                    CurrText := NairaTok;
                    SubUnitText := KoboTok;
                end else begin
                    CurrText := Header."Currency Code";
                    SubUnitText := SubUnitTok;
                end;
 
                AmountInWordsTxt := CopyStr(
                    AmtInWord.figure(TotalInclVAT, CurrText, SubUnitText), 1, MaxStrLen(AmountInWordsTxt));
 
                if CompanyInfoRec.Get() then
                    Tin := CompanyInfoRec."VAT Registration No."
                else
                    Clear(Tin);
 
                // Header IS the Sales Header record - no second lookup needed.
                CustomerNameTxt := Header."Bill-to Name";
            end;
        }
 
        modify(Line)
        {
            trigger OnAfterAfterGetRecord()
            begin
                ItemPicture64 := ProformaImageMgt.GetItemPictureBase64(Line.Type, Line."No.");
            end;
        }
    }
 
    var
        ProformaImageMgt: Codeunit "Proforma Image Mgt.";
        AmtInWord: Codeunit AmountInWord;
        CompanyInfoRec: Record "Company Information";
        ItemPicture64: Text;
        AmountInWordsTxt: Text[250];
        CustomerNameTxt: Text[100];
        Tin: Code[50];
        NairaTok: Label 'NAIRA', Locked = true;
        KoboTok: Label 'KOBO', Locked = true;
        SubUnitTok: Label 'SUBUNIT', Locked = true;
 
    /// <summary>
    /// Total including VAT for the document, matching the Total row in the layout.
    /// Returns a value rather than accumulating into a global, so repeat runs
    /// and multi-document print jobs stay correct.
    /// </summary>
    local procedure GetDocumentTotalInclVAT(var SalesHeader: Record "Sales Header"): Decimal
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.CalcSums("Amount Including VAT");
        exit(SalesLine."Amount Including VAT");
    end;
}
 
 