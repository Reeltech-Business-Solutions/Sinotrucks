page 54545 "HR Training Application Card"
{
    DeleteAllowed = true;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Functions,Show';
    SourceTable = "HR Training Applications";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Application No"; Rec."Application No")
                {
                    Editable = "Application NoEditable";
                    ApplicationArea = all;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }
                field("Recommended By"; Rec."Recommended By")
                {
                    ApplicationArea = all;
                    Editable = true;

                    trigger OnValidate()
                    begin
                    //CurrPage.UPDATE;
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = "Employee DepartmentEditable";
                    ApplicationArea = All;
                }
            }
            group("Training Details")
            {
                Caption = 'Training Details';

                group(Control9)
                {
                    ShowCaption = false;
                    Visible = false;

                    field("Course Title"; Rec."Course Title")
                    {
                        ApplicationArea = all;
                        Editable = "Course TitleEditable";
                    }
                    field(Description; rec.Description)
                    {
                        ApplicationArea = all;
                    }
                    field("Reason for Training"; Rec."Reason for Training")
                    {
                        ApplicationArea = all;
                        MultiLine = false;
                    }
                    field("From Date"; Rec."From Date")
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                        //  message('I got here')
                        //IF "From Date" - "Application Date" < HRSetup."Training Application Before" THEN
                        //ERROR('Sorry, %1, There must be at least 10 days between the "Application Date"  and "Training Start Date"', UPPERCASE(USERID));
                        end;
                    }
                    field("To Date"; Rec."To Date")
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            rec.Duration:=rec."To Date" - rec."From Date";
                        end;
                    }
                    field("Duration Units"; Rec."Duration Units")
                    {
                        ApplicationArea = all;
                        Visible = false;
                    }
                    field("Cost Of Training"; Rec."Cost Of Training")
                    {
                        ApplicationArea = all;
                    }
                    field("Approved Cost"; Rec."Approved Cost")
                    {
                        ApplicationArea = all;
                    }
                }
                group(Control8)
                {
                    ShowCaption = false;
                    Visible = true;

                    field("Staff Course Title"; Rec."Staff Course Title")
                    {
                        ApplicationArea = all;
                    }
                    field(FromDate; rec."From Date")
                    {
                        ApplicationArea = all;
                        Caption = 'From Date';

                        trigger OnValidate()
                        begin
                            //MESSAGE('I GOT HERE');
                            HRSetup.Get;
                            //MESSAGE('%1|%2',"From Date"-"Application Date", HRSetup."Training Application Before");
                            if rec."From Date" - rec."Application Date" < HRSetup."Training Application Before" then //MESSAGE ('%1, ("Application Date" - "From Date")');
                                //MESSAGE ('%1,HRSetup."Training Application Before');
                                Error('Sorry, %1, There must be at least 10 days between the "Application Date"  and "Training Start Date"', UpperCase(UserId));
                        end;
                    }
                    field(Duration; rec.Duration)
                    {
                        ApplicationArea = all;
                    }
                    field("<CostOfTraining"; Rec."Cost Of Training")
                    {
                        ApplicationArea = all;
                        Caption = 'Cost of Training';
                    }
                    field(ToDate; rec."To Date")
                    {
                        ApplicationArea = all;
                        Caption = 'To Date';

                        trigger OnValidate()
                        begin
                            rec.Duration:=rec."To Date" - rec."From Date";
                        end;
                    }
                    field(Location; rec.Location)
                    {
                        ApplicationArea = all;
                    }
                    field(VendorName; VendorName)
                    {
                        Caption = 'Vendor Name';
                        ApplicationArea = all;
                    }
                    field(Provider; rec.Provider)
                    {
                        ApplicationArea = all;
                    }
                    field("Provider Name"; Rec."Provider Name")
                    {
                        ApplicationArea = all;
                        Editable = false;
                    }
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Editable = "Responsibility CenterEditable";
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
            part(Control2; "Hr Training Need App SF")
            {
                SubPageLink = "Document No."=FIELD("Application No");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Trainings Factbox")
            {
                SubPageLink = "Application No"=FIELD("Application No");
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

                action(Comments)
                {
                    Caption = 'Comments';
                    Image = Comment;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category5;

                    trigger OnAction()
                    var
                        DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, WorkOrder, Job, Trip, Fuel, Diversion, HSSEQ, VehicleRelease, DriverAllowance, TruckVerification, BatteryJV, Towing, Interchange, TyreReplacement, LCAdvance, APRAF, FuelRecon, "Job Approval", "Employee Requisition", "Interview Evaluation", "Training Requisition", "Leave Application", Appraisal;
                    begin
                        DocumentType:=DocumentType::"Training Requisition";
                    /*
                        ApprovalComments.Setfilters(DATABASE::"HR Training Applications",DocumentType,"Application No");
                        ApprovalComments.SetUpLine(DATABASE::"HR Training Applications",DocumentType,"Application No");
                        ApprovalComments.RUN;
                         */
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';

                action("&Approvals")
                {
                    ApplicationArea = all;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        DocumentType:=DocumentType::"Training Requisition";
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Training Applications", DocumentType, rec."Application No");
                        ApprovalEntries.Run;
                    end;
                }
                action("&Send Approval &Request")
                {
                    ApplicationArea = all;
                    Caption = '&Send Approval &Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        rec.TestField(Provider);
                        rec.TestField("Cost Of Training");
                        CheckLine;
                        if Confirm('Send this Application for Approval?', true) = false then exit;
                    //ApprovalMgt.SendTrainingAppApprovalRequest(Rec);
                    end;
                }
                action("&Cancel Approval request")
                {
                    ApplicationArea = all;
                    Caption = '&Cancel Approval request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to cancel the approval request', true) = false then exit;
                    //ApprovalMgt.CancelTrainingAppApprovalReq(Rec,TRUE,TRUE);
                    end;
                }
                action("&Print")
                {
                    ApplicationArea = all;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.TestField(rec.Status, rec.Status::Approved);
                        HRTrainingApplications.SetRange(HRTrainingApplications."Application No", rec."Application No");
                        if HRTrainingApplications.Find('-')then REPORT.Run(39005580, true, true, HRTrainingApplications);
                    end;
                }
                action("<A ction1102755042>")
                {
                    ApplicationArea = all;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        rec.Status:=rec.Status::New;
                        rec.Modify;
                    end;
                }
                action("Generate PV")
                {
                    ApplicationArea = all;
                    Image = Payment;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = true;

                    trigger OnAction()
                    begin
                        rec.TestField(Status, rec.Status::Approved);
                        rec.GeneratePV;
                    end;
                }
                action(" Attachments")
                {
                    ApplicationArea = all;
                    Caption = ' Attachments';
                    Image = Attach;
                    Promoted = true;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No"=FIELD("Application No"), "Document Type"=CONST(Training);
                }
                action("Send Mail")
                {
                    Image = SendMail;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DisPCase: Record "HR Disciplinary Cases";
                        Emp: Record "HR Employees";
                    begin
                        rec.TestField(Status, rec.Status::Approved);
                        SendMail;
                    end;
                }
            /*  action("Test Attachment")
                  {
                      Caption = 'Attachment';
                      Image = Attach;
                      Promoted = true;
                      PromotedCategory = Process;
                      PromotedIsBig = true;
                      RunObject = Page "Attachment Test";
                      RunPageLink = "Employee No" = FIELD("User ID"),
                                    "Document Type" = CONST(Training),
                                    "Folder Type" = CONST(HR),
                                    "Application No" = FIELD("Application No");
                  }
                  */
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        /*UserSetup.GET("UserID");
        IF NOT UserSetup.HR THEN BEGIN
        xRec := Rec;
        IF Status<>Status::New THEN
        BEGIN
          CurrPage.EDITABLE:=FALSE;
          CurrPage.UPDATE;
        END;
        END;
        
        
        
        IF Status=Status::New THEN BEGIN
        "Responsibility CenterEditable" :=TRUE;
        "Application NoEditable" :=TRUE;
        "Employee No.Editable" :=TRUE;
        "Employee NameEditable" :=TRUE;
        "Employee DepartmentEditable" :=TRUE;
        "Purpose of TrainingEditable" :=TRUE;
        "Course TitleEditable" :=TRUE;
        END ELSE BEGIN
        "Responsibility CenterEditable" :=FALSE;
        "Application NoEditable" :=FALSE;
        "Employee No.Editable" :=FALSE;
        "Employee NameEditable" :=FALSE;
        "Employee DepartmentEditable" :=FALSE;
        "Purpose of TrainingEditable" :=FALSE;
        "Course TitleEditable" :=FALSE;
        END;
         */
        if rec."Recommended By" = rec."Recommended By"::Staff then begin
            Staff:=true;
            Company:=false;
        end
        else if rec."Recommended By" = rec."Recommended By"::Company then begin
                Company:=true;
                Staff:=false;
            end;
    end;
    trigger OnInit()
    begin
        "Course TitleEditable":=true;
        "Purpose of TrainingEditable":=true;
        "Employee DepartmentEditable":=true;
        "Employee NameEditable":=true;
        "Employee No.Editable":=true;
        "Application NoEditable":=true;
        "Responsibility CenterEditable":=true;
    end;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean var
        TrainingApplicant: Record "HR Training Need Participant";
        Emp: Record "HR Employees";
    begin
    /*IF Type = Type::Staff THEN BEGIN
         UserSetup.GET(USERID);
         Emp.SETRANGE("User ID",UserSetup."User ID");
         IF Emp.FINDFIRST THEN BEGIN
         TrainingApplicant.INIT;
         TrainingApplicant."Line No.":=0;
         TrainingApplicant."Document No.":=Rec."Application No";
         TrainingApplicant."Employee Code" := Emp."No.";
         TrainingApplicant.Department := Emp."Department Code";
         TrainingApplicant."Job Title":=Emp."Job Title";
         TrainingApplicant.VALIDATE("Employee Code");
         TrainingApplicant.INSERT;
         END;
         END;
         */
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec.Type:=rec.Type::Staff;
        rec."Recommended By":=rec."Recommended By"::Staff;
    /*
        IF Type = Type::Staff THEN BEGIN
         UserSetup.GET(USERID);
         Emp.SETRANGE("User ID",UserSetup."User ID");
         IF Emp.FINDFIRST THEN BEGIN
         TrainingApplicant.INIT;
         TrainingApplicant."Line No.":=0;
         TrainingApplicant."Document No.":=Rec."Application No";
         TrainingApplicant."Employee Code" := Emp."No.";
         TrainingApplicant.Department := Emp."Department Code";
         TrainingApplicant."Job Title":=Emp."Job Title";
         TrainingApplicant.VALIDATE("Employee Code");
         TrainingApplicant.INSERT;
         END;
         END;
        */
    end;
    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        if not UserSetup.HR then begin
            xRec:=Rec;
            if rec.Status <> rec.Status::New then begin
                CurrPage.Editable:=false;
                CurrPage.Update;
            end;
        end;
        Company:=false;
        Staff:=false;
    end;
    var Email: List of[Text];
    HREmp: Record "HR Employees";
    EmpNames: Text[40];
    sDate: Date;
    HRTrainingApplications: Record "HR Training Applications";
    ApprovalMgt: Codeunit "Approvals Mgmt.";
    ApprovalComments: Page "Approval Comments";
    [InDataSet]
    "Responsibility CenterEditable": Boolean;
    [InDataSet]
    "Application NoEditable": Boolean;
    [InDataSet]
    "Employee No.Editable": Boolean;
    [InDataSet]
    "Employee NameEditable": Boolean;
    [InDataSet]
    "Employee DepartmentEditable": Boolean;
    [InDataSet]
    "Purpose of TrainingEditable": Boolean;
    [InDataSet]
    "Course TitleEditable": Boolean;
    DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", JV, "Payment Voucher", "Petty Cash", Requisition, InterBank, "Staff Claim", "Staff Advance", AdvanceSurrender, Capex, IJ, "Hr Job", "Emp Loan", "Leave Application", "Employee Requisition", "Interview Evaluation", "Training Requisition", Appraisal, HMO, Canteen, EmpTransaction, LeaveAck, PFAMod, PFATransfer;
    UserSetup: Record "User Setup";
    Staff: Boolean;
    Company: Boolean;
    Emp: Record "HR Employees";
    TrainingApplicant: Record "HR Training Need Participant";
    VendorName: Code[50];
    HREmailParameters: Record "HR E-Mail Parameters";
    HRTrainingNeedParticipant: Record "HR Training Need Participant";
    HRSetup: Record "HR Setup";
    [Scope('Cloud')]
    procedure TESTFIELDS()
    begin
        //TESTFIELD("Course Title");
        //TESTFIELD("From Date");
        //TESTFIELD("To Date");
        //TESTFIELD("Duration Units");
        //TESTFIELD(Duration);
        //TESTFIELD("Cost Of Training");
        rec.TestField(Location);
        rec.TestField(Provider);
        rec.TestField("Reason for Training");
    end;
    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Emp: Record "HR Employees";
        EmpNames: Text[50];
    begin
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        if rec."Sent to Staff" then Error('All applicants have been notified');
        //TESTFIELD("Applicant Type","Applicant Type"::Internal);
        TrainingApplicant.SetRange(TrainingApplicant."Document No.", rec."Application No");
        if TrainingApplicant.FindFirst then begin
            repeat HREmailParameters.Reset;
                HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Training Application");
                if HREmailParameters.Find('-')then begin
                    HREmp.Get(TrainingApplicant."Employee Code");
                    HREmp.TestField(HREmp."Company E-Mail");
                    Email.Add(HREmp."Company E-Mail");
                //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", Email,
                //HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                //HREmailParameters.Body + ' ' + ' ' + HREmailParameters."Body 2", true);
                //SMTP.Send();
                end;
            until TrainingApplicant.Next = 0;
            Message('Applicants have been notified');
        end;
        rec."Sent to Staff":=true;
        rec.Modify;
    end;
    local procedure CheckLine()
    var
        HRTrainingNeedParticipant: Record "HR Training Need Participant";
    begin
        HRTrainingNeedParticipant.Reset;
        HRTrainingNeedParticipant.SetRange(HRTrainingNeedParticipant."Document No.", rec."Application No");
        if HRTrainingNeedParticipant.FindFirst then begin
            repeat HRTrainingNeedParticipant.TestField(HRTrainingNeedParticipant.Amount);
                HRTrainingNeedParticipant.TestField(HRTrainingNeedParticipant."Staff Course Title");
                HRTrainingNeedParticipant.TestField(HRTrainingNeedParticipant."From Date");
                HRTrainingNeedParticipant.TestField(HRTrainingNeedParticipant."To Date");
            until HRTrainingNeedParticipant.Next = 0;
        end;
    end;
}
