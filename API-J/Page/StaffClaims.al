page 50599 "staffclaim"
{
    APIGroup = 'claim';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'staffClaim';
    DelayedInsert = true;
    EntityName = 'staffClaim';
    EntitySetName = 'staffClaims';
    PageType = API;
    SourceTable = "Staff Claims Header";
    ODataKeyFields = SystemId;




    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("no"; Rec."No.")
                {


                }

                field(date; Rec.Date)
                {


                }

                field(narration; Rec.Purpose)
                {


                }


                field(employee_email; Rec."employee email")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        Employee: Record Employee;
                    begin
                        Employee.setRange("Company E-Mail", Rec."employee email");
                        if Employee.FindFirst() then
                            Rec.Validate("Account No.", Employee."No.")
                        else
                            Error('No employee found with email %1', Rec."employee email");
                    end;
                }

                field(department_code; Rec."Shortcut Dimension 7 Code")
                {


                }

                field(area_code; Rec."Shortcut Dimension 3 Code")
                {


                }
                field(job_no; Rec."job no")
                {

                }

                field(reimbursement_description; Rec.purpose)
                {




                }

                field("currency_code"; Rec."Currency Code")
                {


                }

                field(Status; Rec.Status)
                {


                }

                field(responsibility_center; Rec."Responsibility Center")
                {

                    ApplicationArea = All;
                }

                field(system_id; Rec.SystemId)
                {
                    Caption = 'SystemId';
                    ApplicationArea = All;
                }

                part(lines; "Staff Claim Line")
                {

                    EntityName = 'line';
                    EntitySetName = 'lines';
                    //   SubPageLink = "No." = field("No.");
                    SubPageLink = "Header Id" = field(SystemId);

                }





            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Status := Rec.Status::Approved;

    end;

}