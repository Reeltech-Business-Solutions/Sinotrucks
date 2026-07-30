page 55002 "HR Payroll"
{
    PageType = API;
    Caption = 'PAYROLL EMPLOYEE API';
    APIPublisher = 'Reeltech';
    APIGroup = 'payroll';
    APIVersion = 'v1.0';
    EntityName = 'payroll';
    EntitySetName = 'payrolls';
    SourceTable = "HR-Employee";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(no; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("first_name"; Rec."First Name")
                {
                    ApplicationArea = All;

                }
                field("last_name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("middle_name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                }
                field("d_o_b"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field("product_code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                }
                field("status"; Rec."Status")
                {
                    ApplicationArea = All;
                }
                field("salary_grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                }
                field("salary_notch"; Rec."Salary Notch/Step")
                {
                    ApplicationArea = All;
                }
                field("date_of_join"; Rec."Date Of Join")
                {
                    ApplicationArea = All;
                }
                field("full_part_time"; Rec."Full / Part Time")
                {
                    ApplicationArea = All;
                }
                field("posting_group"; Rec."Posting Group")
                {
                    ApplicationArea = All;
                }
            }
            part("lines"; "HR payroll line")
            {
                SubPageLink = "Employee Code" = field("No.");
                ApplicationArea = All;
                Caption = 'PartName';
                EntityName = 'line';
                EntitySetName = 'lines';
                // Multiplicity = ZeroOrOne;
            }
        }
    }
}