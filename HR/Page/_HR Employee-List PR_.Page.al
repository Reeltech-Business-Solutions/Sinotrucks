page 54486 "HR Employee-List PR"
{
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Employee-List PR';
    UsageCategory = Lists;
    SourceTable = "HR Employee PR";
    SourceTableView = SORTING("No.")ORDER(Ascending)WHERE(Status=FILTER(Active));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field(Initials; rec.Initials)
                {
                    ApplicationArea = all;
                }
                field("Length Of Service"; Rec."Length Of Service")
                {
                    ApplicationArea = all;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = all;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field("Postal Address2"; Rec."Postal Address2")
                {
                    ApplicationArea = all;
                }
                field("Postal Address3"; Rec."Postal Address3")
                {
                    ApplicationArea = all;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = all;
                }
                field("Residential Address2"; Rec."Residential Address2")
                {
                    ApplicationArea = all;
                }
                field("Residential Address3"; Rec."Residential Address3")
                {
                    ApplicationArea = all;
                }
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = all;
                }
                field(City; rec.City)
                {
                    ApplicationArea = all;
                }
                field(County; rec.County)
                {
                    ApplicationArea = all;
                }
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = all;
                }
                field("UIF Number"; Rec."UIF Number")
                {
                    ApplicationArea = all;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                }
                field("Country Code"; Rec."Country Code")
                {
                    ApplicationArea = all;
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field(Office; rec.Office)
                {
                    ApplicationArea = all;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ApplicationArea = all;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = all;
                }
                field(Title; rec.Title)
                {
                    ApplicationArea = all;
                }
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = all;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = all;
                }
                field("Known As"; Rec."Known As")
                {
                    ApplicationArea = all;
                }
                field(Position; rec.Position)
                {
                    ApplicationArea = all;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = all;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = all;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = all;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                }
                field("Union Member?"; Rec."Union Member?")
                {
                    ApplicationArea = all;
                }
                field("Shift Worker?"; Rec."Shift Worker?")
                {
                    ApplicationArea = all;
                }
                field("Contracted Hours"; Rec."Contracted Hours")
                {
                    ApplicationArea = all;
                }
                field("Pay Period"; Rec."Pay Period")
                {
                    ApplicationArea = all;
                }
                field("Cost Code"; Rec."Cost Code")
                {
                    ApplicationArea = all;
                }
                field("PAYE Number"; Rec."PAYE Number")
                {
                    ApplicationArea = all;
                }
                field("UIF Contributor?"; Rec."UIF Contributor?")
                {
                    ApplicationArea = all;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = all;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = all;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = all;
                }
                field("Driving Licence"; Rec."Driving Licence")
                {
                    ApplicationArea = all;
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    ApplicationArea = all;
                }
                field(Disabled; rec.Disabled)
                {
                    ApplicationArea = all;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = all;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = all;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                }
                field(Age; rec.Age)
                {
                    ApplicationArea = all;
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = all;
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = all;
                }
                field("Time Pension Scheme"; Rec."Time Pension Scheme")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = all;
                }
                field("Time Medical Scheme"; Rec."Time Medical Scheme")
                {
                    ApplicationArea = all;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = all;
                }
                field(Paterson; rec.Paterson)
                {
                    ApplicationArea = all;
                }
                field(Peromnes; rec.Peromnes)
                {
                    ApplicationArea = all;
                }
                field(Hay; rec.Hay)
                {
                    ApplicationArea = all;
                }
                field(Castellion; rec.Castellion)
                {
                    ApplicationArea = all;
                }
                field("Allow Overtime"; Rec."Allow Overtime")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Head Member"; Rec."Medical Scheme Head Member")
                {
                    ApplicationArea = all;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = all;
                }
                field("Receiving Car Allowance ?"; Rec."Receiving Car Allowance ?")
                {
                    ApplicationArea = all;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = all;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = all;
                }
                field("Cell Phone Reimbursement?"; Rec."Cell Phone Reimbursement?")
                {
                    ApplicationArea = all;
                }
                field("Amount Reimbursed"; Rec."Amount Reimbursed")
                {
                    ApplicationArea = all;
                }
                field("UIF Country"; Rec."UIF Country")
                {
                    ApplicationArea = all;
                }
                field("Direct/Indirect"; Rec."Direct/Indirect")
                {
                    ApplicationArea = all;
                }
                field("Primary Skills Category"; Rec."Primary Skills Category")
                {
                    ApplicationArea = all;
                }
                field(Level; rec.Level)
                {
                    ApplicationArea = all;
                }
                field("Termination Category"; Rec."Termination Category")
                {
                    ApplicationArea = all;
                }
                field("Job Specification"; Rec."Job Specification")
                {
                    ApplicationArea = all;
                }
                field(DateOfBirth; rec.DateOfBirth)
                {
                    ApplicationArea = all;
                }
                field(DateEngaged; rec.DateEngaged)
                {
                    ApplicationArea = all;
                }
                field(Citizenship; rec.Citizenship)
                {
                    ApplicationArea = all;
                }
                field("Name Of Manager"; Rec."Name Of Manager")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ApplicationArea = all;
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = all;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = all;
                }
                field("2nd Skills Category"; Rec."2nd Skills Category")
                {
                    ApplicationArea = all;
                }
                field("3rd Skills Category"; Rec."3rd Skills Category")
                {
                    ApplicationArea = all;
                }
                field(PensionJoin; rec.PensionJoin)
                {
                    ApplicationArea = all;
                }
                field(DateLeaving; rec.DateLeaving)
                {
                    ApplicationArea = all;
                }
                field(Region; rec.Region)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
    /*
        IF (DepCode <> '') THEN
           SETFILTER("Department Code", ' = %1', DepCode);
        IF (OfficeCode <> '') THEN
           SETFILTER(Office, ' = %1', OfficeCode);
             */
    end;
    var Mail: Codeunit Mail;
    PictureExists: Boolean;
    DepCode: Code[10];
    OfficeCode: Code[10];
    [Scope('Cloud')]
    procedure SetNewFilter(var DepartmentCode: Code[10]; var "Office Code": Code[10])
    begin
        DepCode:=DepartmentCode;
        OfficeCode:="Office Code";
    end;
}
