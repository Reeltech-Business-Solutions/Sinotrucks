page 50589 "staffloan"
{
    APIGroup = 'staffloan';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'staffloan';
    DelayedInsert = true;
    EntityName = 'staffloan';
    EntitySetName = 'staffloans';
    PageType = API;
    SourceTable = "customer";
    ODataKeyFields = SystemId;
    SourceTableView = where("Account Type" = const("Staff Loan"));



    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("no"; Rec."No.")
                {


                }

                field("account_type"; Rec."Account Type")
                {


                }

                field("email"; Rec."E-Mail")
                {


                }

                field("credit_limit"; Rec."Credit Limit (LCY)")
                {


                }

                field("department"; Rec."Responsibility Center")
                {


                }
                field(address; Rec.Address)
                {


                }

                field("phone_no"; Rec."Phone No.")
                {


                }
                // field(date; Rec.Date)
                // {


                // }


                // field(employee_email; Rec."employee email")
                // {
                //     ApplicationArea = All;

                //     trigger OnValidate()
                //     var
                //         Employee: Record Employee;
                //     begin
                //         Employee.setRange("Company E-Mail", Rec."employee email");
                //         if Employee.FindFirst() then
                //             Rec.Validate("Account No.", Employee."No.")
                //         else
                //             Error('No employee found with email %1', Rec."employee email");
                //     end;
                // }

                // field(department_code; Rec."Global Dimension 1 Code")
                // {


                // }

                // field(area_code; Rec."Shortcut Dimension 2 Code")
                // {


                // }

                // field(reimbursement_description; Rec.purpose)
                // {




                // }

                // field("currency_code"; Rec."Currency Code")
                // {


                // }

                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }






            }
        }
    }


}