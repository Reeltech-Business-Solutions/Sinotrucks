codeunit 50050 "LeaveJnlManagement"
{

    trigger OnRun();
    begin
    end;

    var
        Text000: Label 'Leave';
        Text001: Label 'Leave Journal';
        Text002: Label 'DEFAULT';
        Text003: Label 'Default Journal';
        OldInsuranceNo: Code[20];
        OldFANo: Code[20];
        OpenFromBatch: Boolean;

    procedure TemplateSelection(FormID: Integer; var InsuranceJnlLine: Record "HR Journal Line"; var JnlSelected: Boolean);
    var
        InsuranceJnlTempl: Record "HR Leave Journal Template";
    begin
        JnlSelected := true;

        InsuranceJnlTempl.RESET;
        InsuranceJnlTempl.SETRANGE("Form ID", FormID);

        case InsuranceJnlTempl.COUNT of

            0:

                begin
                    InsuranceJnlTempl.INIT;
                    InsuranceJnlTempl.Name := Text000;
                    InsuranceJnlTempl.Description := Text001;
                    InsuranceJnlTempl.VALIDATE("Form ID");
                    if InsuranceJnlTempl.INSERT then //Fola10/16/24
                        COMMIT;
                end;

            1:
                InsuranceJnlTempl.FIND('-');
            else
                JnlSelected := PAGE.RUNMODAL(0, InsuranceJnlTempl) = ACTION::LookupOK;
        end;
        if JnlSelected then begin
            InsuranceJnlLine.FILTERGROUP := 2;
            InsuranceJnlLine.SETRANGE("Journal Template Name", InsuranceJnlTempl.Name);
            InsuranceJnlLine.FILTERGROUP := 0;
            if OpenFromBatch then begin
                InsuranceJnlLine."Journal Template Name" := '';
                PAGE.RUN(InsuranceJnlTempl."Form ID", InsuranceJnlLine);
            end;
        end;
    end;

    procedure TemplateSelectionFromBatch(var InsuranceJnlBatch: Record "HR Leave Journal Batch");
    var
        InsuranceJnlLine: Record "HR Journal Line";
        InsuranceJnlTempl: Record "HR Leave Journal Template";
        JnlSelected: Boolean;
    begin
        OpenFromBatch := true;
        InsuranceJnlTempl.GET(InsuranceJnlBatch."Journal Template Name");
        InsuranceJnlTempl.TESTFIELD("Form ID");
        InsuranceJnlBatch.TESTFIELD(Name);

        InsuranceJnlLine.FILTERGROUP := 2;
        InsuranceJnlLine.SETRANGE("Journal Template Name", InsuranceJnlTempl.Name);
        InsuranceJnlLine.FILTERGROUP := 0;

        InsuranceJnlLine."Journal Template Name" := '';
        InsuranceJnlLine."Journal Batch Name" := InsuranceJnlBatch.Name;
        PAGE.RUN(InsuranceJnlTempl."Form ID", InsuranceJnlLine);
    end;

    procedure OpenJournal(var CurrentJnlBatchName: Code[20]; var InsuranceJnlLine: Record "HR Journal Line");
    begin
        CheckTemplateName(InsuranceJnlLine.GETRANGEMAX("Journal Template Name"), CurrentJnlBatchName);
        InsuranceJnlLine.FILTERGROUP := 2;
        InsuranceJnlLine.SETRANGE("Journal Batch Name", CurrentJnlBatchName);
        InsuranceJnlLine.FILTERGROUP := 0;
    end;

    procedure OpenJnlBatch(var InsuranceJnlBatch: Record "HR Leave Journal Batch");
    var
        InsuranceJnlTemplate: Record "HR Leave Journal Template";
        InsuranceJnlLine: Record "HR Journal Line";
        JnlSelected: Boolean;
    begin
        if InsuranceJnlBatch.GETFILTER("Journal Template Name") <> '' then
            exit;
        InsuranceJnlBatch.FILTERGROUP(2);
        if InsuranceJnlBatch.GETFILTER("Journal Template Name") <> '' then begin
            InsuranceJnlBatch.FILTERGROUP(0);
            exit;
        end;
        InsuranceJnlBatch.FILTERGROUP(0);

        if not InsuranceJnlBatch.FIND('-') then begin
            if not InsuranceJnlTemplate.FIND('-') then
                TemplateSelection(0, InsuranceJnlLine, JnlSelected);
            if InsuranceJnlTemplate.FIND('-') then
                CheckTemplateName(InsuranceJnlTemplate.Name, InsuranceJnlBatch.Name);
        end;
        InsuranceJnlBatch.FIND('-');
        JnlSelected := true;
        if InsuranceJnlBatch.GETFILTER("Journal Template Name") <> '' then
            InsuranceJnlTemplate.SETRANGE(Name, InsuranceJnlBatch.GETFILTER("Journal Template Name"));
        case InsuranceJnlTemplate.COUNT of
            1:
                InsuranceJnlTemplate.FIND('-');
            else
                JnlSelected := PAGE.RUNMODAL(0, InsuranceJnlTemplate) = ACTION::LookupOK;
        end;
        if not JnlSelected then
            ERROR('');

        InsuranceJnlBatch.FILTERGROUP(2);
        InsuranceJnlBatch.SETRANGE("Journal Template Name", InsuranceJnlTemplate.Name);
        InsuranceJnlBatch.FILTERGROUP(0);
    end;

    procedure CheckName(CurrentJnlBatchName: Code[20]; var InsuranceJnlLine: Record "HR Journal Line");
    var
        InsuranceJnlBatch: Record "HR Leave Journal Batch";
    begin
        InsuranceJnlBatch.GET(InsuranceJnlLine.GETRANGEMAX("Journal Template Name"), CurrentJnlBatchName);
    end;

    procedure SetName(CurrentJnlBatchName: Code[20]; var InsuranceJnlLine: Record "HR Journal Line");
    begin
        InsuranceJnlLine.FILTERGROUP := 2;
        InsuranceJnlLine.SETRANGE("Journal Batch Name", CurrentJnlBatchName);
        InsuranceJnlLine.FILTERGROUP := 0;
        if InsuranceJnlLine.FIND('-') then;
    end;

    procedure LookupName(var CurrentJnlBatchName: Code[20]; var InsuranceJnlLine: Record "HR Journal Line"): Boolean;
    var
        InsuranceJnlBatch: Record "HR Leave Journal Batch";
    begin
        COMMIT;

        InsuranceJnlBatch."Journal Template Name" := InsuranceJnlLine.GETRANGEMAX("Journal Template Name");
        InsuranceJnlBatch.Name := InsuranceJnlLine.GETRANGEMAX("Journal Batch Name");
        InsuranceJnlBatch.FILTERGROUP(2);
        InsuranceJnlBatch.SETRANGE("Journal Template Name", InsuranceJnlBatch."Journal Template Name");
        InsuranceJnlBatch.FILTERGROUP(0);
        if PAGE.RUNMODAL(0, InsuranceJnlBatch) = ACTION::LookupOK then begin
            CurrentJnlBatchName := InsuranceJnlBatch.Name;
            SetName(CurrentJnlBatchName, InsuranceJnlLine);
        end;
    end;

    procedure CheckTemplateName(CurrentJnlTemplateName: Code[20]; var CurrentJnlBatchName: Code[20]);
    var
        InsuranceJnlBatch: Record "HR Leave Journal Batch";
    begin
        if not InsuranceJnlBatch.GET(CurrentJnlTemplateName, CurrentJnlBatchName) then begin
            InsuranceJnlBatch.SETRANGE("Journal Template Name", CurrentJnlTemplateName);
            if not InsuranceJnlBatch.FIND('-') then begin
                InsuranceJnlBatch.INIT;
                InsuranceJnlBatch."Journal Template Name" := CurrentJnlTemplateName;
                InsuranceJnlBatch.SetupNewBatch;
                InsuranceJnlBatch.Name := Text002;
                InsuranceJnlBatch.Description := Text003;
                InsuranceJnlBatch.INSERT(true);
                COMMIT;
            end;
            CurrentJnlBatchName := InsuranceJnlBatch.Name;
        end;
    end;

    procedure GetDescriptions(InsuranceJnlLine: Record "HR Journal Line"; var InsuranceDescription: Text[30]; var FADescription: Text[30]);
    var
        Insurance: Record "HR Leave Application";
        FA: Record "HR Employees";
    begin
        if InsuranceJnlLine."Document No." <> OldInsuranceNo then begin
            InsuranceDescription := '';
            if InsuranceJnlLine."Document No." <> '' then
                if Insurance.GET(InsuranceJnlLine."Document No.") then
                    InsuranceDescription := Insurance.Description;
            OldInsuranceNo := InsuranceJnlLine."Document No.";
        end;
        if InsuranceJnlLine."Staff No." <> OldFANo then begin
            FADescription := '';
            if InsuranceJnlLine."Staff No." <> '' then
                if FA.GET(InsuranceJnlLine."Staff No.") then
                    FADescription := FA."First Name";
            OldFANo := FA."No.";
        end;
    end;
}
