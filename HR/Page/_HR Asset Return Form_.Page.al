page 54539 "HR Asset Return Form"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Asset Return Form';
    RefreshOnActivate = true;
    SourceTable = "Misc. Article Information";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Misc. Article Code"; Rec."Misc. Article Code")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Returned; rec.Returned)
                {
                    ApplicationArea = all;
                }
                field("Status On Return"; Rec."Status On Return")
                {
                    ApplicationArea = all;
                }
                field("Date Returned"; Rec."Date Returned")
                {
                    ApplicationArea = all;
                }
                field(Recommendations; rec.Recommendations)
                {
                    ApplicationArea = all;
                }
                field("Received By"; Rec."Received By")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    var EI: Record "HR Employee Exit Interviews";
    [Scope('Cloud')]
    procedure refresh()
    begin
        CurrPage.Update(false);
    end;
}
