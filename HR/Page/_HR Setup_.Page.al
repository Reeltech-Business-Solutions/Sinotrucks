page 54456 "HR Setup"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = false;
    SourceTable = "HR Setup";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(Appraisal)
            {   
                Caption = 'Appraisal';

                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = all;
                }
                field("Open Period"; Rec."Open Period")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            group(General)
            {
                Caption = 'General';

                field("Base Calendar"; Rec."Base Calendar")
                {
                    ApplicationArea = all;
                }
                field("Meal Amount"; Rec."Meal Amount")
                {
                    ApplicationArea = all;
                }
                field("Company's Group Email"; Rec."Company's Group Email")
                {
                    ApplicationArea = all;
                }
                field("Shared Document  Path"; Rec."Shared Document  Path")
                {
                    ApplicationArea = all;
                }
                field("Confirmation Nos"; Rec."Confirmation Nos")
                {
                    ApplicationArea = all;
                }
                field("Loan Amount %"; Rec."Loan Amount %")
                {
                    ApplicationArea = all;
                }
            }
            group(Control10)
            {
                Caption = 'General';

                field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
                {
                    ApplicationArea = all;
                }
                field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
                {
                    ApplicationArea = all;
                }
                field("Default Leave Posting Template"; Rec."Default Leave Posting Template")
                {
                    ApplicationArea = all;
                }
                field("Default Leave Posting Batch"; Rec."Default Leave Posting Batch")
                {
                    ApplicationArea = all;
                }
                field("Leave Template"; Rec."Leave Template")
                {
                    ApplicationArea = all; //fola 06032024
                }
                field("Leave Batch"; Rec."Leave Batch")
                {
                    ApplicationArea = all; //fola 06032024
                }
                field("Annual Leave Qualification"; Rec."Annual Leave Qualification")
                {
                    ApplicationArea = all;
                }
                field("Leave Allowance Days"; Rec."Leave Allowance Days")
                {
                    ApplicationArea = all;
                }
                field("Maternity Leave Period"; Rec."Maternity Leave Period")
                {
                    ApplicationArea = all;
                }
                field("Forfeit Leave After"; Rec."Forfeit Leave After")
                {
                    ApplicationArea = all;
                }
                field("Current Leave Period"; Rec."Current Leave Period")
                {
                    ApplicationArea = all;
                }
                field("Maternity Application Before"; Rec."Maternity Application Before")
                {
                    ApplicationArea = all;
                }
                field("Leave Application Before"; Rec."Leave Application Before")
                {
                    ApplicationArea = all;
                }
                field("Training Application Before"; Rec."Training Application Before")
                {
                    ApplicationArea = all;
                }
                field("HR Email"; Rec."HR Email")
                {
                    ApplicationArea = All;
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';

                field("Employee Nos."; Rec."Employee Nos.")
                {
                    ApplicationArea = all;
                }
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                    ApplicationArea = all;
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ApplicationArea = all;
                }
                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                    ApplicationArea = all;
                }
                field("Complaint Form Nos"; Rec."Complaint Form Nos")
                {
                    ApplicationArea = all;
                }
                field("Transport Req Nos"; Rec."Transport Req Nos")
                {
                    ApplicationArea = all;
                }
                field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
                {
                    ApplicationArea = all;
                }
                field("Job Application Nos"; Rec."Job Application Nos")
                {
                    ApplicationArea = all;
                }
                field("Exit Interview Nos"; Rec."Exit Interview Nos")
                {
                    ApplicationArea = all;
                }
                field("Appraisal Nos"; Rec."Appraisal Nos")
                {
                    ApplicationArea = all;
                }
                field("Company Activities"; Rec."Company Activities")
                {
                    ApplicationArea = all;
                }
                field("Job Interview Nos"; Rec."Job Interview Nos")
                {
                    ApplicationArea = all;
                }
                field("Ticket Nos"; Rec."Ticket Nos")
                {
                    ApplicationArea = all;
                }
                field("Loan Nos"; Rec."Loan Nos")
                {
                    ApplicationArea = all;
                }
                field("Career Event"; Rec."Career Event")
                {
                    ApplicationArea = all;
                }
                field("Training Need Nos"; Rec."Training Need Nos")
                {
                    ApplicationArea = all;
                }
                field("Leave Acknowledgement Nos"; Rec."Leave Acknowledgement Nos")
                {
                    ApplicationArea = all;
                }
                field("Employee ID Nos"; Rec."Employee ID Nos")
                {
                    ApplicationArea = all;
                }
                field("Transaction Nos"; Rec."Transaction Nos")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Action20)
            {
                action("Open Employee Details")
                {
                    Image = ClosePeriod;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if not Confirm('Are you sure you want open employee details for updates', false) then exit;
                        HRSetup.Get;
                        HRSetup."Open Period" := true;
                        HRSetup.Modify;
                        /*AppraisalLines.SETRANGE(AppraisalLines."Appraisal Period","Appraisal Period");
                        AppraisalLines.SETRANGE(AppraisalLines.Half,AppraisalLines.Half::" ");
                        AppraisalLines.SETRANGE(AppraisalLines."Submit to HR",FALSE);
                        IF AppraisalLines.FINDFIRST THEN BEGIN
                         REPEAT
                          AppraisalLines."Submit to HR":=TRUE;
                          AppraisalLines.MODIFY;
                         UNTIL AppraisalLines.NEXT = 0;
                        END;
                        */
                        Message('Employees have been notified');
                    end;
                }
                action("Reopen Approved Docs")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if UserSetup.Get(UserId) then
                            if UserSetup."Reopen Doc" then begin
                                AppraisalHeader.SetRange(AppraisalHeader."Appraisal Period", rec."Appraisal Period");
                                If AppraisalHeader.FindFirst then
                                    repeat
                                        AppraisalHeader.Status := AppraisalHeader.Status::Open;
                                        AppraisalHeader.Modify;
                                    Until AppraisalHeader.Next = 0;
                                Message('Appraisal Period Open for new half');
                            end
                            else
                                Error('you do not have permissons to perform this activity');
                    end;
                }
                action("Leave Period List")
                {
                    Caption = 'Leave Period List';
                    Image = List;
                    ApplicationArea = all;
                    Promoted = true;
                    RunObject = Page "HR Leave Period List";
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        rec.Reset;
        if not rec.Get then begin
            rec.Init;
            rec.Insert;
        end;
    end;

    var
        AppraisalLines: Record "HR Appraisal Goal Setting L";
        HRSetup: Record "HR Setup";
        AppraisalHeader: Record "HR Appraisal Goal Setting H";
        UserSetup: Record "User Setup";
}
