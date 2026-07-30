page 55009 "HR payroll line"
{
    PageType = API;
    Caption = 'PAYROLL LINE';
    APIPublisher = 'Reeltech';
    APIGroup = 'payroll';
    APIVersion = 'v1.0';
    EntityName = 'line';
    EntitySetName = 'lines';
    SourceTable = "prSalary Card";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("id"; Rec.SystemId)
                {
                    ApplicationArea = all;
                }
                field("employee_code"; Rec."Employee Code")
                {
                    ApplicationArea = all;
                }
                field("basic_pay"; Rec."Basic Pay")
                {
                    ApplicationArea = all;
                }
                field("pays_PAYE"; Rec."Pays PAYE")
                {
                    ApplicationArea = all;
                }
                field("pays_NHF"; Rec."Pays NHF")
                {
                    ApplicationArea = all;
                }
                field("Cumm_basic_pay"; Rec."Cumm BasicPay")
                {
                    ApplicationArea = all;
                }
                field("cumm_gross_pay"; Rec."Cumm GrossPay")
                {
                    ApplicationArea = all;
                }
                field("cumm_allowances"; Rec."Cumm Allowances")
                {
                    ApplicationArea = all;
                }
                field("cumm_PAYE"; Rec."Cumm PAYE")
                {
                    ApplicationArea = all;
                }
                field("cumm_deductions"; Rec."Cumm Deductions")
                {
                    ApplicationArea = all;
                }
                field("cumm_net_pay"; Rec."Cumm NetPay")
                {
                    ApplicationArea = all;
                }
                field("suspend_pay"; Rec."Suspend Pay")
                {
                    ApplicationArea = all;
                }
                field("suspension_date"; Rec."Suspension Date")
                {
                    ApplicationArea = all;
                }
                field("suspension_reasons"; Rec."Suspension Reasons")
                {
                    ApplicationArea = all;
                }
                field("suspension_end_date"; Rec."Suspension End Date")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}