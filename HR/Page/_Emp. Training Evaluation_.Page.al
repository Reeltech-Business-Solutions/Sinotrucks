page 54598 "Emp. Training Evaluation"
{
    CardPageID = "Emp. Training Eval - Card";
    DeleteAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Emp. Training Evaluation';
    SourceTable = "Emp Traing Eval. Questionaire";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = all;
                }
                field("Emp Code"; Rec."Emp Code")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Traning Evaluation Type"; Rec."Traning Evaluation Type")
                {
                    ApplicationArea = all;
                }
                field("Evaluation Date"; Rec."Evaluation Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        rec.SetFilter("User ID", UserId);
    end;
}
