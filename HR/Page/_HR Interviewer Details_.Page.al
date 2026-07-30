page 54585 "HR Interviewer Details"
{
    PageType = ListPart;
    SourceTable = "HR Interviewer";
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            field("Interview No."; Rec."Interview No.")
            {
                ApplicationArea = all;
            }
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = all;
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = all;
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = all;
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = all;
            }
            field(Stage; rec.Stage)
            {
                ApplicationArea = all;
            }
            field("ED/MD Recommendation"; Rec."ED/MD Recommendation")
            {
                MultiLine = true;
                ApplicationArea = all;
            }
            repeater(Group)
            {
            }
        }
    }
    actions
    {
    }
    var HrEmployee: Record "HR-Employee";
}
