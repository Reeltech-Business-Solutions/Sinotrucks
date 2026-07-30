page 51580 "HR Emp Requisition Self"
{
    ApplicationArea = All;
    Caption = 'HR Emp Requisition Self';
    PageType = Card;
    SourceTable = "HR Employee Requisitions";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Requisition No."; Rec."Requisition No.")
                {
                    ToolTip = 'Specifies the value of the Requisition No. field.';
                    ApplicationArea = All;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ToolTip = 'Specifies the value of the Requisition Date field.';
                    ApplicationArea = All;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ToolTip = 'Specifies the value of the Job Description field.';
                    ApplicationArea = All;
                }
                field(Requestor; Rec.Requestor)
                {
                    ToolTip = 'Specifies the value of the Requestor field.';
                    ApplicationArea = All;
                }
                field("Reason For Request"; Rec."Reason For Request")
                {
                    ToolTip = 'Specifies the value of the Reason For Request field.';
                    ApplicationArea = All;
                }
                field("Required Positions"; Rec."Required Positions")
                {
                    ToolTip = 'Specifies the value of the Required Positions field.';
                    ApplicationArea = All;
                }
                field("Type of Contract Required"; Rec."Type of Contract Required")
                {
                    ToolTip = 'Specifies the value of the Type of Contract Required field.';
                    ApplicationArea = All;
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ToolTip = 'Specifies the value of the Closing Date field.';
                    ApplicationArea = All;
                }
                field(Closed; Rec.Closed)
                {
                    ToolTip = 'Specifies the value of the Closed field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
