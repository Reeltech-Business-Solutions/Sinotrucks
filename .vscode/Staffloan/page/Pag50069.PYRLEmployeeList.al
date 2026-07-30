

page 50069 "PYRL Employee-List"
{
    CardPageID = "Hr Employee Card (PR)";
    Editable = false;
    PageType = List;
    SourceTable = "HR-Employee Payroll";
    SourceTableView = SORTING("No.")
                      ORDER(Ascending)
                      WHERE(Status = FILTER(Normal));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("Location/Division Code"; Rec."Location/Division Code")
                {
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                }
                field(DepName; DepName)
                {
                    ApplicationArea = All;
                    Caption = 'Department Name';
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                }
                field("Salary Notch/Step"; Rec."Salary Notch/Step")
                {
                    ApplicationArea = All;
                }
                field("Main Bank"; Rec."Main Bank")
                {
                    ApplicationArea = All;
                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    ApplicationArea = All;
                }
                field(BankName; BankName)
                {
                    ApplicationArea = All;
                    Caption = 'Bank Name';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = All;
                }
                field("Pension House"; Rec."Pension House")
                {
                    ApplicationArea = All;
                }
                field("RSA No."; Rec."RSA No.")
                {
                    ApplicationArea = All;
                    Caption = 'Pension No.';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = All;
                }
                field("Length Of Service"; Rec."Length Of Service")
                {
                    ApplicationArea = All;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = All;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = All;
                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = All;
                }
                field("Residential Address2"; Rec."Residential Address2")
                {
                    ApplicationArea = All;
                }
                field("Residential Address3"; Rec."Residential Address3")
                {
                    ApplicationArea = All;
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = All;
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = All;
                }
                field("UIF Number"; Rec."UIF Number")
                {
                    ApplicationArea = All;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = All;
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Office; Rec.Office)
                {
                    ApplicationArea = All;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = All;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = All;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                }
                field("Known As"; Rec."Known As")
                {
                    ApplicationArea = All;
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = All;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = All;
                }
                field("Union Member?"; Rec."Union Member?")
                {
                    ApplicationArea = All;
                }
                field("Shift Worker?"; Rec."Shift Worker?")
                {
                    ApplicationArea = All;
                }
                field("Contracted Hours"; Rec."Contracted Hours")
                {
                    ApplicationArea = All;
                }
                field("Pay Period"; Rec."Pay Period")
                {
                    ApplicationArea = All;
                }
                field("Cost Code"; Rec."Cost Code")
                {
                    ApplicationArea = All;
                }
                field("PAYE Number"; Rec."PAYE Number")
                {
                    ApplicationArea = All;
                }
                field("UIF Contributor?"; Rec."UIF Contributor?")
                {
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = All;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = All;
                }
                field("Driving Licence"; Rec."Driving Licence")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = All;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = All;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = All;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = All;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = All;
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = All;
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = All;
                }
                field("Time Pension Scheme"; Rec."Time Pension Scheme")
                {
                    ApplicationArea = All;
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = All;
                }
                field("Time Medical Scheme"; Rec."Time Medical Scheme")
                {
                    ApplicationArea = All;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = All;
                }
                field(Paterson; Rec.Paterson)
                {
                    ApplicationArea = All;
                }
                field(Peromnes; Rec.Peromnes)
                {
                    ApplicationArea = All;
                }
                field(Hay; Rec.Hay)
                {
                    ApplicationArea = All;
                }
                field(Castellion; Rec.Castellion)
                {
                    ApplicationArea = All;
                }
                field("Allow Overtime"; Rec."Allow Overtime")
                {
                    ApplicationArea = All;
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = All;
                }
                field("Medical Scheme Head Member"; Rec."Medical Scheme Head Member")
                {
                    ApplicationArea = All;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = All;
                }
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = All;
                }
                field("Receiving Car Allowance ?"; Rec."Receiving Car Allowance ?")
                {
                    ApplicationArea = All;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = All;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = All;
                }
                field("Cell Phone Reimbursement?"; Rec."Cell Phone Reimbursement?")
                {
                    ApplicationArea = All;
                }
                field("Amount Reimbursed"; Rec."Amount Reimbursed")
                {
                    ApplicationArea = All;
                }
                field("UIF Country"; Rec."UIF Country")
                {
                    ApplicationArea = All;
                }
                field("Direct/Indirect"; Rec."Direct/Indirect")
                {
                    ApplicationArea = All;
                }
                field("Primary Skills Category"; Rec."Primary Skills Category")
                {
                    ApplicationArea = All;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                }
                field("Termination Category"; Rec."Termination Category")
                {
                    ApplicationArea = All;
                }
                field("Job Specification"; Rec."Job Specification")
                {
                    ApplicationArea = All;
                }
                field(DateOfBirth; Rec.DateOfBirth)
                {
                    ApplicationArea = All;
                }
                field(DateEngaged; Rec.DateEngaged)
                {
                    ApplicationArea = All;
                }
                field(Citizenship; Rec.Citizenship)
                {
                    ApplicationArea = All;
                }
                field("Name Of Manager"; Rec."Name Of Manager")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ApplicationArea = All;
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = All;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = All;
                }
                field("2nd Skills Category"; Rec."2nd Skills Category")
                {
                    ApplicationArea = All;
                }
                field("3rd Skills Category"; Rec."3rd Skills Category")
                {
                    ApplicationArea = All;
                }
                field(PensionJoin; Rec.PensionJoin)
                {
                    ApplicationArea = All;
                }
                field(DateLeaving; Rec.DateLeaving)
                {
                    ApplicationArea = All;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Import Notches")
            // {
            //     Caption = 'Import Notches';
            //     RunObject = XMLport XMLport50051;
            // }
            action("Import Notch Transactions")
            {
                ApplicationArea = All;
                Caption = 'Import Notch Transactions';
                RunObject = XMLport "impt standard resp cntr";
            }
            // action("Import Payroll Variations")
            // {
            //     Caption = 'Import Payroll Variations';
            //     RunObject = XMLport XMLport39004244;
            // }
            action("Import Employee Trans")
            {
                ApplicationArea = All;
                Caption = 'Import Employee Trans';
                RunObject = XMLport "impt responsibility cntr BR HR";
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DepName := '';
        DValues.Reset;
        DValues.SetRange(DValues.Code, Rec."Department Code");
        if DValues.Find('-') then
            DepName := DValues.Name;

        BankName := '';
        Banks.Reset;
        Banks.SetRange(Banks."Bank Code", Rec."Main Bank");
        Banks.SetRange(Banks."Branch Code", Rec."Branch Bank");
        if Banks.Find('-') then
            BankName := Banks."Branch Name";
    end;

    trigger OnOpenPage()
    begin
        if (DepCode <> '') then
            Rec.SetFilter("Department Code", ' = %1', DepCode);
        if (OfficeCode <> '') then
            Rec.SetFilter(Office, ' = %1', OfficeCode);
    end;

    var
        Mail: Codeunit Mail;
        PictureExists: Boolean;
        DepCode: Code[50];
        OfficeCode: Code[50];
        DepName: Text[100];
        BankName: Text[200];
        DValues: Record "Dimension Value";
        Banks: Record "prBank Structure";


    procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
    begin
        DepCode := DepartmentCode;
        OfficeCode := "Office Code";
    end;
}

