page 54644 "HR Employee Exit Interviews se"
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
                        if HREmp.Get(rec."Employee No.") then begin
                            JobTitle := HREmp."Job Title";
                            sUserID := HREmp."User ID";
                        end
                        else begin
                            JobTitle := '';
                            sUserID := '';
                            rec."Global Dimension 2" := HREmp."Global Dimension 2";
                        end;
                        RecalcDates;
                        EmployeeNoOnAfterValidate;
                    end;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(JobTitle; JobTitle)
                {
                    Caption = 'Job Title';
                    Editable = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    Visible = false;
                }
                field(DService; DService)
                {
                    Caption = 'Length of Service';
                    Editable = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    Visible = false;
                }
                field("HREmpForm.GetSupervisor(sUserID)"; HREmpForm.GetSupervisor(sUserID))
                {
                    Caption = 'Supervisor';
                    Editable = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = all;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                }
                field(Duration; rec.Duration)
                {
                    ApplicationArea = all;
                }
                field("Notice Period Served"; Rec."Notice Period Served")
                {
                    Caption = 'Notice Period Served(Days)';
                    ApplicationArea = all;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Interview Done By"; Rec."Interview Done By")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Interviewer Name"; Rec."Interviewer Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = false;
                }
                field("Annual Leave Owed"; Rec."Annual Leave Owed")
                {
                    ApplicationArea = all;
                }
                field("Nature of Separation"; Rec."Nature of Separation")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Reason For Leaving (Other)"; Rec."Reason For Leaving (Other)")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Worked more than 1 position"; Rec."Worked more than 1 position")
                {
                    ApplicationArea = all;
                }
                field("Re Employ In Future"; Rec."Re Employ In Future")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("If Yes,in what areas?"; Rec."If Yes,in what areas?")
                {
                    ApplicationArea = all;
                }
                field("Disciplinary Details"; Rec."Disciplinary Details")
                {
                    ApplicationArea = all;
                }
                field("Recommendations/Comments"; Rec."Recommendations/Comments")
                {
                    Caption = 'Recommendations';
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field(Comment; rec.Comment)
                {
                    Visible = false;
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
                SubPageLink = "Employee No." = FIELD("Employee No.");
                ApplicationArea = All;
            }
            group(Control11)
            {
                ShowCaption = false;

                part(Control12; "HR Entitlement Lines")
                {
                    SubPageLink = "Application No." = FIELD("Exit Interview No");
                    ApplicationArea = All;
                }
                part(Control13; "HR Entitlement CardPart")
                {
                    Provider = Control12;
                    SubPageLink = "Application No." = FIELD("Application No.");
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1102755008; Outlook)
            {
                ApplicationArea = All;
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
                        if DoclLink.Get(rec."Employee No.", 'Exit Interview') then begin
                            DoclLink.PlaceFilter(true, DoclLink."Employee No");
                            PAGE.RunModal(50050, DoclLink);
                        end
                        else begin
                            DoclLink.Init;
                            DoclLink."Employee No" := rec."Employee No.";
                            DoclLink."Document Description" := 'Exit Interview';
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
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "HR Exit Interview Checklist";
                    RunPageLink = "Exit Interview No" = FIELD("Exit Interview No"), "Employee No" = FIELD("Employee No.");
                    Visible = false;
                }
                action("Exit Form")
                {
                    Image = "Report";
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        rec.Reset;
                        rec.SetFilter("Exit Interview No", rec."Exit Interview No");
                        REPORT.Run(39003928, true, true, Rec);
                        rec.Reset;
                    end;
                }
                action("<Hr Clearance Exit>")
                {
                    Caption = 'Clearance Exit';
                    Image = "Report";
                    Promoted = true;
                    ApplicationArea = all;
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
                    ApplicationArea = all;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No" = FIELD("Employee No."), "Document Type" = CONST(Exit);
                    Visible = false;
                }
                action("Exit Entitlement")
                {
                    Image = "Exit";
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = "Report";
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        rec.Reset;
                        rec.SetFilter("Exit Interview No", rec."Exit Interview No");
                        REPORT.Run(39003926, true, true, Rec);
                        rec.Reset;
                    end;
                }
                action("Send to HR")
                {
                    Image = SendConfirmation;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if rec.Status = rec.Status::"Pending Approval" then exit;
                        rec.Status := rec.Status::"Pending Approval";
                        //CommentModify;
                        Message('Document has been sent to HR');
                    end;
                }
                action("Test Attachment")
                {
                    Caption = 'Attachment';
                    Image = Attach;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = Page "Attachment Test";
                    //RunPageLink = "Employee No" = FIELD("Employee No."),"Application No" = FIELD("Exit Interview No"),"Document Type" = CONST(Exit), "Folder Type" = CONST(HR);
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        if HREmp.Get(rec."Employee No.") then begin
            JobTitle := HREmp."Job Title";
            sUserID := HREmp."User ID";
        end
        else begin
            JobTitle := '';
            sUserID := '';
        end;
        rec.SetRange(rec."Employee No.");
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';
        RecalcDates;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."User Id" := UserId;
    end;

    var
        JobTitle: Text[30];
        Supervisor: Text[60];
        HREmp: Record "HR Employees";
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

    [Scope('Cloud')]
    procedure RecalcDates()
    begin
        //Recalculate Important Dates
        /*IF (HREmp."Date Of Leaving the Company" = 0D) THEN BEGIN
              IF  (HREmp."Date Of Birth" <> 0D) THEN
              DAge:= Dates.DetermineAge(HREmp."Date Of Birth",TODAY);
              IF  (HREmp."Date Of Joining the Company" <> 0D) THEN
              DService:= Dates.DetermineAge(HREmp."Date Of Joining the Company",TODAY);
              IF  (HREmp."Pension Scheme Join Date" <> 0D) THEN
              DPension:= Dates.DetermineAge(HREmp."Pension Scheme Join Date",TODAY);
              IF  (HREmp."Medical Scheme Join Date" <> 0D) THEN
              DMedical:= Dates.DetermineAge(HREmp."Medical Scheme Join Date",TODAY);
              //MODIFY;
            END ELSE BEGIN
              IF  (HREmp."Date Of Birth" <> 0D) THEN
              DAge:= Dates.DetermineAge(HREmp."Date Of Birth",HREmp."Date Of Leaving the Company");
              IF  (HREmp."Date Of Joining the Company" <> 0D) THEN
              DService:= Dates.DetermineAge(HREmp."Date Of Joining the Company",HREmp."Date Of Leaving the Company");
              IF  (HREmp."Pension Scheme Join Date" <> 0D) THEN
              DPension:= Dates.DetermineAge(HREmp."Pension Scheme Join Date",HREmp."Date Of Leaving the Company");
              IF  (HREmp."Medical Scheme Join Date" <> 0D) THEN
              DMedical:= Dates.DetermineAge(HREmp."Medical Scheme Join Date",HREmp."Date Of Leaving the Company");
              //MODIFY;
            END;
            */
        //lateef
    end;

    local procedure EmployeeNoOnAfterValidate()
    begin
        CurrPage.SaveRecord;
        rec.FilterGroup := 2;
        Misc.SetRange(Misc."Employee No.", rec."Employee No.");
        rec.FilterGroup := 0;
        if Misc.Find('-') then;
        CurrPage.Update(false);
    end;
}
