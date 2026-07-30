page 54477 "HR Company Activities Card"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SaveValues = true;
    SourceTable = "HR Company Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Control1102755007)
            {
                ShowCaption = false;

                field("Code"; rec.Code)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Participants; rec."Participants")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Start Date"; rec.Date)
                {
                    ApplicationArea = all;
                    Caption = 'Start Date';
                    Importance = Promoted;
                }
                field("End Date"; D)
                {
                    ApplicationArea = all;
                    Caption = 'End Date';
                    //DateFormula = true;
                    Importance = Promoted;
                }
                field(Venue; rec.Venue)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee Responsible"; Rec."Employee Responsible")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Caption = 'Employee Name';
                    Editable = false;
                }
                field(Costs; rec.Costs)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                group(Control3)
                {
                    ShowCaption = false;
                    Visible = SelVisible;

                    field("Participant Group"; Rec."Participant Group")
                    {
                    }
                }
                field("Email Message"; Rec."Email Message")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field(Closed; rec.Closed)
                {
                    ApplicationArea = all;
                }
                field(Posted; rec.Posted)
                {
                    Visible = false;
                }
                field(Status; rec.Status)
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
            part(Control1102755011; "HR Activity Participants SF")
            {
                SubPageLink = "Document No." = FIELD(Code);
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Control1102755024; "HR Company Activities Factbox")
            {
                SubPageLink = Code = FIELD(Code);
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Functions)
            {
                action("Get Participants")
                {
                    Image = SalesPurchaseTeam;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        rec.TestField(Closed, false);
                        //DELETE ANY PREVIOS RECORDS RELATED TO THIS ACTIVITY
                        HRActivityApprovalEntry.SetRange(HRActivityApprovalEntry."Document No.", rec.Code);
                        If HRActivityApprovalEntry.Find('-') then HRActivityApprovalEntry.DeleteAll;
                        Commit;
                        //HRActivityApprovalEntry.RESET;
                        //GET ONLY ACTIVE EMPLOYEES
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        If rec."Global Dimension 1 Code" <> '' then HREmp.SetRange(HREmp."Department Code", rec."Global Dimension 1 Code");
                        If rec."Global Dimension 2 Code" <> '' then HREmp.SetRange(HREmp."Global Dimension 2", rec."Global Dimension 2 Code");
                        HREmp.SetFilter(HREmp."User ID", '<>%1', '');
                        If HREmp.FindFirst then
                            repeat
                                HRActivityApprovalEntry.Init;
                                HRActivityApprovalEntry.Participant := HREmp."No.";
                                HRActivityApprovalEntry."Participant Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                                HRActivityApprovalEntry."Document No." := rec.Code;
                                HRActivityApprovalEntry.Validate(HRActivityApprovalEntry.Participant);
                                HRActivityApprovalEntry.Insert();
                            Until HREmp.Next = 0;
                    end;
                }
                action("Notify Participants")
                {
                    Image = SendMail;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        SendMail;
                        /*//TESTFIELD(Closed,FALSE);
                            HRActivityApprovalEntry.RESET;
                            HRActivityApprovalEntry.SETRANGE(HRActivityApprovalEntry."Document No.",Code);
                            IF HRActivityApprovalEntry.COUNT=0 THEN
                            ERROR('You must get participants to notify before using this function');

                            GET(Code);
                            HRActivityApprovalEntry.RESET;

                            WITH HRActivityApprovalEntry DO BEGIN
                            DocType:=DocType::"Company Activity";


                            //SETRANGE("Table ID",DATABASE::"HR Activity Participants");
                            SETRANGE("Document Type",DocType);
                            SETRANGE("Document No.",Code);
                            SETRANGE(Status,Status::Created);
                            IF FINDSET THEN BEGIN
                            REPEAT
                            ApprovalsMgtNotification.SendActivityNotificationMail(Rec,HRActivityApprovalEntry);

                            HRActivityApprovalEntry.Notified:=TRUE;
                            HRActivityApprovalEntry.MODIFY;

                            UNTIL HRActivityApprovalEntry.NEXT = 0;
                            MESSAGE('%1',Text001)
                                END ;
                            END ;
                             */
                    end;
                }
                action(Close)
                {
                    Image = Close;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        rec.Closed := true;
                        rec.Modify;
                        Message('Event :: %1 :: has been marked as Closed', rec.Description);
                        CurrPage.Close;
                    end;
                }
                action("Re-Open")
                {
                    Image = Open;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        rec.Closed := false;
                        rec.Modify;
                        Message('Event :: %1 :: has been Re-Opened', rec.Description);
                        CurrPage.Close;
                    end;
                }
                action(Post)
                {
                    Image = Post;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if rec.Posted = true then Error('Document %1 has already been posted', rec.Code);
                        LineNo := 10000;
                        GenJournal.Reset;
                        GenJournal.SetRange(GenJournal."Journal Template Name", 'GENERAL');
                        GenJournal.SetRange(GenJournal."Journal Batch Name", 'WELFARE');
                        GenJournal.DeleteAll;
                        //REPEAT
                        GenJournal.Init;
                        GenJournal."Journal Template Name" := 'GENERAL';
                        GenJournal."Journal Batch Name" := 'WELFARE';
                        GenJournal."Line No." := LineNo;
                        GenJournal."Account Type" := GenJournal."Account Type"::"G/L Account";
                        GenJournal."Account No." := rec."G/L Account No";
                        GenJournal."Posting Date" := WorkDate;
                        GenJournal."Document No." := rec.Code + '-' + Format(WorkDate);
                        GenJournal."Bal. Account Type" := GenJournal."Account Type"::"Bank Account";
                        GenJournal."Bal. Account No." := rec."Bal. Account No";
                        GenJournal.Description := rec.Description;
                        GenJournal.Amount := rec.Costs;
                        GenJournal.Validate(GenJournal.Amount);
                        //GenJournal."Shortcut Dimension 1 Code":=TrainingCharges."Department Code";
                        //GenJournal.VALIDATE(GenJournal."Shortcut Dimension 1 Code");
                        GenJournal.Insert;
                        GenJournal.Reset;
                        GenJournal.SetRange(GenJournal."Journal Template Name", 'GENERAL');
                        GenJournal.SetRange(GenJournal."Journal Batch Name", 'WELFARE');
                        if GenJournal.Find('-') then CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post", GenJournal);
                        rec.Posted := true;
                        rec.Modify;
                    end;
                }
                action(Print)
                {
                    Image = PrintForm;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRCompanyActivities.Reset;
                        HRCompanyActivities.SetRange(HRCompanyActivities.Code, rec.Code);
                        if HRCompanyActivities.Find('-') then REPORT.Run(39005588, true, true, HRCompanyActivities);
                    end;
                }
                action("Notify All")
                {
                    Image = Group;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want to notify all', false) then exit;
                        if rec.Posted then Error('Participants notified');
                        /*  HRActivityParticipants.INIT;
                          HRActivityParticipants."Document No.":=Code;
                          HRActivityParticipants.Participant:=HREmp."No.";
                          HRActivityParticipants."Approver ID":=HREmp."User ID";
                          HRActivityParticipants.VALIDATE(Participant);
                          HRActivityParticipants.INSERT;
                         */
                        HREmp.SetRange(HREmp."No.");
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        if HREmp.FindFirst then begin
                            repeat
                                HRActivityApprovalEntry.Reset;
                                HRActivityApprovalEntry.Init;
                                HRActivityApprovalEntry."Document No." := rec.Code;
                                HRActivityApprovalEntry.Participant := HREmp."No.";
                                HRActivityApprovalEntry."Approver ID" := HREmp."User ID";
                                HRActivityApprovalEntry.Validate(Participant);
                                HRActivityApprovalEntry.Insert;
                            until HREmp.Next = 0;
                        end;
                        rec.Posted := true;
                        rec.Modify;
                        CurrPage.Update;
                    end;
                }
                action(Attachment)
                {
                    Caption = 'Attachment';
                    Image = Attach;
                    ApplicationArea = all;
                    RunObject = Page "HR Employee Attachments SF";
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        UpdateControls;
    end;

    trigger OnInit()
    begin
        // UpdateControls;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Activity Type" := rec."Activity Type"::Company;
    end;

    trigger OnOpenPage()
    begin
        UpdateControls;
    end;

    var
        Email: List of [Text];
        D: Date;
        //SMTP: Codeunit "SMTP Mail";
        CTEXTURL: Text[500];
        HREmp: Record "HR Employees";
        //ApprovalSetup: Record "Approval Setup";
        HRCompanyActivities: Record "HR Company Activities";
        HRActivityApprovalEntry: Record "HR Activity Participants";
        DocType: Option "Company Activity";
        Text001: Label 'All Participants have been notified via E-Mail';
        GenJournal: Record "Gen. Journal Line";
        LineNo: Integer;
        AllVisible: Boolean;
        SelVisible: Boolean;
        HREMailParameters: Record "HR E-Mail Parameters";

    [Scope('Cloud')]
    procedure UpdateControls()
    begin
        if rec.Closed then begin
            CurrPage.Editable := false;
        end; //else begin
        CurrPage.Editable := true;
    end;
    //if rec.Participants = rec.Participants::"Notify All" then begin
    //AllVisible := true;
    //SelVisible := false;
    //end else
    //if rec.Participants = rec.Participants::"Select Participants" then begin
    //AllVisible := false;
    //SelVisible := true;
    //end;
    //if rec.Code <> '' then begin
    //if rec.Date >= CurrentDateTime then
    //rec.Status := rec.Status::"On going"
    //else
    //if Today > D then
    //rec.Status := rec.Status::Complete;
    //end;
    //end;
    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Emp: Record "HR Employees";
    begin
        //Send Emp
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::Communication);
        if HREmailParameters.Find('-') then begin
            HRActivityApprovalEntry.Reset;
            HRActivityApprovalEntry.SetRange(HRActivityApprovalEntry."Document No.", rec.Code);
            if HRActivityApprovalEntry.FindFirst then begin
                repeat
                    Emp.Get(HRActivityApprovalEntry.Participant);
                    Emp.TestField(Emp."Company E-Mail");
                    Email.Add(Emp."Company E-Mail");
                    //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EMail,
                    //HREmailParameters.Subject, "Email Message", true);
                    //SMTP.Send();
                    HRActivityApprovalEntry.Notified := true;
                    HRActivityApprovalEntry.Modify;
                until HRActivityApprovalEntry.Next = 0;
            end;
            Message('%1', Text001)
        end;
    end;
}
