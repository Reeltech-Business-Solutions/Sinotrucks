codeunit 50084 "Page Management.ext"
{
    trigger onRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, 700, 'OnAfterGetPageID', '', false, false)]
    local procedure OnAfterGetPageID(RecordRef: RecordRef; var PageID: Integer)
    begin
        if PageID = 0 then
            PageID := GetConditionalCardPageID(RecordRef);
    end;

    local procedure GetConditionalCardPageID(RecordRef: RecordRef): Integer
    var
        CardPageID: Integer;
        LVE: Record "HR Leave Application";
        LEAVACKNW: Record "HR Leave Acknowledgement";

    begin
        case
            RecordRef.Number of
            DATABASE::"HR Leave Application":
                exit(page::"HR Leave Application Card")

        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetConditionalListPageID(RecRef: RecordRef; var PageID: Integer; var IsHandled: Boolean);
    begin
    end;

}
