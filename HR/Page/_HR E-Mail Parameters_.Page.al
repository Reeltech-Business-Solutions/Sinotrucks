page 54508 "HR E-Mail Parameters"
{
    PageType = Card;
    SourceTable = "HR E-Mail Parameters";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Associate With"; Rec."Associate With")
                {
                    ApplicationArea = all;
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ApplicationArea = all;
                }
                field("Sender Address"; Rec."Sender Address")
                {
                    ApplicationArea = all;
                }
                field(Recipients; rec.Recipients)
                {
                    ApplicationArea = all;
                }
                field(Subject; rec.Subject)
                {
                    ApplicationArea = all;
                }
                field(Body; rec.Body)
                {
                    MultiLine = true;
                    ApplicationArea = all;
                }
                field("Body 2"; Rec."Body 2")
                {
                    ApplicationArea = all;
                }
                field("Body 3"; Rec."Body 3")
                {
                    ApplicationArea = all;
                }
                field(HTMLFormatted; rec.HTMLFormatted)
                {
                    ApplicationArea = all;
                }
                field(Image; rec.Image)
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
