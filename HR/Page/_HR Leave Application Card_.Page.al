page 54481 "HR Leave Application Card"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions,Comments';
    SourceTable = "HR Leave Application";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Application Code"; Rec."Application Code")
                {
                    Caption = 'Application No';
                    Editable = "Application CodeEditable";
                    Importance = Promoted;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    Editable = "Responsibility CenterEditable";
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        // CurrPage.Update;
                    end;
                }
                label("Employee Details")
                {
                    Caption = 'Employee Details';
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Caption = 'Employee No.';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Company Email"; Rec."Company Email")
                {
                    ApplicationArea = All;
                    Editable = "Start DateEditable";
                    ToolTip = 'Specifies the value of the Company Email field.';
                    ExtendedDatatype = email;

                    trigger OnValidate()

                    begin

                        CurrPage.Update;

                    end;

                }
                field(EmpName; EmpName)
                {
                    Caption = 'Applicant Name';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Job Tittle"; Rec."Job Title")
                {
                    Caption = 'Job Title';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(EmpJobDesc; EmpJobDesc)
                {
                    Caption = 'Job Description';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(EmpDept; EmpDept)
                {
                    Caption = 'Department';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    Editable = false;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        //GET THE APPROVER NAMES
                        // HREmp.Reset;
                        // HREmp.SetRange(HREmp."Supervisor/Manager", Rec.Supervisor);
                        // IF HREmp.FIND('-') then begin
                        //     SupervisorName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                        //     //  rec."Supervisor Email" := HREmp."Company E-Mail";
                        // end
                        // else begin
                        //     SupervisorName := '';

                        // end;
                    end;

                }
                field(SupervisorName; SupervisorName)
                {
                    Caption = 'Supervisor Name';
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Supervisor Email"; Rec."Supervisor Email")
                {
                    Caption = 'Supervisor Email';
                    Editable = false;
                    ApplicationArea = all;

                }
                field(Pictures; Rec.Pictures)
                {
                    ApplicationArea = All;
                }
                // field("File Name"; Rec."File Name")
                // {
                //     ApplicationArea = All;
                // }
                // field(MIME; Rec.MIME)
                // {
                //     ApplicationArea = All;
                // }
                // field("Picture URL"; Rec."Picture URL")
                // {
                //     ApplicationArea = All;
                // }
                // field("Base64Image"; Rec."output")
                // {
                //     ApplicationArea = All;
                // }
                // field(Descriptions; Rec.Descriptions)
                // {
                //     ApplicationArea = All;
                // }
                // field(ItemDesc; Rec.ItemDesc)
                // {
                //     ApplicationArea = All;
                // }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';

                field("Leave Period"; Rec."Leave Period")
                {
                    Editable = "Leave TypeEditable";
                    ApplicationArea = all;

                    trigger OnValidate()
                    var
                        LeaveApp: Record "HR Leave Application";
                    begin
                        HRSetup.Get;
                        LeaveBalance := 0;
                        PrevBal := 0;
                        // if rec."Leave Period" = Format(Date2DMY(Today, 3)) then begin
                        //     LeaveApp.SetRange(LeaveApp."Employee No", Rec."Employee No");
                        //     LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
                        //     LeaveApp.SetRange(LeaveApp."Leave Period", Format(Date2DMY(Today, 3) - 1));
                        //     if LeaveApp.FindFirst then begin
                        //         HRLeaveApp.Get(CreateLeaveLedgerEntries();Rec."Application Code");
                        //         HRLeaveApp.CalcFields("Total Annual Leave");
                        //         PrevBal := LeaveApp."Maximum Leave Days" - HRLeaveApp."Total Annual Leave";
                        //         //message('%1..%2',PrevBal,HRLeaveApp."Total Annual Leave");
                        //         HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Period", Format(Date2DMY(Today, 3) - 1));
                        //         //HRLeaveLedgerEntries.SETRANGE(HRLeaveLedgerEntries."Leave Period Closed",TRUE);
                        //         if not HRLeaveLedgerEntries.FindFirst then begin
                        //             if (PrevBal > 0) and (HRSetup."Forfeit Leave After" > Today) then
                        //                 Error('you must exhaust the previous year leave before applying for leave in the current year');
                        //             if PrevBal = 0 then
                        //                 Error('You have used up your previous year''s leave');
                        //         end;
                        //     end;
                        // end;
                        LeaveApp.Reset();
                        LeaveApp.SetRange(LeaveApp."Employee No", Rec."Employee No");
                        //LeaveApp.SETRANGE(LeaveApp."Leave Type",'ANNUAL','INTERMITENT');
                        LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
                        LeaveApp.SetRange(LeaveApp."Leave Period", Rec."Leave Period");
                        if LeaveApp.FindFirst then begin
                            Rec.CalcFields("Total Annual Leave");
                            LeaveBalance := LeaveApp."Maximum Leave Days" - Rec."Total Annual Leave";
                        end;
                        ExamLeaveBal := 0;
                        LeaveApp.SetRange(LeaveApp."Employee No", Rec."Employee No");
                        LeaveApp.SetRange(LeaveApp."Leave Type", 'EXAM');
                        LeaveApp.SetRange(LeaveApp."Leave Period", Rec."Leave Period");
                        if LeaveApp.FindFirst then begin
                            Rec.CalcFields("Total Exam Leave");
                            ExamLeaveBal := LeaveApp."Maximum Leave Days" - REc."Total Exam Leave";
                        end;
                        CurrPage.Update;


                    end;

                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = "Leave TypeEditable";
                    Importance = Promoted;
                    ApplicationArea = all;

                    trigger OnValidate()
                    var
                        HrLeaveType: Record "HR Leave Types";
                        Emp: Record "HR Employees";
                    begin
                        if rec."Leave Type" = 'ANNUAL' then begin
                            if ((rec."Days Applied" > LeaveBalance) and (HREmp."Annual Exam Leave" < Rec."Days Applied")) then begin
                                // LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
                                Error('Days applied cannot exceed your balance/maximum annual days');
                            end;
                        end;
                        hrrel.SetFilter("Application No.", Rec."Application Code");
                        if not hrrel.findfirst then begin
                            hrrel.Init;
                            hrrel."Application No." := Rec."Application Code";
                            hrrel.Insert;
                        end;
                        /*
                        HrLeaveType.GET("Leave Type");
                        IF HrLeaveType.Compassionate THEN BEGIN
                         IF LeaveBalance <> 0 THEN
                          ERROR('you are not qualified for this leave type yet,call hr');
                         END;
                         */
                        CheckPatMat;
                        //GetLeaveStats("Leave Type");
                        //CurrPage.UPDATE;


                    end;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = "Start DateEditable";
                    Importance = Promoted;
                    ApplicationArea = all;

                }
                field("Days Applied"; Rec."Days Applied")
                {
                    // Editable = DaysAppliedEdit;
                    Importance = Promoted;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        //IF "Leave Type"='ANNUAL'  THEN
                        // if Rec."Days Applied" > 4 then Error('You cannot apply for 5 days and above. Please contact HR');
                        // if (LeaveBalance = 0) and (Rec."Leave Type" <> 'SICK') and (Rec."Leave Type" <> 'EXAM') then begin tolu 8/7/24 
                        //LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
                        // OR (rec."Days Applied" > LeaveBalance) AND (HREmp."Annual Exam Leave" < rec."Days Applied")
                        //  Error('Days applied cannot exceed your balance/maximum annual days');
                        //  end; remmed by Tolu 8/7/24
                        // if rec."Leave Type" = 'ANNUAL' then begin
                        //     if ((rec."Days Applied" > LeaveBalance) and (HREmp."Annual Exam Leave" < Rec."Days Applied")) then begin
                        //         // LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
                        //         Error('Days applied cannot exceed your balance/maximum annual days');
                        //     end;
                        // end;
                        HRSetup.Get;
                        //LeaveBalance := 0;
                        PrevBal := 0;
                        if (rec."Leave Period" = Format(Date2DMY(Today, 3))) and (Rec."Leave Type" <> 'SICK') then begin
                            LeaveApp.SetRange(LeaveApp."Employee No", Rec."Employee No");
                            LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
                            LeaveApp.SetRange(LeaveApp."Leave Period", Format(Date2DMY(Today, 3) - 1));
                            if LeaveApp.FindFirst then begin
                                HRLeaveApp.Get(rec."Application Code");
                                HRLeaveApp.CalcFields("Total Annual Leave");
                                PrevBal := LeaveApp."Maximum Leave Days" - HRLeaveApp."Total Annual Leave";
                                HRLeaveLedgerEntries.SetRange(HRLeaveLedgerEntries."Leave Period", Format(Date2DMY(Today, 3) - 1));
                                if HRLeaveLedgerEntries.FindFirst then begin
                                    if PrevBal = 0 then Error('You have used up your previous year''s leave');
                                end;
                            end;
                        end;
                    end;
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = all;
                }
                field("Approved days"; Rec."Approved days")
                {
                    Editable = "Application CodeEditable";
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        if UserId = rec."User ID" then
                            Error('You are not allowed to perform this action');
                    end;
                }
                field("Employee Reliver"; Rec."Employee Reliver")
                {
                    ApplicationArea = All;
                    Editable = "Start DateEditable";

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Emp.Reset();
                        Employee.Get(rec."Employee No");
                        Emp.SetFilter(Emp."No.", '<>%1', rec."Employee No");
                        // Emp.SetRange(Emp."Department Code", rec."Responsibility Center");
                        Emp.SetRange(Emp."Global Dimension 1", rec."Responsibility Center");
                        Emp.SetRange(Emp."Global Dimension 2", Employee."Global Dimension 2");
                        if PAGE.RunModal(54896, Emp) = ACTION::LookupOK then begin
                            rec."Employee Reliver" := Emp."No.";
                            rec.Validate("Employee Reliver");
                            rec."Relievers Name" := Emp."Last Name" + ' ' + Emp."First Name" + ' ' + Emp."Middle Name";
                        end

                    end;



                }
                field("Relievers Name"; Rec."Relievers Name")
                {
                    ApplicationArea = All;


                    // trigger OnValidate()
                    // begin
                    //     if rec.Get(rec."Employee Reliver") then
                    //         rec."Relievers Name" := Emp."Last Name" + ' ' + Emp."First Name" + ' ' + Emp."Middle Name";
                    // end;
                }
                label(Control1102755082)
                {
                    CaptionClass = Text19010232;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field(dEarnd; dEarnd)
                {
                    Caption = 'Total Leave Days';
                    Editable = false;
                    Style = Strong;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Total Annual Leave"; Rec."Total Annual Leave")
                {
                    ApplicationArea = all;
                    Caption = 'Annual Leave Taken';
                }
                field("Total Leave Days Allw"; Rec."Total Leave Days Allw")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(LeaveBalance; LeaveBalance)
                {
                    Caption = 'Leave Balance';
                    Editable = false;
                    ApplicationArea = all;
                }
                field(ExamLeaveBal; ExamLeaveBal)
                {
                    Caption = 'Exam Leave Balance';
                    Editable = false;
                    ApplicationArea = all;
                }



                field("New Entry Max Annual Days"; Rec."New Entry Max Annual Days")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Maximum Leave Days"; Rec."Maximum Leave Days")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(dTaken; dTaken)
                {
                    Caption = 'Total Leave Taken';
                    Editable = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                    Visible = false;
                    ApplicationArea = all;
                }
                field(dLeft; dLeft)
                {
                    Caption = 'Leave Balance';
                    Editable = false;
                    Enabled = false;
                    Style = Strong;
                    StyleExpr = TRUE;
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Application Date"; Rec."Application Date")
                {
                    Editable = false;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field("Request Leave Allowance"; Rec."Request Leave Allowance")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Leave Allowance Amount"; Rec."Leave Allowance Amount")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = all;
                }
                label(Control1000000000)
                {
                    CaptionClass = Text1;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
                field(Reliever; Rec.Reliever)
                {
                    Caption = 'Reliever Code';
                    Editable = RelieverEditable;
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Reliever Name"; Rec."Relievers Name")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Control1000000002; Rec.Attachments)
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Status; Rec.Status)
                {
                    //Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
            }
            group("More Leave Details")
            {
                Caption = 'More Leave Details';

                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    Editable = "Cell Phone NumberEditable";
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("E-mail Address"; Rec."E-mail Address")
                {
                    Editable = true;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Details of Examination"; Rec."Details of Examination")
                {
                    Editable = "Details of ExaminationEditable";
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Date of Exam"; Rec."Date of Exam")
                {
                    Editable = "Date of ExamEditable";
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Number of Previous Attempts"; Rec."Number of Previous Attempts")
                {
                    Editable = NumberofPreviousAttemptsEditab;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
            }
            part(Control7; "HR Leave Reliver SubForm")
            {
                ApplicationArea = All;
                Editable = "Start DateEditable";
                SubPageLink = "Employee No" = FIELD("Employee No"), "Application No." = Field("Application Code");

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachment';
                SubPageLink = "Table ID" = const(54574), "No." = field("Application Code");
            }
            part(Control1000000003; "HR Leave Applicaitons Factbox")
            {
                SubPageLink = "No." = FIELD("Employee No");
                ApplicationArea = All;
            }
            // part(picturess; "Item picture")
            // {
            //     ApplicationArea = All;
            // }
            systempart(Control1102755004; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                Visible = false;

                action(Comments)
                {
                    Caption = 'Comments';
                    Image = Comment;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = all;
                    Visible = false;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,"Bank Slip",Grant,"Grant Surrender","Employee Requisition","Leave Application","Training Application","Transport Requisition";
                    begin
                        /*DocumentType:=DocumentType::"Leave Application";

                            ApprovalComments.Setfilters(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                            ApprovalComments.SetUpLine(DATABASE::"HR Leave Application",DocumentType,"Application Code");
                            ApprovalComments.RUN;
                            */
                    end;
                }
                action(Attachments)
                {
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Interview Evaluation Stage3";
                    RunPageLink = "Evaluation Code" = FIELD("Application Code");
                    Visible = false;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action("&Approvals")
                {
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        ApprovalDocType: enum "Approval Document Type";
                        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",JV,"Payment Voucher","Petty Cash",Requisition,InterBank,"Staff Claim","Staff Advance",AdvanceSurrender,Capex,IJ,"Hr Job","Emp Loan","Leave Application","Employee Requisition","Interview Evaluation","Training Requisition",Appraisal,HMO,Canteen,EmpTransaction,LeaveAck;
                    begin
                        DocType := DocType::"Leave Application";
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Leave Application", ApprovalDocType::Leave, rec."Application Code");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Send Approval Request")
                {
                    Caption = '&Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;
                    Enabled = isOpen;

                    trigger OnAction()
                    var
                        LeaveType: Record "HR Leave Types";
                        Confirmation: Label 'Are you sure you want to send this document for approval';

                    begin
                        TESTFIELDS;
                        /*hrrel.SETRANGE(hrrel."Application No.","Application Code");
                        IF hrrel.FINDSET THEN
                        REPEAT
                         hrrel.TESTFIELD("Reliver No.");
                        UNTIL hrrel.NEXT=0;
                         */
                        HRSetup.Get;
                        //test the maximum employees allowed to be on leave at once
                        //TestLeaveFamily;
                        //Check that its up to 3 days between leave application date and leave commencement date;
                        LeaveType.Get(rec."Leave Type");
                        if LeaveType.Maternity = true then begin
                            if Rec."Start Date" - Rec."Application Date" < HRSetup."Maternity Application Before" then Error('Sorry, %1, there must be atleast 14 days between the "Application Date"  and "Leave Start Date"', UpperCase(UserId));
                        end
                        else
                            if not LeaveType.Sick then if Rec."Start Date" - Rec."Application Date" < HRSetup."Leave Application Before" then Error('Sorry, %1, there must be atleast 2 days between the "Application Date"  and "Leave Start Date"', UpperCase(UserId));
                        if Confirm('Send this Application for Approval?', true) = false then exit;
                        Rec.Selected := true;
                        Rec."User ID" := UserId;
                        CheckPatMat;
                        begin
                            if ApprovalsMgt.CheckLeaveApprovalsWorkflowEnable(rec) then
                                ApprovalsMgt.OnSendLeaveForApproval(Rec);
                            CurrPage.Close();

                        end;
                        //ApprovalMgt.SendLeaveAppApprovalReq(Rec);

                    end;
                }
                action("&Cancel Approval Request")
                {
                    Caption = '&Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;
                    Enabled = not isOpen;

                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to cancel approval request?';

                    begin
                        //ApprovalMgt.CancelLeaveAppRequest(Rec,TRUE,TRUE);
                        ApprovalsMgt.OnCancelLeaveForApproval(Rec);
                        CurrPage.Close();

                    end;
                }
                action("Re-Open")
                {
                    Caption = 'Re-Open';
                    Image = ReopenCancelled;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;


                    trigger OnAction()
                    begin
                        Rec.Status := Rec.Status::New;
                        Rec.Modify;

                    end;
                }
                action(Print)
                {
                    Caption = 'Print';
                    ApplicationArea = all;
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    //  RunObject = Report "HR Leave Application";

                    //RunObject = Report "IBS Notes 3";
                    trigger OnAction()
                    begin
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", Rec."Application Code");
                        if HRLeaveApp.Find('-') then
                            //  Report.Run(54692, true, true, HRLeaveApp);
                            Report.Run(Report::"HR Leave Application", true, true, HRLeaveApp);
                    end;
                }
                action("Create Leave Ledger Entries")
                {
                    Caption = 'Create Leave Ledger Entries';
                    Image = CreateLinesFromJob;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        REC.TESTFIELD(REC.Status, rEC.Status::Approved);
                        REC.CreateLeaveLedgerEntries;
                        CurrPage.Close();
                        //  CurrPage.Update();
                        //Rec.Reset;
                    end;
                }
                action("&Post Leave Application")
                {
                    Caption = '&Post Leave Application';
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        objPeriod: Record "prPayroll Periods";
                        PrEmpTrans: Record "prEmployee Transactions";
                        text001: Label 'Do you want to generate a Payment Voucher for the Leave Allowance?';
                    begin
                        if Rec.Status = Rec.Status::Posted then Error('This Leave application has already been posted');
                        if Rec.Status <> Rec.Status::Approved then Error('The Leave Status must be Approved');
                        Rec.TestField("Approved days");
                        HRLeaveTypes.Get(Rec."Leave Type");
                        if HRLeaveTypes.Recurring then begin
                            if Rec."Approved days" > LeaveBalance then Error('Approved Days cannot exceed leave Balance for the specified Period');
                        end;
                        HRSetup.Get;
                        //rec.CalcFields(rec.DeterminethisLeaveEndDate()DeterminethisLeaveEndDate()"Total Leave Days Allow");
                        rec.CalcFields("Total Leave Days Allw");
                        if rec."Total Leave Days Allw" < HRSetup."Leave Allowance Days" then begin
                            PrEmpTrans.Reset;
                            PrEmpTrans.SetRange("Payroll Period", rec."Payroll Period");
                            PrEmpTrans.SetRange("Employee Code", rec."Employee No");
                            PrEmpTrans.SetRange("Reference No", rec."Application Code");
                            if not PrEmpTrans.FindSet then begin
                                objPeriod.Reset;
                                objPeriod.SetRange(objPeriod.Closed, false);
                                if objPeriod.Find('-') then begin
                                    if rec."Payroll Period" = objPeriod."Date Opened" then begin
                                        PrEmpTrans.Init;
                                        PrEmpTrans."Employee Code" := rec."Employee No";
                                        PrEmpTrans."Transaction Code" := 'LEAVE';
                                        PrEmpTrans.Amount := rec."Leave Allowance Amount";
                                        PrEmpTrans."Payroll Period" := rec."Payroll Period";
                                        PrEmpTrans."Period Month" := Date2DMY(rec."Payroll Period", 2);
                                        PrEmpTrans."Period Year" := Date2DMY(rec."Payroll Period", 3);
                                        PrEmpTrans.Validate("Transaction Code");
                                        PrEmpTrans."Reference No" := rec."Application Code";
                                        //PrEmpTrans.TRANSFERFIELDS(Rec);
                                        PrEmpTrans.Insert
                                    end
                                end;
                                if Confirm(text001, false) then rec.GeneratePV;
                            end;
                        end;
                        //END;
                        //Generate PV
                        //IF CONFIRM(text001,FALSE) THEN
                        // GeneratePV;
                        ////*********////Post Leave
                        HRLeaveApp.Reset;
                        HRLeaveApp.SetRange(HRLeaveApp."Application Code", rec."Application Code");
                        if HRLeaveApp.Find('-') then begin
                            HRLeaveApp.CreateLeaveLedgerEntries;
                        end;
                        //Dave---To notify leave applicant
                        HREmp.Get(rec."Employee No");
                        HREmp.TestField(HREmp."Company E-Mail");
                        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
                        HREmailParameters.Reset;
                        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::General);
                        if HREmailParameters.Find('-') then begin
                            //HREmp.TestField(HREmp."Company E-Mail");
                            //EmailAdd.Add(HREmp."Company E-Mail");
                            //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EmailAdd,
                            //HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                            //HREmailParameters.Body + ' ' + "Application Code" + ' ' + HREmailParameters."Body 2", true);
                            //SMTP.Send();
                            Message('Leave applicant has been notified successfully');
                            CurrPage.Close();
                        end;
                    end;
                }
                action(" Attachments")
                {
                    Caption = ' Attachments';
                    Image = Attach;
                    ApplicationArea = all;
                    Promoted = true;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No" = FIELD("Employee No"), "Document Type" = CONST(Leave);
                    Visible = false;
                }
                action("HR Reliver Worksheet")
                {
                    ApplicationArea = all;
                    RunObject = Page "HR Reliver Worksheet";
                    RunPageLink = "Department Code" = FIELD("Global Dimension 1 Code"), "Global Dimension 2" = FIELD("Global Dimension 2 Code");
                    Visible = false;
                }
                action("Test Attachment")
                {
                    ApplicationArea = all;
                    Caption = 'Attachment';
                    //RunObject = Page "Attachment Test";
                    //RunPageLink = "Employee No" = FIELD("Employee No"),
                    //"Document Type" = CONST(Leave),
                    //"Application No" = FIELD("Application Code"),
                    //"Folder Type" = CONST(HR);
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        isOpen, isPending : boolean;
    begin
        xRec := Rec;
        if rec.Status = rec.Status::Resumed then begin
            CurrPage.Editable := false;
        end;
        //  if rec.Status = rec.Status::Approved then begin
        //    CurrPage.Editable := false;
        // end;
        EmpDept := '';
        //PASS VALUES TO VARIABLES ON THE FORM
        FillVariables;
        //GET LEAVE STATS FOR THIS EMPLOYEE FROM THE EMPLOYEE TABLE
        GetLeaveStats(rec."Leave Type");
        //TO PREVENT USER FROM SEEING OTHER PEOPLES LEAVE APPLICATIONS
        //SETFILTER("User ID",USERID);
        Updatecontrols;
        if LeaveTypes.Get(rec."Leave Type") then begin
            if LeaveTypes.Sick or LeaveTypes.Recurring or LeaveTypes.Exam then DaysAppliedEdit := true;
        end;
        LeaveBalance := 0;
        LeaveApp.SetRange(LeaveApp."Employee No", Rec."Employee No");
        //LeaveApp.SETRANGE(LeaveApp."Leave Type",'ANNUAL|INTERMITENT');
        LeaveApp.SetFilter(LeaveApp."Leave Type", '%1|%2', 'ANNUAL', 'INTERMITENT');
        LeaveApp.SetRange(LeaveApp."Leave Period", Rec."Leave Period");
        if LeaveApp.FindFirst then begin
            Rec.CalcFields("Total Annual Leave");
            LeaveBalance := LeaveApp."Maximum Leave Days" - rec."Total Annual Leave";
        end;
        ExamLeaveBal := 0;
        LeaveApp.SetRange(LeaveApp."Employee No", Rec."Employee No");
        LeaveApp.SetRange(LeaveApp."Leave Type", 'EXAM');
        LeaveApp.SetRange(LeaveApp."Leave Period", Rec."Leave Period");
        if LeaveApp.FindFirst then begin
            Rec.CalcFields("Total Exam Leave");
            ExamLeaveBal := LeaveApp."Maximum Leave Days" - rec."Total Exam Leave";
        end;
        CurrPage.Update;
        //ExportItemPicture()
        // if rec.status = rec.status::New then
        //     isOpen := true else
        //     isOpen := false;
        // currPage.Update();
    end;

    trigger OnModifyRecord(): Boolean
    var
        isOpen: boolean;
    begin
        // if Text.StrLen(HRLeaveApp."Picture URL") > 0 then
        //     UploadItemPictureUrl()
        // else
        //     if Text.StrLen(HRLeaveApp.Output) < 1 then
        //         error('You must either provide a Picture URL or a Base64 Encoded Image')
        //     else
        // ImportItemPicture()
        // if rec.status = rec.status::New then
        //     isOpen := true else
        //     isOpen := false;
        // currPage.Update();
    end;

    trigger OnInit()
    begin
        NumberofPreviousAttemptsEditab := true;
        "Date of ExamEditable" := true;
        "Details of ExaminationEditable" := true;
        "Cell Phone NumberEditable" := true;
        SupervisorEditable := true;
        RequestLeaveAllowanceEditable := true;
        RelieverEditable := true;
        "Leave Allowance AmountEditable" := true;
        "Start DateEditable" := true;
        "Responsibility CenterEditable" := true;
        "Days AppliedEditable" := true;
        "Leave TypeEditable" := true;
        "Application CodeEditable" := true;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //rec."Leave Period" := Format(Date2DMY(WorkDate, 3));  
    end;



    trigger OnOpenPage()
    var
        LeaveApp: Record "HR Leave Application";
    begin
        Rec.CALCFIELDS(rec."Total Annual Leave");
        LeaveBalance := rec."Maximum Leave Days" - rec."Total Annual Leave";
        xRec := Rec;
        if rec.Status = rec.Status::Resumed then begin
            CurrPage.Editable := false;
        end;

        //  if rec.Status = rec.status::Approved then begin
        //  CurrPage.Editable := false;
        // end;
        Updatecontrols;
        if LeaveTypes.Get(rec."Leave Type") then begin
            if LeaveTypes.Sick or LeaveTypes.Recurring or LeaveTypes.Exam then DaysAppliedEdit := true;
        end;
        if rec.status = rec.status::New then
            isOpen := true else begin
            isOpen := false;

            //  currPage.Update();
        end;
    end;

    var
        Employee: Record "HR Employees";
        Emp: Record "HR Employees";
        EmailAdd: List of [Text];
        HREmp: Record "HR Employees";
        EmpJobDesc: Text[50];
        HRJobs: Record "HR Jobs";
        SupervisorName: Text[60];
        //SMTP: Codeunit "SMTP Mail";
        URL: Text[500];
        dAlloc: Decimal;
        dEarnd: Decimal;
        dTaken: Decimal;
        dLeft: Decimal;
        cReimbsd: Decimal;
        cPerDay: Decimal;
        cbf: Decimal;
        HRSetup: Record "HR Setup";
        EmpDept: Text[30];
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApprovalsMgt: Codeunit "Approval Mgt. Ext";
        HRLeaveApp: Record "HR Leave Application";
        HRLeaveList: page "HR Leave Applications List";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,WorkOrder,Job,Trip,Fuel,Diversion,HSSEQ,VehicleRelease,DriverAllowance,TruckVerification,BatteryJV,Towing,Interchange,TyreReplacement,LCAdvance,APRAF,FuelRecon,"Job Approval","Employee Requisition","Interview Evaluation","Training Requisition","Leave Application",Appraisal;
        ApprovalEntries: Page "Approval Entries";
        HRLeaveLedgerEntries: Record "HR Leave Ledger Entries";
        EmpName: Text[70];
        ApprovalComments: Page "Approval Comments";
        [InDataSet]

        "Application CodeEditable": Boolean;
        [InDataSet]
        "Leave TypeEditable": Boolean;
        [InDataSet]
        "Days AppliedEditable": Boolean;
        [InDataSet]
        "Responsibility CenterEditable": Boolean;
        [InDataSet]
        "Start DateEditable": Boolean;
        [InDataSet]
        "Leave Allowance AmountEditable": Boolean;
        [InDataSet]
        RelieverEditable: Boolean;
        [InDataSet]
        RequestLeaveAllowanceEditable: Boolean;
        [InDataSet]
        SupervisorEditable: Boolean;
        [InDataSet]
        "Cell Phone NumberEditable": Boolean;
        [InDataSet]
        "Details of ExaminationEditable": Boolean;
        [InDataSet]
        "Date of ExamEditable": Boolean;
        [InDataSet]
        NumberofPreviousAttemptsEditab: Boolean;
        Text19010232: Label 'Leave Statistics';
        Text1: Label 'Reliver Details';
        //NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        varDaysApplied: Integer;
        HRLeaveTypes: Record "HR Leave Types";
        BaseCalendarChange: Record "Base Calendar Change";
        ReturnDateLoop: Boolean;
        mSubject: Text[250];
        ApplicantsEmail: Text[30];
        LeaveGjline: Record "HR Journal Line";
        "LineNo.": Integer;
        sDate: Record Date;
        Customized: Record "HR Calendar List";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRLeavePeriods: Record "HR Leave Periods";
        HRJournalBatch: Record "HR Leave Journal Batch";
        ApprovalDate: Boolean;
        FileName: Text[100];
        LeaveBalance: Decimal;
        LeaveApp: Record "HR Leave Application";
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",JV,"Payment Voucher","Petty Cash",Requisition,InterBank,"Staff Claim","Staff Advance",AdvanceSurrender,Capex,IJ,"Hr Job","Emp Loan","Leave Application","Employee Requisition","Interview Evaluation","Training Requisition",Appraisal,HMO;
        DaysAppliedEdit: Boolean;
        LeaveTypes: Record "HR Leave Types";
        ExamLeaveBal: Decimal;
        hrrel: Record "HR Leave Reliver";
        PrevBal: Integer;
        AnnLeave: Decimal;

    [Scope('Cloud')]
    procedure FillVariables()
    begin
        //GET THE APPLICANT DETAILS
        HREmp.Reset;
        HREmp.SetRange("No.", rec."Employee No");
        if HREmp.Find('-') then begin
            EmpName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
            // EmpDept := HREmp."Global Dimension 2";
            // EmpDept := HREmp."Department Code";
            EmpDept := HREmp."Global Dimension 1";
        end
        else begin
            EmpDept := '';
            EmpName := '';
        end;
        //GET THE JOB DESCRIPTION FRON THE HR JOBS TABLE AND PASS IT TO THE VARIABLE
        // HRJobs.Reset;
        if HRJobs.Get(rec."Job Title") then begin
            EmpJobDesc := HRJobs."Job Title";
        end
        else begin
            EmpJobDesc := '';
        end;
        //GET THE APPROVER NAMES
        HREmp.Reset;
        //HREmp.SetRange(HREmp."User ID", rec.Supervisor);
        HREmp.SetRange(HREmp."Supervisor/Manager", rec.Supervisor);
        if HREmp.Find('-') then begin
            IF HREmp.Get(rec.Supervisor) then begin
                SupervisorName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                rec."Supervisor Email" := HREmp."Company E-Mail";
            end
            else begin
                SupervisorName := '';
                rec."Supervisor Email" := '';
            end;

        end;
    end;

    [Scope('Cloud')]
    procedure GetLeaveStats(LeaveType: Text[50])
    begin
        dAlloc := 0;
        dEarnd := 0;
        dTaken := 0;
        dLeft := 0;
        cReimbsd := 0;
        cPerDay := 0;
        cbf := 0;
        if HREmp.Get(rec."Employee No") then begin
            //HREmp.SETFILTER(HREmp."Leave Type Filter",LeaveType);
            HREmp.CalcFields(HREmp."Allocated Leave Days");
            dAlloc := HREmp."Allocated Leave Days";
            HREmp.Validate(HREmp."Allocated Leave Days");
            dEarnd := HREmp."Total (Leave Days)";
            HREmp.CalcFields(HREmp."Total Leave Taken");
            dTaken := HREmp."Total Leave Taken";
            dLeft := HREmp."Leave Balance";
            cReimbsd := HREmp."Cash - Leave Earned";
            cPerDay := HREmp."Cash per Leave Day";
            cbf := HREmp."Reimbursed Leave Days";
        end;
    end;

    [Scope('Cloud')]
    procedure TESTFIELDS()
    var
        hrrel: Record "HR Leave Reliver";
    begin
        rec.TestField("Leave Type");
        rec.TestField(rec."Days Applied");
        rec.TestField("Start Date");
        // rec.TestField(Supervisor);
        /* hrrel.SETRANGE(hrrel."Application No.","Application Code");
             IF hrrel.FINDSET THEN
              REPEAT
                 hrrel.TESTFIELD("Reliver No.");
              UNTIL hrrel.NEXT=0;    */
    end;

    [Scope('Cloud')]
    procedure Updatecontrols()
    begin
        if rec.Status = rec.Status::New then begin
            "Application CodeEditable" := false;
            "Leave TypeEditable" := true;
            "Days AppliedEditable" := true;
            "Responsibility CenterEditable" := false;
            "Start DateEditable" := true;
            "Leave Allowance AmountEditable" := true;
            RelieverEditable := true;
            RequestLeaveAllowanceEditable := false;
            SupervisorEditable := true;
            "Cell Phone NumberEditable" := true;
            //CurrForm."E-mail Address".EDITABLE:=TRUE;
            "Details of ExaminationEditable" := true;
            "Date of ExamEditable" := true;
            NumberofPreviousAttemptsEditab := true;
        end
        else
            if (rec.Status = rec.Status::"Pending Approval") or (rec.status = rec.Status::Approved) then begin
                "Application CodeEditable" := true;
                "Leave TypeEditable" := false;
                "Days AppliedEditable" := false;
                "Responsibility CenterEditable" := false;
                "Start DateEditable" := false;
                "Leave Allowance AmountEditable" := false;
                RelieverEditable := false;
                RequestLeaveAllowanceEditable := true;
                SupervisorEditable := false;
                "Cell Phone NumberEditable" := false;
                //CurrForm."E-mail Address".EDITABLE:=FALSE;
                "Details of ExaminationEditable" := false;
                "Date of ExamEditable" := false;
                NumberofPreviousAttemptsEditab := false;
            end;
    end;

    [Scope('Cloud')]
    procedure TestLeaveFamily()
    var
        LeaveFamily: Record "HR Leave Family Groups";
        LeaveFamilyEmployees: Record "HR Leave Family Employees";
        Employees: Record "HR Employees";
    begin
        LeaveFamilyEmployees.SetRange(LeaveFamilyEmployees."Employee No", rec."Employee No");
        if LeaveFamilyEmployees.FindSet then //find the leave family employee is associated with
            repeat
                LeaveFamily.SetRange(LeaveFamily.Code, LeaveFamilyEmployees.Family);
                LeaveFamily.SetFilter(LeaveFamily."Max Employees On Leave", '>0');
                if LeaveFamily.FindSet then //find the status other employees on the same leave family
 begin
                    Employees.SetRange(Employees."No.", LeaveFamilyEmployees."Employee No");
                    Employees.SetRange(Employees."Leave Status", Employees."Leave Status"::" ");
                    if Employees.Count > LeaveFamily."Max Employees On Leave" then Error('The Maximum number of employees on leave for this family has been exceeded, Contact the HR manager for more information');
                end until LeaveFamilyEmployees.Next = 0;
    end;

    [Scope('Cloud')]
    procedure DetermineLeaveReturnDate(var fBeginDate: Date; var fDays: Decimal) fReturnDate: Date
    begin
        varDaysApplied := fDays;
        fReturnDate := fBeginDate;
        repeat
            if DetermineIfIncludesNonWorking(rec."Leave Type") = false then begin
                fReturnDate := CalcDate('1D', fReturnDate);
                if DetermineIfIsNonWorking(fReturnDate) then
                    varDaysApplied := varDaysApplied + 1
                else
                    varDaysApplied := varDaysApplied;
                varDaysApplied := varDaysApplied - 1
            end
            else begin
                fReturnDate := CalcDate('1D', fReturnDate);
                varDaysApplied := varDaysApplied - 1;
            end;
        until varDaysApplied = 0;
        exit(fReturnDate);
    end;

    [Scope('Cloud')]
    procedure DetermineIfIncludesNonWorking(var fLeaveCode: Code[10]): Boolean
    begin
        if HRLeaveTypes.Get(fLeaveCode) then begin
            if HRLeaveTypes."Inclusive of Non Working Days" = true then exit(true);
        end;
    end;

    [Scope('Cloud')]
    procedure DetermineIfIsNonWorking(var bcDate: Date) Isnonworking: Boolean
    begin
        HRSetup.Find('-');
        HRSetup.TestField(HRSetup."Base Calendar");
        BaseCalendarChange.SetFilter(BaseCalendarChange."Base Calendar Code", HRSetup."Base Calendar");
        BaseCalendarChange.SetRange(BaseCalendarChange.Date, bcDate);
        if BaseCalendarChange.Find('-') then begin
            if BaseCalendarChange.Nonworking = false then Error('Start date can only be a Working Day Date');
            exit(true);
        end;
        /*
            Customized.RESET;
            Customized.SETRANGE(Customized.Date,bcDate);
            IF Customized.FIND('-') THEN BEGIN
                IF Customized."Non Working" = TRUE THEN
                EXIT(TRUE)
                ELSE
                EXIT(FALSE);
            END;
             */
    end;

    [Scope('Cloud')]
    procedure DeterminethisLeaveEndDate(var fDate: Date) fEndDate: Date
    begin
        ReturnDateLoop := true;
        fEndDate := fDate;
        if fEndDate <> 0D then begin
            fEndDate := CalcDate('-1D', fEndDate);
            while (ReturnDateLoop) do begin
                if DetermineIfIsNonWorking(fEndDate) then
                    fEndDate := CalcDate('-1D', fEndDate)
                else
                    ReturnDateLoop := false;
            end
        end;
        exit(fEndDate);
    end;

    [Scope('Cloud')]
    procedure CreateLeaveLedgerEntries()
    begin
        rec.TestField(rec."Approved days");
        HRSetup.Reset;
        if HRSetup.Find('-') then begin
            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            LeaveGjline.DeleteAll;
            //Dave
            //HRSetup.TESTFIELD(HRSetup."Leave Template");
            //HRSetup.TESTFIELD(HRSetup."Leave Batch");
            HREmp.Get(rec."Employee No");
            HREmp.TestField(HREmp."Company E-Mail");
            //POPULATE JOURNAL LINES
            "LineNo." := 10000;
            LeaveGjline.Init;
            LeaveGjline."Journal Template Name" := HRSetup."Leave Template";
            LeaveGjline."Journal Batch Name" := HRSetup."Leave Batch";
            LeaveGjline."Line No." := "LineNo.";
            LeaveGjline."Leave Period" := '2013';
            LeaveGjline."Document No." := rec."Application Code";
            LeaveGjline."Staff No." := rec."Employee No";
            LeaveGjline.Validate(LeaveGjline."Staff No.");
            LeaveGjline."Posting Date" := Today;
            LeaveGjline."Leave Entry Type" := LeaveGjline."Leave Entry Type"::Negative;
            LeaveGjline."Leave Approval Date" := Today;
            LeaveGjline.Description := 'Leave Taken';
            LeaveGjline."Leave Type" := rec."Leave Type";
            //------------------------------------------------------------
            //HRSetup.RESET;
            //HRSetup.FIND('-');
            HRSetup.TestField(HRSetup."Leave Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Leave Posting Period[TO]");
            //------------------------------------------------------------
            LeaveGjline."Leave Period Start Date" := HRSetup."Leave Posting Period[FROM]";
            LeaveGjline."Leave Period End Date" := HRSetup."Leave Posting Period[TO]";
            LeaveGjline."No. of Days" := rec."Approved days";
            if LeaveGjline."No. of Days" <> 0 then LeaveGjline.Insert(true);
            //Post Journal
            LeaveGjline.Reset;
            LeaveGjline.SetRange("Journal Template Name", HRSetup."Leave Template");
            LeaveGjline.SetRange("Journal Batch Name", HRSetup."Leave Batch");
            if LeaveGjline.Find('-') then begin
                CODEUNIT.Run(CODEUNIT::"HR Leave Jnl.-Post", LeaveGjline);
            end;
            rec.Status := rec.Status::Posted;
            rec.Modify;
            /*END ELSE BEGIN
                ERROR('You must specify no of days');
                END;
                END;*/
            //NotifyApplicant;
        end;
    end;

    [Scope('Cloud')]
    procedure NotifyApplicant()
    begin
        HREmp.Get(rec."Employee No");
        HREmp.TestField(HREmp."Company E-Mail");
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::General);
        if HREmailParameters.Find('-') then begin
            EmailAdd.add(HREmp."Company E-Mail");
            HREmp.TestField(HREmp."Company E-Mail");
            //   SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EmailAdd,
            // HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
            // HREmailParameters.Body + ' ' + rec."Application Code" + ' ' + HREmailParameters."Body 2", true);
            //  SMTP.Send();
            Message('Leave applicant has been notified successfully');
        end;
    end;

    local procedure CheckPatMat()
    var
        HrSetup: Record "HR Setup";
        HRLeaveApplication: Record "HR Leave Ledger Entries";
        HRLeaveTypes: Record "HR Leave Types";
        MaternityFomula: Code[10];
        MatDate: Date;
    begin
        HrSetup.Get;
        HRLeaveTypes.Get(rec."Leave Type");
        if HRLeaveTypes."Mat/Pat" = true then begin
            MaternityFomula := HrSetup."Maternity Leave Period";
            /*                                                                           //10/13....10/15
            MatDate:=CALCDATE(MaternityFomula,"Application Date");
            //Message('%1',MatDate);                                              7/15

            HRLeaveApplication.SETCURRENTKEY("Staff No.",HRLeaveApplication."Leave Type","Posting Date");
            HRLeaveApplication.SETRANGE(HRLeaveApplication."Staff No.",Rec."Employee No");
            HRLeaveApplication.SETRANGE(HRLeaveApplication."Leave Type",Rec."Leave Type");
            //HRLeaveApplication.SETRANGE(HRLeaveApplication."Posting Date");    //'%1..%2',CALCDATE(MaternityFomula,"Start Date"),"Start Date");
            IF HRLeaveApplication.FINDLAST THEN   BEGIN
             //ERROR('you can only apply for this leave type once in %1');
             //MESSAGE('%1',MatDate);
             MatDate := CALCDATE(MaternityFomula,HRLeaveApplication."Leave End Date");
              //IF (CALCDATE(MaternityFomula,HRLeaveApplication."Leave Start Date")) > ("Start Date") THEN
                ERROR('you can only apply for this leave type once in %1',MatDate);
            END;
            */
            HRLeaveApp.SetRange("Employee No", Rec."Employee No");
            HRLeaveApp.SetRange("Leave Type", Rec."Leave Type");
            if HRLeaveApp.FindLast then begin
                if CalcDate(MaternityFomula, HRLeaveApp."Return Date") > Rec."Application Date" then //MESSAGE('Return Date is %1 and Start Date is %2',HRLeaveApp."Return Date",Rec."Start Date");
                    //MatDate := CALCDATE(MaternityFomula,HRLeaveApp."Return Date");
                    Error('you can only apply for this leave type once in %1', MatDate);
            end;
        end;
    end;
    // local procedure ExportItemPicture()
    // var
    //     index: Integer;
    //     Media: Record "Tenant Media";
    //     InStream: InStream;
    //     Base64: Codeunit "Base64 Convert";
    //     HRLeaveApps: Record "HR Leave Application";
    // begin
    //     if HRLeaveApps.Pictures.count = 0 then begin
    //         HRLeaveApps.output := 'No Content';
    //         HRLeaveApps.Mime := '';
    //         HRLeaveApps."File Name" := '';
    //     end
    //     else
    //         for index := 1 to HRLeaveApps.Pictures.COUNT do begin
    //             if Media.Get(HRLeaveApps.Pictures.Item(index)) then begin
    //                 Media.CalcFields(Content);
    //                 if Media.Content.HasValue() then begin
    //                     Media.Content.CreateInStream(InStream, TextEncoding::WINDOWS);
    //                     HRLeaveApps.output := Base64.ToBase64(InStream);
    //                     HRLeaveApps.Mime := Media."Mime Type";
    //                     HRLeaveApps."File Name" := HRLeaveApps."Application Code" + ' ' + GetImgFileExtension(HRLeaveApps.Mime);
    //                 end;
    //             end;
    //         end;
    // end;
    // procedure ImportItemPicture()
    // var
    //     TempBlob: Codeunit "Temp Blob";
    //     outstream: OutStream;
    //     "File Name": Text;
    //     instream: InStream;
    //     Base64: Codeunit "Base64 Convert";
    //     OverrideImageQst: Label 'The existing picture will be replaced. Do you want to continue?';
    //     MustSpecifyDescriptionErr: Label 'You must add a description to the item before you can import a picture.';
    //     FileManagement: Codeunit "File Management";
    //     HRLeaveApp: Record "HR Leave Application";
    // begin
    //     // if Text.StrLen(HRLeaveApp.output) > 0 then begin
    //     //     if HRLeaveApp.Pictures.COUNT > 0 then
    //     //         Clear(HRLeaveApp.Pictures);
    //     //     TempBlob.CreateOutStream(outstream);
    //     //     Base64.FromBase64(HRLeaveApp.output, outstream);
    //     //     TempBlob.CreateInStream(InStream);
    //     //     HRLeaveApp.Pictures.ImportStream(InStream, HRLeaveApp."File Name", HRLeaveApp.Mime);
    //     //     rec.Modify();
    //     // end;
    //     if HRLeaveApp.Get(Rec."Application Code") then begin
    //         if Rec.Descriptions = '' then
    //             Error(MustSpecifyDescriptionErr);
    //         if Rec.Pictures.Count > 0 then
    //             if not Confirm(OverrideImageQst) then
    //                 Error('');
    //         "File Name" := Rec.ItemDesc + '.png';
    //         TempBlob.CreateOutStream(OutStream);
    //         Base64.FromBase64(rec.Output, OutStream);
    //         TempBlob.CreateInStream(InStream);
    //         Clear(Rec.Pictures);
    //         Rec.Pictures.ImportStream(InStream, "File Name");
    //         Rec.Modify(true);
    //     end;
    // end;
    local procedure GetImgFileExtension(Mime: Text): Text
    begin
        case Mime of
            'image/jpeg':
                exit('.jpg');
            'image/png':
                exit('.png');
            'image/bmp':
                exit('.bmp');
            'image/gif':
                exit('.gif');
            'image/tiff':
                exit('.tiff');
            'image/wmf':
                exit('.wmf');
        end;
    end;
    // procedure UploadItemPictureUrl()
    // var
    //     Client: HttpClient;
    //     Response: HttpResponseMessage;
    //     InStr: InStream;
    // begin
    //     if HRLeaveApp.Pictures.COUNT > 0 then
    //         Clear(HRLeaveApp.Pictures);
    //     Client.Get(HRLeaveApp."Picture URL", Response);
    //     Response.Content().ReadAs(InStr);
    //     HRLeaveApp.Pictures.ImportStream(InStr, HRLeaveApp."File Name", HRLeaveApp.Mime);
    //     rec.Modify();
    // end;
    var
        isOpen: boolean;
}
