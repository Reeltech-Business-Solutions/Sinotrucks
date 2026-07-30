page 50610 "Approved staff advance"
{
    PageType = API;
    Caption = 'approved staff advance';
    APIPublisher = 'Reeltech';
    APIGroup = 'AppStaffAdv';
    APIVersion = 'v1.0';
    EntityName = 'approvedStaffAdvance';
    EntitySetName = 'approvedStaffAdvances';
    SourceTable = "Staff Advance Header";
    DelayedInsert = true;
    SourceTableView = where(status = const(Approved));


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = All;
                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                    ApplicationArea = All;
                }
                field(department_code; Rec."shortcut Dimension 7 Code")
                {

                    ApplicationArea = All;
                }
                field(department_name; Rec."Function Name")
                {

                    ApplicationArea = All;
                }
                // field(employee_no; Rec."Account No.")
                // {

                //     ApplicationArea = All;
                // }
                field(payee; Rec.Payee)
                {
                    Caption = 'Payee';
                    ApplicationArea = All;
                }
                field(area_code; Rec."Shortcut Dimension 3 Code")
                {

                    ApplicationArea = All;
                }
                field(budget_Center_name; Rec."Budget Center Name")
                {
                    Caption = 'Budget Center Name';
                    ApplicationArea = All;
                }
                field(currency_code; Rec."Currency Code")
                {
                    Caption = 'Currency Code';
                    ApplicationArea = All;
                }
                field(pay_mode; Rec."Pay Mode")
                {
                    Caption = 'Pay Mode';
                    ApplicationArea = All;
                }
                field(paying_bank_account; Rec."Paying Bank Account")
                {
                    Caption = 'Paying Bank Account';
                    ApplicationArea = All;
                }
                field(company_email; Rec."employee email")
                {
                    // /Caption = 'Paying Bank Account';
                    ApplicationArea = All;
                }
                field(bank_name; Rec."Bank Name")
                {
                    Caption = 'Bank Name';
                    ApplicationArea = All;
                }
                field(purpose; Rec.Purpose)
                {
                    Caption = 'Purpose';
                    ApplicationArea = All;
                }
                field(cashier; Rec.Cashier)
                {
                    Caption = 'Cashier';
                    ApplicationArea = All;
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    ApplicationArea = All;
                }
                field(totalNetAmount; Rec."Total Net Amount")
                {
                    Caption = 'Total Net Amount';
                    ApplicationArea = All;
                }

                field(chequeNo; Rec."Cheque No.")
                {
                    Caption = 'Cheque No.';
                    ApplicationArea = All;
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }

            }
        }
    }
}