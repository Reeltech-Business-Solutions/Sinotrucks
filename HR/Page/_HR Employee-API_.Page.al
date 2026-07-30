page 54435 "HR Employee-API"
{
    //ApplicationArea = All;
    Caption = 'HR Employee-API';
    PageType = API;
    SourceTable = "HR Employees";
    APIPublisher = 'RBS';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'HREmployee';
    EntitySetName = 'HREmployee';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(FirstName; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                    ApplicationArea = All;
                }
                field(MiddleName; Rec."Middle Name")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.';
                    ApplicationArea = All;
                }
                field(LastName; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
