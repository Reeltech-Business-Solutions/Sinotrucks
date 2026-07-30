page 54950 "Emp. Training Evaluation Self"
{
    CardPageID = "Emp. Training Eval - Card";
    DeleteAllowed = false;
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "Emp Traing Eval. Questionaire";
    AdditionalSearchTerms = 'Emp. Training Evaluation Self';

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
        rec.FilterGroup(2);
        rec.SetFilter("User ID", UserId);
        rec.FilterGroup(0);
    end;
}
