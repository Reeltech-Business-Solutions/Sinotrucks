page 54449 "Hr Training Request List"
{
    CardPageID = "HR Training request Card";
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Training Applications";
    SourceTableView = WHERE(Type=CONST(HR));
    AdditionalSearchTerms = 'Hr Training Request List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = all;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = all;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = all;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = all;
                }
                field("No. of Applicants"; Rec."No. of Applicants")
                {
                    ApplicationArea = all;
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
    //SETFILTER("User ID",USERID);
    end;
}
