page 54503 "HR Employee Qualification Line"
{
    Caption = 'Employee Qualification Lines';
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Employee Qualification Lines';
    SourceTable = "HR Employee Qualifications";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Qualification Type"; Rec."Qualification Type")
                {
                    ApplicationArea = all;
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = all;
                }
                field("Qualification Description"; Rec."Qualification Description")
                {
                    ApplicationArea = all;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = all;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
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
            group("Q&ualification")
            {
                Caption = 'Q&ualification';

                action("Co&mments")
                {
                    ApplicationArea = All;
                    Caption = 'Co&mments';
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name"=CONST("Employee Qualification"), "No."=FIELD("Employee No."), "Table Line No."=FIELD("Line No.");
                }
                separator(Action1102755021)
                {
                }
                action("Q&ualification Overview")
                {
                    Caption = 'Q&ualification Overview';
                    RunObject = Page "Qualification Overview";
                    ApplicationArea = All;
                }
            }
        }
    }
}
