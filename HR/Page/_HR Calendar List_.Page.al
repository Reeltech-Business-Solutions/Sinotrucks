page 54536 "HR Calendar List"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Calendar List";
    AdditionalSearchTerms = 'HR Calendar List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = true;
                ShowCaption = false;

                field(Date; rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Day; rec.Day)
                {
                    ApplicationArea = all;
                }
                field("Non Working"; Rec."Non Working")
                {
                    ApplicationArea = all;
                }
                field(Reason; rec.Reason)
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
