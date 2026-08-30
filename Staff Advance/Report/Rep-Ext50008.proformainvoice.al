reportextension 50008 "Proforma Inv. Ext" extends "Standard Sales - Pro Forma Inv"
{
    dataset
    {
        add(Line)
        {
            // Bound to a PICTURE content control in the Word layout.
            // Never returns an empty string - see codeunit 50110.
            // Non-item lines get a transparent placeholder.
            column(ItemPictureBase64; ItemPicture64)
            {
            }

            column(RackRate; Line."Unit Price")
            {
            }

            // The line's own description followed by the comment lines that sit
            // under it, separated by line breaks. The description cell in the Word
            // layout binds to this instead of ItemDescription, so a comment lands in
            // the same box as its item rather than on a row of its own. The comment
            // lines themselves are kept out of the dataset by codeunit 50111.
            column(DescriptionWithComments; DescriptionWithCommentsTxt)
            {
            }
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
            trigger OnBeforeAfterGetRecord()
            begin
                // Second, independent guard. Codeunit 50111 already filters comment
                // lines out of the data item; this drops any that reach the report
                // anyway, so a single failing mechanism cannot put a comment back on
                // a row of its own. Blank placeholder lines go the same way.
                if Line.Type = Line.Type::" " then
                    CurrReport.Skip();
            end;

            trigger OnAfterAfterGetRecord()
            begin
                ItemPicture64 := ProformaImageMgt.GetItemPictureBase64(Line.Type, Line."No.");
                DescriptionWithCommentsTxt := BuildDescriptionWithComments(Line);

                // The base report binds its ItemDescription column straight to
                // Line.Description (report 1302, "column(ItemDescription; Description)"),
                // and the column is read after this trigger. Writing the folded text
                // back into the field therefore feeds the description cell of any
                // layout, including one that was built before DescriptionWithComments
                // existed. The record is never modified in the database.
                Line.Description := CopyStr(DescriptionWithCommentsTxt, 1, MaxStrLen(Line.Description));
            end;
        }
    }

    var
        ProformaImageMgt: Codeunit "Proforma Image Mgt.";
        AmtInWord: Codeunit AmountInWord;
        TypeHelper: Codeunit "Type Helper";
        CompanyInfoRec: Record "Company Information";
        ItemPicture64: Text;
        DescriptionWithCommentsTxt: Text;
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

    /// <summary>
    /// The text for one description cell: this line's description plus every
    /// comment line that follows it, up to the next line that gets a row of its
    /// own. Comments that open the document have nothing above them to sit under,
    /// so they are placed on top of the first line that does get a row instead of
    /// being lost.
    /// </summary>
    local procedure BuildDescriptionWithComments(var SalesLine: Record "Sales Line") Result: Text
    var
        OtherLine: Record "Sales Line";
    begin
        if not HasPrintedLineBefore(SalesLine) then begin
            FilterToDocument(OtherLine, SalesLine);
            OtherLine.SetFilter("Line No.", '<%1', SalesLine."Line No.");
            if OtherLine.FindSet() then
                repeat
                    if IsCommentLine(OtherLine) then
                        Result := AppendLine(Result, GetLineText(OtherLine));
                until OtherLine.Next() = 0;
        end;

        Result := AppendLine(Result, GetLineText(SalesLine));

        FilterToDocument(OtherLine, SalesLine);
        OtherLine.SetFilter("Line No.", '>%1', SalesLine."Line No.");
        if OtherLine.FindSet() then
            repeat
                if IsPrintedLine(OtherLine) then
                    exit;
                if IsCommentLine(OtherLine) then
                    Result := AppendLine(Result, GetLineText(OtherLine));
            until OtherLine.Next() = 0;
    end;

    local procedure HasPrintedLineBefore(var SalesLine: Record "Sales Line"): Boolean
    var
        PrecedingLine: Record "Sales Line";
    begin
        FilterToDocument(PrecedingLine, SalesLine);
        PrecedingLine.SetFilter("Line No.", '<%1', SalesLine."Line No.");
        PrecedingLine.SetFilter(Type, '<>%1', SalesLine.Type::" ");
        exit(not PrecedingLine.IsEmpty());
    end;

    local procedure FilterToDocument(var TargetLine: Record "Sales Line"; var SourceLine: Record "Sales Line")
    begin
        TargetLine.Reset();
        TargetLine.SetRange("Document Type", SourceLine."Document Type");
        TargetLine.SetRange("Document No.", SourceLine."Document No.");
    end;

    /// <summary>
    /// A line that gets a row of its own, matching the filter codeunit 50111
    /// puts on the data item.
    /// </summary>
    local procedure IsPrintedLine(var SalesLine: Record "Sales Line"): Boolean
    begin
        exit(SalesLine.Type <> SalesLine.Type::" ");
    end;

    /// <summary>
    /// A comment line: Type is blank (shown as "Comment" on the page) and it
    /// carries text. "No." is deliberately not tested - a comment line may well
    /// have a number picked on it, e.g. MD. Blank placeholder lines have no text
    /// and so are neither printed nor folded in.
    /// </summary>
    local procedure IsCommentLine(var SalesLine: Record "Sales Line"): Boolean
    begin
        exit(
            (SalesLine.Type = SalesLine.Type::" ") and
            ((SalesLine.Description <> '') or (SalesLine."Description 2" <> '')));
    end;

    local procedure GetLineText(var SalesLine: Record "Sales Line") Result: Text
    begin
        Result := SalesLine.Description;
        if SalesLine."Description 2" <> '' then
            if Result <> '' then
                Result := Result + ' ' + SalesLine."Description 2"
            else
                Result := SalesLine."Description 2";
    end;

    local procedure AppendLine(ExistingText: Text; AddedText: Text): Text
    begin
        if AddedText = '' then
            exit(ExistingText);
        if ExistingText = '' then
            exit(AddedText);
        exit(ExistingText + TypeHelper.LFSeparator() + AddedText);
    end;
}