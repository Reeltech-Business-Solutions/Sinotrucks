page 54476 "HR Policies"
{
    PageType = Document;
    SourceTable = "HR Policies";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Date; rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field("Rules & Regulations"; Rec."Rules & Regulations")
                {
                    ApplicationArea = all;
                }
                field(Remarks; rec.Remarks)
                {
                    ApplicationArea = all;
                }
            }
            part(Control1102755007; "HR Company Attachments")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
