page 54487 "HR Leave Applicaitons Factbox"
{
    PageType = CardPart;
    ApplicationArea = All;
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            label(Control1102755011)
            {
                CaptionClass = Text1;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
                ApplicationArea = All;
            }
            field("No."; Rec."No.")
            {
                ApplicationArea = all;
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = all;
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = all;
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = all;
            }
            field(Designation; rec.Designation)
            {
                ApplicationArea = all;
            }
            field(Status; rec.Status)
            {
                ApplicationArea = all;
            }
            label(Control1102755005)
            {
                ApplicationArea = all;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            label(Control1102755012)
            {
                ApplicationArea = all;
                CaptionClass = Text2;
                ShowCaption = false;
                Style = StrongAccent;
                StyleExpr = TRUE;
            }
            field("Total Leave Taken"; Rec."Total Leave Taken")
            {
                ApplicationArea = all;
            }
            field("Total (Leave Days)"; Rec."Total (Leave Days)")
            {
                ApplicationArea = all;
            }
            field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
            {
                ApplicationArea = all;
            }
            field("Allocated Leave Days"; Rec."Allocated Leave Days")
            {
                ApplicationArea = all;
            }
            field("Personal E-Mail"; Rec."Personal E-Mail")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
    var Text1: Label 'Employee Details';
    Text2: Label 'Employeee Leave Details';
//Text3: ;
}
