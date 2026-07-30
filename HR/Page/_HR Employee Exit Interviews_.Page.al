page 54494 "HR Employee Exit Interviews"
{
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Exit Interview';
    SourceTable = "HR Employee Exit Interviews";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Exit Interview No"; Rec."Exit Interview No")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        if HREmp.Get(rec."Employee No.")then begin
                            JobTitle:=HREmp."Job Title";
                            sUserID:=HREmp."User ID";
                        end
                        else
                        begin
                            JobTitle:='';
                            sUserID:='';
                            rec."Global Dimension 2":=HREmp."Global Dimension 2";
                        end;
                        RecalcDates;
                        EmployeeNoOnAfterValidate;
                    end;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(JobTitle; JobTitle)
                {
                    ApplicationArea = all;
                    Caption = 'Job Title';
                    Editable = false;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Date of Join"; Rec."Date of Join")
                {
                    ApplicationArea = all;
                }
                field(Supervisor; Supervisor)
                {
                    ApplicationArea = all;
                }
                field(Duration; rec.Duration)
                {
                    ApplicationArea = all;
                }
                field("Mode of Exit"; Rec."Mode of Exit")
                {
                    ApplicationArea = all;
                }
                field("Interview Done By"; Rec."Interview Done By")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("No Notice Period"; Rec."No Notice Period")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        /*IF "No Notice Period" THEN
                         NoNotice:=TRUE
                        ELSE
                         NoNotice:=FALSE;
                        */
                        CurrPage.Update;
                    end;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                    Editable = NoNotice;
                    ShowMandatory = true;
                }
                field("Notice Period Served"; Rec."Notice Period Served")
                {
                    ApplicationArea = all;
                    Caption = 'Notice Period Served(Days)';
                    Editable = NoNotice;
                    ShowMandatory = true;
                }
                field("No. of Days Worked"; Rec."No. of Days Worked")
                {
                    ShowMandatory = true;
                    ApplicationArea = all;
                }
                field("Months Spent"; Rec."Months Spent")
                {
                    ShowMandatory = true;
                    ApplicationArea = all;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Leave Allowance Paid"; Rec."Leave Allowance Paid")
                {
                    ApplicationArea = all;
                }
                field("Pay NHF/PAYE"; Rec."Pay NHF/PAYE")
                {
                    ApplicationArea = all;
                    Caption = 'Deduct NHF/PAYE';
                }
                field("Annual Leave Owed"; Rec."Annual Leave Owed")
                {
                    ApplicationArea = all;
                }
                field("Monthly Take Home"; Rec."Monthly Take Home")
                {
                    ApplicationArea = all;
                    ShowMandatory = true;
                }
                field("No. of Leave Days to Deduct"; Rec."No. of Leave Days to Deduct")
                {
                    ApplicationArea = all;
                }
                field("Disciplinary Details"; Rec."Disciplinary Details")
                {
                    ApplicationArea = all;
                }
                field("Form Submitted"; Rec."Form Submitted")
                {
                    ApplicationArea = all;
                }
            }
            part(SF; "HR Asset Return Form")
            {
                Caption = 'Misc Articles';
                SubPageLink = "Employee No."=FIELD("Employee No.");
                ApplicationArea = All;
            }
            group(Control12)
            {
                ShowCaption = false;

                part(Control13; "HR Entitlement Lines")
                {
                    SubPageLink = "Application No."=FIELD("Exit Interview No");
                    ApplicationArea = All;
                }
                part(Control11; "HR Entitlement CardPart")
                {
                    Provider = Control13;
                    SubPageLink = "Application No."=FIELD("Application No.");
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = all;
            }
            systempart(Control1102755010; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Exit Interview")
            {
                Caption = '&Exit Interview';

                action(Form)
                {
                    Caption = 'Form';
                    Image = Form;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if DoclLink.Get(rec."Employee No.", 'Exit Interview')then begin
                            DoclLink.PlaceFilter(true, DoclLink."Employee No");
                            PAGE.RunModal(50050, DoclLink);
                        end
                        else
                        begin
                            DoclLink.Init;
                            DoclLink."Employee No":=rec."Employee No.";
                            DoclLink."Document Description":='Exit Interview';
                            DoclLink.Insert;
                            Commit;
                            DoclLink.PlaceFilter(true, DoclLink."Employee No");
                            PAGE.RunModal(50050, DoclLink);
                        end;
                    end;
                }
                action("<Page HR Exit Interview Checklist")
                {
                    Image = CheckList;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Exit Interview Checklist";
                    RunPageLink = "Exit Interview No"=FIELD("Exit Interview No"), "Employee No"=FIELD("Employee No.");
                    Visible = false;
                }
                action("Exit Form")
                {
                    Image = Card;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Emp Exit Interview Card";
                    RunPageLink = "Exit Interview No"=FIELD("Exit Interview No");

                    trigger OnAction()
                    begin
                    //RESET;
                    //SETFILTER("Exit Interview No","Exit Interview No");
                    //REPORT.RUN(39003928,TRUE,TRUE,Rec);
                    //RESET;
                    end;
                }
                action("<Hr Clearance Exit>")
                {
                    Caption = 'Clearance Exit';
                    Image = "Report";
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        rec.Reset;
                        rec.SetFilter("Exit Interview No", rec."Exit Interview No");
                        REPORT.Run(39003924, true, true, Rec);
                        rec.Reset;
                    end;
                }
                action("Exit Attachment")
                {
                    ApplicationArea = All;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No"=FIELD("Employee No."), "Document Type"=CONST(Exit);
                }
                action("Exit Entitlement")
                {
                    ApplicationArea = All;
                    Image = "Exit";
                    Promoted = true;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if rec."No Notice Period" then begin
                            rec.Reset;
                            rec.SetFilter("Exit Interview No", rec."Exit Interview No");
                            REPORT.Run(39003925, true, true, Rec);
                            rec.Reset;
                        end
                        else
                        begin
                            rec.Reset;
                            rec.SetFilter("Exit Interview No", rec."Exit Interview No");
                            REPORT.Run(39003926, true, true, Rec);
                            rec.Reset;
                        end;
                    end;
                }
                action("Send to HR")
                {
                    Image = SendConfirmation;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if rec.Status = rec.Status::"Pending Approval" then exit;
                        rec.Status:=rec.Status::"Pending Approval";
                        rec.Modify;
                        Message('Document has been sent to HR');
                    end;
                }
                action("Exit Deductions")
                {
                    Image = Account;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "HREmployee Exit Deductions";
                    RunPageLink = "Employee Code"=FIELD("Employee No."), "Exit No."=FIELD("Exit Interview No");
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if HREmp.Get(rec."Employee No.")then begin
            JobTitle:=HREmp."Job Title";
            sUserID:=HREmp."User ID";
        end
        else
        begin
            JobTitle:='';
            sUserID:='';
        end;
        rec.SetRange(rec."Employee No.");
        DAge:='';
        DService:='';
        DPension:='';
        DMedical:='';
        RecalcDates;
        if rec."No Notice Period" then NoNotice:=false
        else
            NoNotice:=true;
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."User Id":=UserId;
    end;
    var JobTitle: Text[30];
    Supervisor: Text[60];
    HREmp: Record "HR Employees";
    Dates: Codeunit "HR Dates";
    DAge: Text[100];
    DService: Text[100];
    DPension: Text[100];
    DMedical: Text[100];
    HREmpForm: Page "HR Employee Card";
    sUserID: Code[50];
    DoclLink: Record "HR Employee Attachments";
    InteractTemplLanguage: Record "Interaction Tmpl. Language";
    D: Date;
    Misc: Record "Misc. Article Information";
    Text19062217: Label 'Misc Articles';
    NoNotice: Boolean;
    [Scope('Cloud')]
    procedure RecalcDates()
    begin
        //Recalculate Important Dates
        if(HREmp."Date Of Leaving the Company" = 0D)then begin
            if(HREmp."Date Of Birth" <> 0D)then DAge:=Dates.DetermineAge(HREmp."Date Of Birth", Today);
            if(HREmp."Date Of Joining the Company" <> 0D)then DService:=Dates.DetermineAge(HREmp."Date Of Joining the Company", Today);
            if(HREmp."Pension Scheme Join Date" <> 0D)then DPension:=Dates.DetermineAge(HREmp."Pension Scheme Join Date", Today);
            if(HREmp."Medical Scheme Join Date" <> 0D)then DMedical:=Dates.DetermineAge(HREmp."Medical Scheme Join Date", Today);
        //MODIFY;
        end
        else
        begin
            if(HREmp."Date Of Birth" <> 0D)then DAge:=Dates.DetermineAge(HREmp."Date Of Birth", HREmp."Date Of Leaving the Company");
            if(HREmp."Date Of Joining the Company" <> 0D)then DService:=Dates.DetermineAge(HREmp."Date Of Joining the Company", HREmp."Date Of Leaving the Company");
            if(HREmp."Pension Scheme Join Date" <> 0D)then DPension:=Dates.DetermineAge(HREmp."Pension Scheme Join Date", HREmp."Date Of Leaving the Company");
            if(HREmp."Medical Scheme Join Date" <> 0D)then DMedical:=Dates.DetermineAge(HREmp."Medical Scheme Join Date", HREmp."Date Of Leaving the Company");
        //MODIFY;
        end;
    end;
    local procedure EmployeeNoOnAfterValidate()
    begin
        CurrPage.SaveRecord;
        rec.FilterGroup:=2;
        Misc.SetRange(Misc."Employee No.", rec."Employee No.");
        rec.FilterGroup:=0;
        if Misc.Find('-')then;
        CurrPage.Update(false);
    end;
}
