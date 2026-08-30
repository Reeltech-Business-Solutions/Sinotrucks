codeunit 50110 "Proforma Image Mgt."
{
    Access = Public;

    var
        // 1x1 white PNG with alpha 0. Returned instead of '' so the PICTURE
        // content control in the Word layout always has valid base64 to
        // render. An empty value can make the whole repeating row fail.
        //
        // The pixel is white rather than black so it still disappears if the
        // renderer discards the alpha channel. Do not swap this for one of the
        // "1x1 transparent PNG" strings floating around online - the common one
        // decodes to RGBA(0, 0, 255, 127) and prints as a sky-blue block.
        BlankPngTok: Label 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP4//8/AwAI/AL+eMSysAAAAABJRU5ErkJggg==', Locked = true;

    /// <summary>
    /// Base64 picture for a sales line. Non-item lines, items with no picture,
    /// and unknown item numbers all return a blank placeholder image.
    /// AL has no method overloading, so the line type is handled here rather
    /// than in a second procedure of the same name.
    /// </summary>
    procedure GetItemPictureBase64(LineType: Enum "Sales Line Type"; ItemNo: Code[20]): Text
    begin
        if LineType <> LineType::Item then
            exit(BlankPngTok);
        exit(GetPictureForItem(ItemNo));
    end;

    /// <summary>
    /// Base64 picture for an item, or a blank placeholder if there is none.
    /// </summary>
    procedure GetPictureForItem(ItemNo: Code[20]): Text
    var
        Item: Record Item;
        TenantMedia: Record "Tenant Media";
        Base64Convert: Codeunit "Base64 Convert";
        InStr: InStream;
        MediaId: Guid;
    begin
        if ItemNo = '' then
            exit(BlankPngTok);
        if not Item.Get(ItemNo) then
            exit(BlankPngTok);
        if Item.Picture.Count = 0 then
            exit(BlankPngTok);

        MediaId := Item.Picture.Item(1);
        if not TenantMedia.Get(MediaId) then
            exit(BlankPngTok);

        TenantMedia.CalcFields(Content);
        if not TenantMedia.Content.HasValue() then
            exit(BlankPngTok);

        TenantMedia.Content.CreateInStream(InStr);
        exit(Base64Convert.ToBase64(InStr));
    end;


    procedure HasPicture(ItemNo: Code[20]): Boolean
    var
        Item: Record Item;
    begin
        if ItemNo = '' then
            exit(false);
        if not Item.Get(ItemNo) then
            exit(false);
        exit(Item.Picture.Count > 0);
    end;
}
