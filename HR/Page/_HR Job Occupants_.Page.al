page 54458 "HR Job Occupants"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report';
    SourceTable = "HR Jobs";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Job Details")
            {
                Caption = 'Job Details';
                Editable = false;

                field("Job ID"; Rec."Job ID")
                {
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Job Title"; Rec."Job Title")
                {
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                }
            }
            part("Job Occupants"; "HR Employee List")
            {
                Caption = 'Job Occupants';
                Editable = false;
                SubPageLink = "Job Title"=FIELD("Job ID");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Control1102755005; "HR Job Applications Factbox")
            {
                SubPageLink = "Application No"=FIELD("Job ID");
                ApplicationArea = All;
            }
            systempart(Control1102755003; Outlook)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Print HR Job Occupants")
            {
                Image = "Report";
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "PAYE Remittance";
            }
        }
    }
    trigger OnOpenPage()
    begin
        if rec.IsEmpty then Error('No jobs have been setup');
    end;
    var Text19006026: Label 'Job Occupants';
}
