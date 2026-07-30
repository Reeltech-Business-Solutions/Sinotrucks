codeunit 50087 "EmployeePageManagementExt.al"
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
        EMP: Record "HR Employees";

    begin
        case
            RecordRef.Number of
            DATABASE::"HR Employees":
                exit(page::"HR Employee Card");

            DATABASE::"HR Leave Acknowledgement":
                exit(Page::"HR Leave Acknowledgement");

        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetConditionalListPageID(RecRef: RecordRef; var PageID: Integer; var IsHandled: Boolean);
    begin
    end;
}
