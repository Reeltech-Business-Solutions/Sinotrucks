page 54475 "HR Leave Batches"
{
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "HR Leave Journal Batch";
    AdditionalSearchTerms = 'HR Leave Batches';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field(Name; rec.Name)
                {
                    ApplicationArea = all;

                    trigger OnDrillDown()
                    var
                        LVJournalLin: Record "HR Journal Line";
                        JounLin: Page "HR Leave Journal Lines";
                    begin
                        Clear(JounLin);
                        LVJournalLin.reset;
                        LVJournalLin.SetFilter("Journal Batch Name", '%1', 'LEAVE');
                        JounLin.SetTableView(LVJournalLin);
                        JounLin.Run();
                    end;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
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
