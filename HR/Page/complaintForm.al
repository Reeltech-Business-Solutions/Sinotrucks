page 50242 "Complaint Form Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = "Complaint Form";
    PromotedActionCategories = 'New,Process,Report,Functions';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Complaint No."; Rec."Complaint No.") { }

                field("Employee No."; Rec."Employee No") // Changed to define the new dropdown field
                {
                    ApplicationArea = All;
                }

                field("Employee Name"; Rec."Employee Name") { ApplicationArea = All; }
                field("Department Code"; Rec."Department Code") { ApplicationArea = All; }
                field("Company Email"; Rec."Company Email") { ApplicationArea = All; }
                field("Job Title"; Rec."Job Title") { ApplicationArea = All; }
                field("Job Description"; Rec."Job Description") { ApplicationArea = All; }
                field(Supervisor; Rec.Supervisor) { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; Editable = false; }


            }
            group("Complaint Details")
            {
                field("Nature of Complaint"; Rec."Nature of Complaint") { ApplicationArea = All; }
                field("Date of incident"; Rec."Date of incident") { ApplicationArea = All; }

                field("Details of Incident"; Rec."Details of Incident")
                {
                    Caption = 'Details of Incident';
                    MultiLine = true;
                    ApplicationArea = All;
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Marked)
            {
                Caption = 'Mark as Closed';
                ApplicationArea = All;

                trigger OnAction()
                var

                begin
                    if rec.Status = rec.Status::Open then
                        rec.Status := rec.Status::Closed;
                    if Confirm('Are you sure you want to close this document?') = true then begin
                        //  rec.Status := rec.Status::Closed;
                        Message('The document is closed and has been moved to closed complaint form');
                        CurrPage.Close();
                    end;

                end;
            }
            action(Reopen)
            {
                Caption = 'Reopen';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if rec.Status = rec.Status::Closed then
                        rec.Status := rec.Status::Open;
                    Message('The Document has been reopened');
                    CurrPage.Close();
                end;
            }
            action(Comment)
            {
                Caption = 'Comment';
                Image = Comment;
                ApplicationArea = All;
                RunObject = page ComplaintComment;
                RunPageLink = "Document No." = field("Complaint No.");
            }
        }
        area(Navigation)
        {
            action("Notification")
            {
                Caption = 'Send Notification';
                Image = SendMail;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ApplicationArea = All;


            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        HR_Employee: Record "HR Employees";
    begin
        if HR_Employee.Get(HR_Employee."No.") then
            Rec."Employee No" := HR_Employee."No.";

    end;

    trigger OnOpenPage()
    var
    begin
        if rec.Status = rec.Status::Closed then
            CurrPage.Editable := false;

        if rec.Status = rec.Status::Open then
            CurrPage.Editable := false;
    end;


    var
        myInt: Integer;

}