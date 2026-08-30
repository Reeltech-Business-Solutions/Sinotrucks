codeunit 50111 "Pro Forma Line Mgt."
{
    Access = Public;

    /// <summary>
    /// Report 1302 restricts its Line data item with SetRange(Type, Type::Item)
    /// in OnPreDataItem, which is why G/L account, resource, fixed asset and
    /// charge lines never reach the layout. This subscriber runs after that
    /// trigger, so replacing the filter here decides which lines print.
    ///
    /// "Everything except comment lines" is expressed the way the base
    /// application expresses it (see codeunits "Document Totals" and
    /// "Lines-Instruction Mgt."): a filter on Type, excluding Type::" ".
    /// Comment lines are printed inside the box of the line above them by
    /// report extension 50008 instead of getting a row of their own.
    /// </summary>
    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Pro Forma Inv", 'OnAfterLineOnPreDataItem', '', false, false)]
    local procedure ShowAllLineTypesExceptComments(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    begin
        SalesLine.SetFilter(Type, '<>%1', SalesLine.Type::" ");
    end;

    /// <summary>
    /// GetItemForRec calls Item.Get() unguarded for every line, so the report
    /// would error on the first non-item line once the filter above is lifted.
    /// The lookup is suppressed only for lines with no matching item, which
    /// keeps the Tariff and Country of Manufacturing columns working for items.
    /// </summary>
    [EventSubscriber(ObjectType::Report, Report::"Standard Sales - Pro Forma Inv", 'OnBeforeGetItemForRec', '', false, false)]
    local procedure SkipItemLookupForNonItemLines(ItemNo: Code[20]; var IsHandled: Boolean)
    var
        Item: Record Item;
    begin
        if IsHandled then
            exit;
        IsHandled := not Item.Get(ItemNo);
    end;
}