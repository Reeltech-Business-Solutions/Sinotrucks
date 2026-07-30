page 54413 "HR Job Employment History"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Jv Lines Attachments";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Link"; rec."Document Link")
                {
                    ApplicationArea = all;
                }
                /*apo
                field(MaintainAttachment; MaintainAttachment)
                { 
                    ApplicationArea = all; 
                }
                field("End Date"; Rec."End Date")
                { 
                    ApplicationArea = all; 
                }
                */
                field("Language Code (Default)"; rec."Language Code (Default)")
                {
                    ApplicationArea = all;
                }
                field(Attachment; rec.Attachment)
                {
                    ApplicationArea = all;
                }
                /*
                    field(ExportAttachment; ExportAttachment)
                    { 
                        ApplicationArea = all; 
                    }
                    field(ImportAttachment; ImportAttachment)
                    { 
                        ApplicationArea = all; 
                    }
                    */
            }
        }
    }
    actions
    {
    }
}
