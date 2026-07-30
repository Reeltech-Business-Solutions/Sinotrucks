page 50304 "HR Leave Journal Lines"
{
    ApplicationArea = All;
    Caption = 'HR Leave Journal Lines';
    UsageCategory = Lists;
    //  SourceTable = "Standard General Journal";
    SourceTable = "HR Journal Line";
    AutoSplitKey = false;
    DelayedInsert = true;
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Worksheet;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SaveValues = true;
    ShowFilter = true;

    layout
    {
        area(content)
        {
            field(CurrentJnlBatchName; CurrentJnlBatchName)
            {
                Caption = 'Batch Name';
                Lookup = true;
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                begin

                    CurrPage.SaveRecord;
                    InsuranceJnlManagement.LookupName(CurrentJnlBatchName, Rec);
                    CurrPage.Update(false);
                end;

                trigger OnValidate()
                begin
                    InsuranceJnlManagement.CheckName(CurrentJnlBatchName, Rec);
                    CurrentJnlBatchNameOnAfterVali;
                end;
            }
            repeater(Control1102755000)
            {
                ShowCaption = false;
                field("Line No."; rec."Line No.")
                {
                    ApplicationArea = all;
                    visible = false;
                }
                field("Leave Period"; rec."Leave Period")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        rec."Leave Period Closed" := false;
                        if HRLeavePeriods.Get(rec."Leave Period") then begin
                            if HRLeavePeriods.Closed then
                                rec."Leave Period Closed" := true;
                        end;
                    end;
                }
                field("Staff No."; rec."Staff No.")
                {
                    ApplicationArea = all;
                    LookupPageID = "HR Employee List";
                }
                field("Staff Name"; rec."Staff Name")
                {
                    ApplicationArea = all;
                }
                field("Leave Type"; rec."Leave Type")
                {
                    ApplicationArea = all;
                }
                field("Posting Date"; rec."Posting Date")
                {
                    ApplicationArea = all;
                }
                field("Leave Entry Type"; rec."Leave Entry Type")
                {
                    ApplicationArea = all;
                }
                field("No. of Days"; rec."No. of Days")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Leave Period Start Date"; rec."Leave Period Start Date")
                {
                    ApplicationArea = all;
                }
                field("Leave Period End Date"; rec."Leave Period End Date")
                {
                    ApplicationArea = all;
                }
                field("Document No."; rec."Document No.")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Post Adjustment")
                {
                    ApplicationArea = all;
                    Caption = 'Post Adjustment';
                    Image = PostBatch;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        //IF ISEMPTY THEN EXIT;

                        //RESET;
                        //SETRANGE("Journal Template Name",'ISSUE');
                        //SETRANGE("Journal Batch Name",'LEAVE');
                        //IF FIND('-') THEN BEGIN
                        CODEUNIT.Run(CODEUNIT::"HR Leave Jnl.-Post", Rec);

                        //END;

                        CurrentJnlBatchName := rec.GetRangeMax(rec."Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Batch Allocation")
                {
                    ApplicationArea = all;
                    Image = Batch;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin

                        AllocationDone := false;

                        HRJournalBatch.Reset;
                        HRJournalBatch.Get(rec."Journal Template Name", rec."Journal Batch Name");


                        //GET THE CURRENT LEAVE PERIOD
                        HRLeavePeriods.Reset;
                        HRLeavePeriods.SetRange(HRLeavePeriods."New Fiscal Year", false);
                        HRLeavePeriods.Find('-');


                        //WE ARE ALLOCATING FOR ACTIVE EMPLOYEES ONLY
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.FindFirst;

                        HRLeaveTypes.Reset;
                        HRLeaveTypes.FindFirst;
                        begin


                            repeat


                                repeat


                                    //CHECK IF ALLOCATION OF CURRENT LEAVE TYPE FOR THE CURRENT PERIOD AND FOR CURRENT EMPLOYEE HAS BEEN DONE
                                    HRLeaveLedger.SetRange(HRLeaveLedger."Staff No.", HREmp."No.");
                                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Type", HRLeaveTypes.Code);
                                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Entry Type", HRJournalBatch.Type);
                                    HRLeaveLedger.SetRange(HRLeaveLedger."Leave Period", Format(HRLeavePeriods."Starting Date"));
                                    if not HRLeaveLedger.Find('-') then
                                        //OK := CheckGender(HREmp, HRLeaveTypes);

                                    if OK then begin

                                            //INSERT INTO JOURNAL
                                            rec.Init;
                                            rec."Journal Template Name" := HRJournalBatch."Journal Template Name";
                                            rec."Journal Batch Name" := HRJournalBatch."Journal Batch Name";
                                            rec."Line No." := rec."Line No." + 1000;
                                            rec."Leave Period" := Format(HRLeavePeriods."Starting Date");
                                            rec."Staff No." := HREmp."No.";
                                            rec.Validate("Staff No.");
                                            rec."Posting Date" := Today;
                                            rec.Description := HRJournalBatch."Posting Description";
                                            rec."Leave Entry Type" := HRJournalBatch.Type;
                                            rec."Leave Type" := HRLeaveTypes.Code;
                                            rec."No. of Days" := HRLeaveTypes.Days;
                                            rec."Leave Period Start Date" := HRLeavePeriods."Starting Date";
                                            //"Leave Period End Date":=HRLeavePeriods.Ends;
                                            rec."Document No." := 'N/A';
                                            rec.Insert();

                                            AllocationDone := true;

                                        end;

                                until HRLeaveTypes.Next = 0;

                                HRLeaveTypes.FindFirst;

                            until HREmp.Next = 0;
                        end;
                        HRLeaveTypes.FindFirst;

                        if not AllocationDone then
                            Message('Allocation of leave days for ' + Format(HRLeavePeriods."Starting Date") +
                             ' period has already been done for all ACTIVE employees');
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        JnlSelected: Boolean;
        InsuranceJnlManagement: Codeunit LeaveJnlManagement;
    begin
        OpenedFromBatch := (rec."Journal Batch Name" <> '') and (rec."Journal Template Name" = '');
        if OpenedFromBatch then begin
            CurrentJnlBatchName := rec."Journal Batch Name";
            InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
            exit;
        end;
        InsuranceJnlManagement.TemplateSelection(PAGE::"HR Leave Journal Lines", Rec, JnlSelected);
        if not JnlSelected then
            Error('');
        InsuranceJnlManagement.OpenJournal(CurrentJnlBatchName, Rec);
    end;

    var
        HRLeaveTypes: Record "HR Leave Types";
        HREmp: Record "HR Employees";
        HRLeaveLedger: Record "HR Leave Ledger Entries";
        InsuranceJnlManagement: Codeunit LeaveJnlManagement;
        ReportPrint: Codeunit "Test Report-Print";
        CurrentJnlBatchName: Code[20];
        InsuranceDescription: Text[30];
        FADescription: Text[30];
        ShortcutDimCode: array[8] of Code[20];
        OpenedFromBatch: Boolean;
        HRLeavePeriods: Record "HR Leave Periods";
        AllocationDone: Boolean;
        HRJournalBatch: Record "HR Leave Journal Batch";
        OK: Boolean;
        HRLeaveJournalTemplate: Record "HR Leave Journal Template";

    [Scope('OnPrem')]
    procedure CheckGender(Emp: Record "HR Employees"; LeaveType: Record "HR Leave Types") Allocate: Boolean
    begin

        //CHECK IF LEAVE TYPE ALLOCATION APPLIES TO EMPLOYEE'S GENDER

        if Emp.Gender = Emp.Gender::Male then begin
            if LeaveType.Gender = LeaveType.Gender::Male then
                Allocate := true;
        end;

        if Emp.Gender = Emp.Gender::Female then begin
            if LeaveType.Gender = LeaveType.Gender::Both then
                Allocate := true;
        end;

        if LeaveType.Gender = LeaveType.Gender::Female then
            Allocate := true;
        exit(Allocate);

        if Emp.Gender <> LeaveType.Gender then
            Allocate := false;

        exit(Allocate);
    end;

    local procedure CurrentJnlBatchNameOnAfterVali()
    begin
        CurrPage.SaveRecord;
        InsuranceJnlManagement.SetName(CurrentJnlBatchName, Rec);
        CurrPage.Update(false);
    end;
}
