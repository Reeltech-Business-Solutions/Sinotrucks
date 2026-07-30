codeunit 50144 APIAttachment
{

    procedure StaffAdvAttachment(inputJson: Text): Text
    var
        StaffAdvJsonResponse: JsonObject;
        StaffAdvJsonToken: JsonToken;
        StaffAdvance: Record "Staff Advance Header";
        StaffAdvanceNo: Code[20];
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
        StaffAdvJsonResponse.ReadFrom(inputJson);
        if StaffAdvJsonResponse.Get('staffAdvanceNo', StaffAdvJsonToken) then
            if StaffAdvance.Get(StaffAdvJsonToken.AsValue().AsText()) then
                if StaffAdvJsonResponse.Get('AttachmentBase64', StaffAdvJsonToken) then begin
                    AttachmentBase64 := StaffAdvJsonToken.AsValue().AsText();
                    if AttachmentBase64 <> '' then begin
                        StaffAdvJsonResponse.Get('FileName', StaffAdvJsonToken);
                        FileName := StaffAdvJsonToken.AsValue().AsText();
                        StaffAdvJsonResponse.Get('FileExtension', StaffAdvJsonToken);
                        FileExtension := StaffAdvJsonToken.AsValue().ASText();
                        TempBlob.CreateOutStream(OutStr);
                        Base64Convert.FromBase64(AttachmentBase64, OutStr);
                        TempBlob.CreateInStream(InStr);
                        DocAttach.Init();
                        DocAttach.Validate("Table ID", Database::"Staff Advance Header");
                        DocAttach.Validate("No.", StaffAdvance."No.");
                        DocAttach.Validate("File Name", FileName);
                        DocAttach.Validate("File Extension", FileExtension);
                        DocAttach."Document Reference ID".ImportStream(InStr, FileName);
                        if DocAttach.Insert(true) then
                            ImportSuccess := true;
                    end;

                end;
        if ImportSuccess then
            exit(StrSubstNo('The attachment %1.%2 is successfully imported into staff advance %3', FileName, FileExtension, StaffAdvance."No."))
        else
            exit('Attachment Import Failed');
    end;

    procedure getStaffAdvanceRequest(StaffAdvanceNo: Code[20]): Text
    var
        DocAttach: Record "Document Attachment";
        Base64Convert: Codeunit "Base64 Convert";
        InStr: InStream;
        ResultJson: Text;
        SingleJson: Text;
        Count: Integer;
        tempBlob: Codeunit "Temp Blob";
    begin
        DocAttach.SetRange("Table ID", Database::"Staff Advance Header");
        DocAttach.SetRange("No.", StaffAdvanceNo);

        if DocAttach.Findfirst() then
            DocAttach.CalcFields("Document Reference ID");

        if DocAttach."Document Reference ID".HasValue then begin

            // Load file as stream
            TempBlob.FromRecord(DocAttach, DocAttach.FieldNo("Document Reference ID"));
            tempBlob.CreateInStream(instr);
            ResultJson := Base64Convert.ToBase64(InStr);

            exit(ResultJson);
        end;
    end;


}