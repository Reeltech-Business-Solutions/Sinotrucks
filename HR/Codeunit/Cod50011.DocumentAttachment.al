codeunit 50052 DocumentAttachment
{
    [EventSubscriber(ObjectType::Page, Page::"Doc. Attachment List Factbox", 'OnAfterGetRecRefFail', '', false, false)]
    local procedure OnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var

        HRemp: Record "HR Employees";
        HRLeav: Record "HR Leave Application";

    begin
        case DocumentAttachment."Table ID" of
            DATABASE::"HR Employees":
                begin
                    RecRef.Open(Database::"HR Employees");
                    // HRemp.SetFilter(HRemp."No.", DocumentAttachment."No.");
                    // if HRemp.FindFirst() then
                    If HRemp.get(DocumentAttachment."No.") then
                        RecRef.GetTable(HRemp);
                end;

        end;

        case DocumentAttachment."Table ID" of
            DATABASE::"HR Leave Application":
                begin
                    RecRef.Open(Database::"HR Leave Application");
                    // HRemp.SetFilter(HRemp."No.", DocumentAttachment."No.");
                    // if HRemp.FindFirst() then
                    If HRLeav.get(DocumentAttachment."No.") then
                        RecRef.GetTable(HRLeav);
                end;


        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        RecNo: Code[20];
        FieldRef: FieldRef;

    begin

        case RecRef.Number of
            DATABASE::"HR Employees":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

        end;

        case RecRef.Number of
            DATABASE::"HR Leave Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

        end;

    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure OnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];

    begin
        case RecRef.Number of
            DATABASE::"HR Employees":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

        end;

        case RecRef.Number of
            DATABASE::"HR Leave Application":
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

        end;


    end;

    var
        HRemp: Record "HR Employees";
        RecNo: Code[20];

        FieldRef: FieldRef;
        AttachmentDocumentType: enum "Attachment Document Type";

}
