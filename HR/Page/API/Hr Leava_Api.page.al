page 55000 "HR Leave-API"
{
    //ApplicationArea = All;
    Caption = 'HR Employee-API';
    PageType = API;
    SourceTable = "HR Leave Application";
    APIPublisher = 'RBS';
    APIGroup = 'app1';
    APIVersion = 'v2.0', 'v1.0';
    EntityName = 'HRLeave';
    EntitySetName = 'HRLeaves';
    DelayedInsert = true;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ApplicationCode"; Rec."Application Code")
                {
                    ToolTip = 'Specifies the value of the Application code. field.';
                    ApplicationArea = All;
                }
                field("LeaveType"; Rec."Leave Type")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                    ApplicationArea = All;
                }
                field("CompanyEmail"; Rec."Company Email")
                {
                    ToolTip = 'Specifies the value of the Middle Name field.';
                    ApplicationArea = All;
                }
                field("DaysApplied"; Rec."Days Applied")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                    ApplicationArea = All;
                }
                field("StartDate"; Rec."Start Date")
                {
                    ApplicationArea = All;

                }
                field("ReturnDate"; Rec."Return Date")
                {
                    ApplicationArea = All;

                }
                field("ApplicationDate"; Rec."Application Date")
                {
                    ApplicationArea = All;

                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;

                }
                field("ResponsibilityCenter"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;

                }
                field("LeavePeriod"; Rec."Leave Period")
                {
                    ApplicationArea = All;

                }



            }
        }
    }
}
