// codeunit 50479 "Payslip Integration"
// {

//     procedure GetPayslip(EmployeeNo: Code[20]; PeriodDate: Date): Text

//     var
//         index: Integer;
//         InstreamPic: InStream;
//         TenantMedia: record "Tenant Media";
//         ItemRec: record Item;
//         Base64: Codeunit "Base64 Convert";
//         Tobase64: Codeunit "Base64 Convert";
//         tmpBlob: Codeunit "Temp Blob";
//         Ostream: OutStream;
//         RecRef: RecordRef;
//         Pstream: InStream;
//         Payslip: report 54718;
//         HREmployee: record 54548;
//         VarHREmployee: record 54548;
//         PaySlipB64: text;
//         FromIntegration: Boolean;
//         RemoveStr: text[20];
//     begin

//         //exit(Format(PeriodDate));

//         Clear(HREmployee);
//         Clear(Payslip);
//         Clear(RecRef);
//         FromIntegration := true;
//         if HREmployee.Get(EmployeeNo) then begin
//             HREmployee."Current Month Filter" := PeriodDate;
//             tmpBlob.CreateOutStream(Ostream);
//             Payslip.UseRequestPage(false);
//             Payslip.filterForDate(PeriodDate, EmployeeNo, FromIntegration);
//             RecRef.GetTable(HREmployee);
//             Payslip.SetTableView(HREmployee);
//             Payslip.SaveAs('', ReportFormat::Pdf, Ostream, RecRef);
//             tmpBlob.CreateInStream(Pstream);
//             Sleep(10000);
//             // RemoveStr := '\r\n';
//             PaySlipB64 := Tobase64.ToBase64(Pstream, true);
//             // PaySlipB64 := DelChr(PaySlipB64, '=', RemoveStr);
//             exit(PaySlipB64);

//         end else
//             exit('Employee does not exist!');
//     end;





// }
