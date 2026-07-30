page 54405 prSalaryArrears
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "prSalary Arrears";

    layout
    {
        area(content)
        {
            repeater(new)
            {
                field("Employee Code"; rec."Employee Code")
                {
                    ApplicationArea = all;
                }
                field("Transaction Code"; rec."Transaction Code")
                {
                    ApplicationArea = all;
                }
                field("Start Date"; rec."Start Date")
                {
                    ApplicationArea = all;
                }
                field("End Date"; rec."End Date")
                {
                    ApplicationArea = all;
                }
                field("Salary Arrears"; rec."Salary Arrears")
                {
                    ApplicationArea = all;
                }
                field("PAYE Arrears"; rec."PAYE Arrears")
                {
                    ApplicationArea = all;
                }
                field("Period Month"; rec."Period Month")
                {
                    ApplicationArea = all;
                }
                field("Period Year"; rec."Period Year")
                {
                    ApplicationArea = all;
                }
                field("Current Basic"; rec."Current Basic")
                {
                    ApplicationArea = all;
                }
                field("Payroll Period"; rec."Payroll Period")
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
