page 54960 "HR Emp Exit Interview Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR Employee Exit Interviews";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Interview Done By"; Rec."Interview Done By")
                {
                    ApplicationArea = all;
                }
                field("Date Of Interview"; Rec."Date Of Interview")
                {
                    ApplicationArea = all;
                }
                field("Date of Join"; Rec."Date of Join")
                {
                    ApplicationArea = all;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Mode of Exit"; Rec."Mode of Exit")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = all;
                }
                field(Supervisor; rec.Supervisor)
                {
                    ApplicationArea = all;
                }
            }
            group("Part 1")
            {
                part(ExInterview; "HR Exit Interiew SF")
                {
                    Caption = 'Exit Interview';
                    SubPageLink = "Employee No."=FIELD("Employee No."), "Exit No."=FIELD("Exit Interview No");
                    SubPageView = WHERE(Segment=CONST("Part 1"));
                    ApplicationArea = All;
                }
                part("Comment/Answer"; "HR Exit Interview Answer")
                {
                    Caption = 'Comment/Answer';
                    Provider = ExInterview;
                    SubPageLink = "Exit No."=FIELD("Exit No."), "Entry No."=FIELD("Entry No.");
                    ApplicationArea = All;
                }
            }
            group("Part 2")
            {
                part("Exit Interview"; "HR Exit Interiew SF")
                {
                    SubPageLink = "Employee No."=FIELD("Employee No."), "Exit No."=FIELD("Exit Interview No");
                    SubPageView = WHERE(Segment=CONST("Part 2"));
                    ApplicationArea = All;
                }
                part(Control14; "HR Exit Interview Answer")
                {
                    Caption = 'Comment/Answer';
                    Provider = "Exit Interview";
                    SubPageLink = "Exit No."=FIELD("Exit No."), "Entry No."=FIELD("Entry No.");
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
