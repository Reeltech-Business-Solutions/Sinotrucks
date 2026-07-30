codeunit 50051 "picture Integration"
{
    procedure GetPicture(EmployeeNo: code[20]): Text
    var
        InStreamPic: Instream;
        TenantMedia: Record "Tenant Media";
        Base64: Codeunit "Base64 Convert";
        ToBase64: Codeunit "Base64 Convert";
        tempBlob: Codeunit "Temp Blob";
        Ostream: OutStream;
        RecRef: RecordRef;
        Pstream: InStream;
        EmpPicture: record 54578;
        HREmployee: record 54578;
        VarHREmployee: record 54548;
        PictureB64: text;
        FromIntegration: Boolean;
        RemoveStr: text[20];
        PaySlipB64: text;
    begin

        // clear(RecRef);
        // Clear(InStreamPic);
        if HREmployee.Get(EmployeeNo) then begin

            // exit(Format(EmployeeNo));
            HREmployee.CalcFields(Picture);
            if HREmployee.Picture.HasValue then begin
                //    exit(Format(EmployeeNo));
                TempBlob.FromRecord(HREmployee, HREmployee.FieldNo(Picture));
                TempBlob.CreateInstream(InstreamPic);
                // HREmployee.Picture.CreateInStream(InStreamPic);
                PaySlipB64 := Tobase64.ToBase64(InStreamPic);
                exit(PaySlipB64);
            end
            // else
            //     exit('Employee has no picture.');

        end;

    end;
}