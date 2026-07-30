codeunit 50148 APIAttachmentStaffClaim
{

    procedure StaffClaimAttachment(inputJson: Text): Text
    var
        StaffClaimJsonResponse: JsonObject;
        StaffClaimJsonToken: JsonToken;
        StaffClaim: Record "Staff Claims Header";
        StaffClaimNo: Code[20];
        AttachmentBase64: Text;
        FileName: Text[100];
        FileExtension: Text[10];
        DocAttach: Record "Document Attachment";
        Base64Convert: Codeunit "Base64 Convert";
        Instr: Instream;
        OutStr: OutStream;
        TempBlob: codeunit "Temp Blob";
        ImportSuccess: Boolean;
    begin
        AttachmentBase64 := '';
        FileName := '';
        FileExtension := '';
        ImportSuccess := false;
        StaffClaimJsonResponse.ReadFrom(inputJson);
        if StaffClaimJsonResponse.Get('StaffClaimNo', StaffClaimJsonToken) then
            if StaffClaim.Get(StaffClaimJsonToken.AsValue().AsText()) then
                if StaffClaimJsonResponse.Get('AttachmentBase64', StaffClaimJsonToken) then begin
                    AttachmentBase64 := StaffClaimJsonToken.AsValue().AsText();
                    if AttachmentBase64 <> '' then begin
                        StaffClaimJsonResponse.Get('FileName', StaffClaimJsonToken);
                        FileName := StaffClaimJsonToken.AsValue().AsText();
                        StaffClaimJsonResponse.Get('FileExtension', StaffClaimJsonToken);
                        FileExtension := StaffClaimJsonToken.AsValue().ASText();
                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(AttachmentBase64, OutStr);
                        TempBlob.CreateInStream(InStr);
                        DocAttach.Init();
                        DocAttach.Validate("Table ID", Database::"Staff Claims Header");
                        DocAttach.Validate("No.", StaffClaim."No.");
                        DocAttach.Validate("File Name", FileName);
                        DocAttach.Validate("File Extension", FileExtension);
                        DocAttach."Document Reference ID".ImportStream(InStr, FileName);
                        if DocAttach.Insert(true) then
                            ImportSuccess := true;
                    end;

                end;
        if ImportSuccess then
            exit(StrSubstNo('The attachment %1.%2 is successfully imported into staff claim %3', FileName, FileExtension, StaffClaim."No."))
        else
            exit('Attachment Import Failed');
    end;
}