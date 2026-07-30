page 51541 "HR Appraisal Goal EV"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Document;
    PromotedActionCategories = 'New,Process,Reports,Functions,NextPage';
    SourceTable = "HR Appraisal Goal Setting H";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Appraisal No"; rec."Appraisal No")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee No"; rec."Employee No")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Employee Name"; rec."Employee Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Job Title"; rec."Job Title")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Appraisal Period"; rec."Appraisal Period")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Appraisal Type"; rec."Appraisal Type")
                {
                    ApplicationArea = all;
                }
                field(Picture; rec.Picture)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field(Status; rec.Status)
                {
                    Editable = true;
                    Importance = Promoted;
                    Style = StrongAccent;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
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
                field("Company Score"; rec."Company Score")
                {
                    ExtendedDatatype = Ratio;
                    ApplicationArea = all;
                    MaxValue = 100;
                }
                field(CompanyScoreAppraisee; CompanyScoreAppraisee)
                {
                    ApplicationArea = all;
                    Caption = 'Appraisee Company Score';
                    Editable = false;
                    ExtendedDatatype = None;
                }
                field("Bonus Point appraisee"; rec."Bonus Point appraisee")
                {
                    ApplicationArea = all;
                }
                field("KPIs Appraisee Score"; rec."KPIs Appraisee Score")
                {
                    ExtendedDatatype = None;
                    ApplicationArea = all;
                }
                field("KPIs Appraiser Score"; rec."KPIs Appraiser Score")
                {
                    ExtendedDatatype = None;
                    ApplicationArea = all;
                }
                field("KPIs Mgt Score"; rec."KPIs Mgt Score")
                {
                    ExtendedDatatype = None;
                    ApplicationArea = all;
                }
                field(KPIScoreMgt; KPIScoreMgt)
                {
                    ApplicationArea = all;
                    Caption = 'KPI Score';
                    Editable = false;
                    Enabled = false;
                    ExtendedDatatype = None;
                    Visible = false;
                }
                field("Performance Score Appraisee"; rec."Performance Score Appraisee")
                {
                    ExtendedDatatype = None;
                    ApplicationArea = all;
                }
                field("Performance Score Appraiser"; rec."Performance Score Appraiser")
                {
                    ExtendedDatatype = None;
                    ApplicationArea = all;
                }
                field("Performance Score Mgt"; rec."Performance Score Mgt")
                {
                    ApplicationArea = all;
                    ExtendedDatatype = None;
                }
                field(PFScoreMgt; PFScoreMgt)
                {
                    Caption = 'Performance Score';
                    Enabled = false;
                    ExtendedDatatype = None;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Development Plans"; rec."Development Plans")
                {
                    Caption = 'Development Requirements Appraisee';
                    Editable = false;
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Development Requirements Appra"; rec."Development Requirements Appra")
                {
                    Caption = 'Development Requirements Appraiser';
                    Editable = false;
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Development Requirements Mgt"; rec."Development Requirements Mgt")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
                field("Comments Appraisee"; rec."Comments Appraisee")
                {
                    ApplicationArea = all;
                    Editable = false;
                    MultiLine = true;
                }
                field("Comments Appraiser"; rec."Comments Appraiser")
                {
                    ApplicationArea = all;
                    Editable = false;
                    MultiLine = true;
                }
                field("Comments Mgt"; rec."Comments Mgt")
                {
                    ApplicationArea = all;
                    MultiLine = true;
                }
            }
            part("Current Period's KPI"; "HR Appraisal Goal Setting LMn1")
            {
                ApplicationArea = All;
                Caption = 'Current Period''s KPI';
                SubPageLink = "Appraisal No" = FIELD("Appraisal No");
            }
            part(SF; "HR Mgt Evaluation Lines")
            {
                ApplicationArea = All;
                Caption = 'Job Specific Evaluation(Performance Factors)';
                SubPageLink = "Employee No" = FIELD("Employee No"),
                              "Appraisal Period" = FIELD("Appraisal Period");
            }
            group("Evaluation Scores/Remarks")
            {

                Caption = 'Evaluation Scores/Remarks';
                Editable = false;
                field("Bonus Point Appraiser"; rec."Bonus Point Appraiser")
                {
                    ApplicationArea = all;
                }
                field("Bonus Point Mgt"; rec."Bonus Point Mgt")
                {
                    ApplicationArea = all;
                }
                field("Bonus Point Appraiser Remarks"; rec."Bonus Point Appraiser Remarks")
                {
                    ApplicationArea = all;
                }
                field("Bonus Point Mgt Remarks"; rec."Bonus Point Mgt Remarks")
                {
                    ApplicationArea = all;
                }
                field("Recommendation Appraiser"; rec."Recommendation Appraiser")
                {
                    ApplicationArea = all;
                }
                field("Recommendation 2"; rec."Recommendation 2")
                {
                    ApplicationArea = all;
                }
                field("Recommendation Mgt"; rec."Recommendation Mgt")
                {
                    ApplicationArea = all;
                }
                field("Recommendation 3"; rec."Recommendation 3")
                {
                    ApplicationArea = all;
                }
                field("Overall Appraisee Score"; rec."Overall Appraisee Score")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Overall Appraiser Score"; rec."Overall Appraiser Score")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Overal Rating Desc"; rec."Overal Rating Desc")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Overall Mgt Score"; rec."Overall Mgt Score")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
            group("MD's Recommendation & Comment")
            {
                field("MD's Recommendation"; rec."MD's Recommendation")
                {
                    MultiLine = false;
                    ApplicationArea = all;
                }
                field(Confirmation; rec.Confirmation)
                {
                    Editable = true;
                    ApplicationArea = all;
                }
                field("Contract Type"; rec."Contract Type")
                {
                    ApplicationArea = all;
                }
                field("Salary Grade"; rec."Salary Grade")
                {
                    ApplicationArea = all;
                    Caption = 'Current Salary Grade';
                }
                field(Step; rec.Step)
                {
                    ApplicationArea = all;
                    Caption = 'Current Step';
                }
                field("MD's Comment"; rec."MD's Comment")
                {
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("MD's Remark"; rec."MD's Remark")
                {
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("MD's Signature"; rec."MD's Signature")
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
                action("Close Appraisal")
                {
                    Caption = 'Close Appraisal';
                    Image = Close;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        if Confirm('Do you want to send this Appraisal Form to  your Supervisor?', false) = true then begin
                            rec.Status := rec.Status::Closed;
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
                    ApplicationArea = all;
                    PromotedCategory = Category4;
                    Visible = false;

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
                                HRAppraisalEvaluations.Insert(true);
                            until HRAppraisalEvaluationAreas.Next = 0;
                    end;
                }
            }
        }
        area(processing)
        {
            action("&Next Page")
            {
                Caption = '&Next Page';
                Image = NextSet;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category5;

                trigger OnAction()
                begin
                    //FORM.RUNMODAL(39005843
                    //PAGE.Run(39003985, Rec);
                end;
            }
            action("Print Appraisal")
            {
                ApplicationArea = All;
                Caption = 'Print Appraisal';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                Visible = false;

                trigger OnAction()
                begin
                    rec.SetRange("Appraisal No", rec."Appraisal No");
                    REPORT.Run(51534715, true, true, Rec);
                    rec.Reset;
                end;
            }
            separator(Action1000000003)
            {
            }
            action(Approvals)
            {
                Caption = 'Approvals';
                Image = Approvals;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    //DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender,WorkOrder,Job,Trip,Fuel,Diversion,HSSEQ,VehicleRelease,DriverAllowance,TruckVerification,BatteryJV,Towing,Interchange,TyreReplacement,LCAdvance,APRAF,FuelRecon,"Job Approval","Employee Requisition","Interview Evaluation","Training Requisition","Leave Application",Appraisal;
                    DocumentType: Enum "Approval Document Type";
                    ApprovalEntries: Page 658;
                    WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                begin
                    // DocumentType := DocumentType::Jobs;
                    //ApprovalEntries.Setfilters(DATABASE::"HR Jobs", DocumentType, "Job ID");
                    // WorkflowsEntriesBuffer.RunWorkflowEntriesPage(RecordId, Database::"HR Appraisal Goal Setting H", DocumentType.AsInteger(), "Appraisal No");
                    //ApprovalEntries.Run;
                end;
            }
            action("Send A&pproval Request")
            {
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
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
                    // IF ApprovalMgt.SendAppraisalApprovalRequest(Rec) THEN;

                end;
            }
            action("Cancel Approval Re&quest")
            {
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //IF ApprovalMgt.CancelAppraisalApprovalRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
            action("View Salary Information")
            {
                Caption = 'View Salary Information';
                Image = View;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                //RunObject = Page Page39005525;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if HREmp.Get(rec."Employee No") then
            rec."Job Title" := HREmp."Job Title";
        rec.CalcTotals;
    end;

    var
        HRAppraisalEvaluationAreas: Record "HR Appraisal Evaluation Areas";
        HRAppraisalEvaluations: Record "HR Appraisal Evaluations";
        // HRAppraisalEvaluationsF: Page "HR Appraisal Evaluation Lines";
        HREmp: Record "HR Employees";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition,ImprestSurrender,Interbank,Receipt,"Staff Claim","Staff Advance",AdvanceSurrender;
        CompanyScoreAppraisee: Decimal;
        KPIScoreAppraisee: Decimal;
        PFScoreAppraisee: Decimal;
        PFBase: Decimal;
        HrRatings: Record "HR Appraisal Career Dev";
        UserSetup: Record "User Setup";
        // SMTP: Codeunit "SMTP Mail";
        Approver: Record "User Setup";
        KPIScoreAppraiser: Decimal;
        KPIScoreMgt: Decimal;
        PFScoreAppraiser: Decimal;
        PFScoreMgt: Decimal;
}

