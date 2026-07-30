page 54839 "Employee Transaction List"
{
    CardPageID = "Employee Transaction Header";
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'Employee Transaction List';
    UsageCategory = Lists;
    SourceTable = "HR Emp. Transaction Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                }
                field(Department; rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Salary step"; Rec."Salary step")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
}
