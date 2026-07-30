page 50263 "Appraisal Goal Setting List Se"
{
    Caption = 'Supervisor Appraisal Review List(Second)';
    CardPageID = "HR Appraisal Goal Setting H Se";
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Supervisor Appraisal Review List(Second)';
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Appraisal Goal Setting H";
    SourceTableView = WHERE(Status = CONST(Review),
                            "Appraisal Half" = CONST(Second));

    layout
    {
        area(content)
        {
            repeater("Appraisee Information")
            {
                Caption = 'Appraisee Information';
                field("Appraisal No"; rec."Appraisal No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee No"; rec."Employee No")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Employee Name"; rec."Employee Name")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Job Title"; rec."Job Title")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Appraisal Period"; rec."Appraisal Period")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Evaluation Period Start"; rec."Evaluation Period Start")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Period End"; rec."Evaluation Period End")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Date"; rec."Appraisal Date")
                {
                    ApplicationArea = all;
                }
                field(Unit; rec.Unit)
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; rec."Responsibility Center")
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
            group("&Functions")
            {
                Caption = '&Functions';
                action("Send To Appraiser")
                {
                    Caption = 'Send To Appraiser';
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        LinesExists;

                        if Confirm('Do you want to send this Appraisal Form to your Appraiser?', false) = true then begin
                            rec.Status := rec.Status::"Pending Approval";
                            rec.Modify;
                            Message('%1', 'Process Completed')
                        end;
                    end;
                }
                action("Get Job Specific Evaluation Areas")
                {
                    Caption = 'Get Job Specific Evaluation Areas';
                    Image = ChangeTo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if rec."Job Title" = '' then
                            Error('Please specify the employees job title in the Employee card before proceeding');


                        if Confirm('Any previous job specific evaluations made for ' + rec."Employee Name" + ' Appraisal Period ' + rec."Appraisal Period" + ' ' +
                        'will be deleted. Proceed?', true) = false then
                            exit;

                        HRAppraisalEvaluations.Reset;
                        HRAppraisalEvaluations.SetRange(HRAppraisalEvaluations."Employee No", rec."Employee No");
                        HRAppraisalEvaluations.SetRange(HRAppraisalEvaluations."Appraisal Period", rec."Appraisal Period");
                        HRAppraisalEvaluations.SetRange(HRAppraisalEvaluations.Category, HRAppraisalEvaluations.Category::"JOB SPECIFIC EVALUATION AREA");
                        if HRAppraisalEvaluations.Find('-') then
                            HRAppraisalEvaluations.DeleteAll;


                        //COPY EVALUATION AREA FOR ONE EMPLOYEE
                        HRAppraisalEvaluationAreas.Reset;
                        if HREmp.Get(rec."Employee No") then
                            if HREmp.Supervisor = false then
                                HRAppraisalEvaluationAreas.SetRange(HRAppraisalEvaluationAreas.Supervisor, false);
                        //HRAppraisalEvaluationAreas.SETRANGE(HRAppraisalEvaluationAreas."Assign To","Job Title");
                        if HRAppraisalEvaluationAreas.FindSet then
                            repeat
                                HRAppraisalEvaluations.Init;
                                HRAppraisalEvaluations."Employee No" := rec."Employee No";
                                HRAppraisalEvaluations."Evaluation Code" := HRAppraisalEvaluationAreas.Code;
                                HRAppraisalEvaluations."Sub Category" := HRAppraisalEvaluationAreas."Sub Category";
                                HRAppraisalEvaluations.Group := HRAppraisalEvaluationAreas.Group;
                                HRAppraisalEvaluations.Category := HRAppraisalEvaluationAreas."Categorize As";
                                HRAppraisalEvaluations."Evaluation Description" := HRAppraisalEvaluationAreas.Description;
                                HRAppraisalEvaluations."Line No" := HRAppraisalEvaluationAreas."Line No";
                                HRAppraisalEvaluations."Appraisal Period" := rec."Appraisal Period";
                                HrRatings.FindLast;
                                //HRAppraisalEvaluations."Total Target":=HrRatings.Answer;
                                HRAppraisalEvaluations.Insert(true);
                            until HRAppraisalEvaluationAreas.Next = 0;
                    end;
                }
                action("Send To Supervisor")
                {
                    Caption = 'Send To Supervisor';
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        LinesExists;

                        if Confirm('Do you want to send this Appraisal Form to  your Supervisor?', false) = true then begin
                            rec.Status := 1;
                            rec.Modify;
                            Message('%1', 'Process Completed')
                        end;
                    end;
                }
                action("Get KPI")
                {
                    Caption = 'Get KPI';
                    Image = ChangeTo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //COPY KPI FOR ONE EMPLOYEE
                        NextKPI.Reset;
                        NextKPI.SetRange(NextKPI."Appraisal No", rec."Appraisal No");
                        NextKPI.SetRange(NextKPI."KPI Period", NextKPI."KPI Period"::Next);
                        NextKPI.DeleteAll;

                        KPIGoalSetting.Reset;
                        KPIGoalSetting.SetRange(KPIGoalSetting."Appraisal No", rec."Appraisal No");
                        KPIGoalSetting.SetRange("KPI Period", KPIGoalSetting."KPI Period"::Current);
                        if KPIGoalSetting.FindSet then
                            repeat
                                NextKPI.Init;
                                NextKPI.TransferFields(KPIGoalSetting);
                                NextKPI."KPI Period" := NextKPI."KPI Period"::Next;
                                NextKPI.Insert(true);
                            until KPIGoalSetting.Next = 0;
                    end;
                }
                separator(Action1000000009)
                { }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;


                    trigger OnAction()
                    var
                        ApprovalEntries: Page 658;
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        doctype: Enum "Approval Document Type";
                    begin
                        // DocType := DocType::"Staff Advance";
                        // WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RecordId, DATABASE::"HR Appraisal Goal Setting H", DocType.AsInteger(), "Appraisal No");
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        /*
                        IF NOT LinesExists THEN
                           ERROR('There are no Lines created for this Document');
                        
                        
                          IF NOT AllFieldsEntered THEN
                             ERROR('Some of the Key Fields on the Lines:[ACCOUNT NO.,AMOUNT] Have not been Entered please RECHECK your entries');
                        
                        //Ensure No Items That should be committed that are not
                        IF LinesCommitmentStatus THEN
                          ERROR('There are some lines that have not been committed');
                        */
                        //Release the Imprest for Approval
                        //IF ApprovalMgt.SendAppraisalApprovalRequest(Rec) THEN;

                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //IF ApprovalMgt."--CoreTec--"(Rec,TRUE,TRUE) THEN;
                    end;
                }
                action("Return To Appraisee")
                {
                    Caption = 'Return To Appraisee';
                    Image = Return;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to return this Appraisal Form to the appraisee?', false) = true then begin
                            rec.Status := rec.Status::Open;
                            rec.Modify;
                            Message('%1', 'Process Completed')
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalcScores;
    end;

    trigger OnOpenPage()
    begin
        /*
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."User ID",USERID);
        IF HREmp.GET THEN
        SETRANGE("User ID",HREmp."User ID")
        ELSE
        SETRANGE("User ID",USERID);
        
        HREmp.RESET;
        HREmp.SETRANGE(HREmp."User ID",USERID);
        IF HREmp.GET THEN
        SETRANGE("User ID",HREmp."User ID")
        ELSE
        SETRANGE("User ID",USERID);
        
        //"Supervisor/Manager"
         */

        //SETRANGE(Supervisor,USERID);

        rec.FilterGroup(2);
        rec.SetRange(Supervisor, UserId);
        rec.FilterGroup(0);

    end;

    var
        HasLines: Boolean;
        Text19033494: Label 'Set your goals and objectives in line with your departments strategy.';
        HRAppraisalEvaluationAreas: Record "HR Appraisal Evaluation Areas";
        HRAppraisalEvaluations: Record "HR Appraisal Evaluations";
        // HRAppraisalEvaluationsF: Page "HR Appraisal Evaluation Lines";
        HREmp: Record "HR Employees";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender;
        KPIGoalSetting: Record "HR Appraisal Goal Setting L";
        NextKPI: Record "HR Appraisal Goal Setting L";
        CompanyScoreAppraisee: Decimal;
        KPIScoreAppraisee: Decimal;
        PFScoreAppraisee: Decimal;
        PFBase: Decimal;
        HrRatings: Record "HR Appraisal Career Dev";

    // [Scope('OnPrem')]
    procedure LinesExists(): Boolean
    var
        HRAppraisalGoals: Record "HR Appraisal Goal Setting L";
    begin
        HasLines := false;
        HRAppraisalGoals.Reset;
        HRAppraisalGoals.SetRange(HRAppraisalGoals."Appraisal No", rec."Appraisal No");
        if HRAppraisalGoals.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;

    //[Scope('OnPrem')]
    procedure CalcScores()
    var
        Employee: Record "HR Employees";
    begin
        CompanyScoreAppraisee := (rec."Company Score" / 100) * 40;
        KPIScoreAppraisee := (rec."KPIs Mgt Score" / 100) * 30;

        PFBase := 44;
        if Employee.Get(rec."Employee No") then
            if Employee.Supervisor = true then
                PFBase := 64;

        PFScoreAppraisee := (rec."Performance Score Mgt" / PFBase) * 30
    end;
}

