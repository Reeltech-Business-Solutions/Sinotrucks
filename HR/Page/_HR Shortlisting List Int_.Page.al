page 54665 "HR Shortlisting List Int"
{
    CardPageID = "HR Shortlisting Card INT";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Employee Requisitions";
    SourceTableView = WHERE(Closed=CONST(false));
    AdditionalSearchTerms = 'HR Shortlisting List Int';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No."; Rec."Requisition No.")
                {
                    ApplicationArea = all;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = all;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = all;
                }
                field(Requestor; rec.Requestor)
                {
                    ApplicationArea = all;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ApplicationArea = all;
                }
                field(Closed; rec.Closed)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755006; "HR Jobs Factbox")
            {
                SubPageLink = "Job ID"=FIELD("Job ID");
                ApplicationArea = All;
            }
            systempart(Control1102755005; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Shortlisting)
            {
                Caption = 'Shortlisting';
            }
        }
    }
}
