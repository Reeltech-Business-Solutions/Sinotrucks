page 54688 "HR Appraisal Objective Header"
{
    PageType = Document;
    SourceTable = "HR Appraisal Objective Header";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Level; rec.Level)
                {
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
            }
            part(Control5; "HR Appraisal Obj Template")
            {
                SubPageLink = Level=FIELD(Level);
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
