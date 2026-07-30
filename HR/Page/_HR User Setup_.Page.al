page 54670 "HR User Setup"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "User Setup";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'HR User Setup';
    SourceTableView = SORTING(HR)ORDER(Ascending)WHERE(HR=CONST(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field(HR; rec.HR)
                {
                    Editable = false;
                }
                field("PayRoll Cent. Filter"; Rec."PayRoll Cent. Filter")
                {
                    ApplicationArea = all;
                }
                field("Payroll Substitute"; Rec."Payroll Substitute")
                {
                    ApplicationArea = all;
                }
                field("Grade Classification"; Rec."Grade Classification")
                {
                    ApplicationArea = all;
                }
                field("Reopen Doc"; Rec."Reopen Doc")
                {
                    ApplicationArea = all;
                }
                field("HR Job"; Rec."HR Job")
                {
                    ApplicationArea = all;
                }
                field("Journal Template Name"; Rec."Journal Template Name")
                {
                    ApplicationArea = all;
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
