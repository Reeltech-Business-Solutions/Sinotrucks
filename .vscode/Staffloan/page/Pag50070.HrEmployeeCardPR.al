page 50070 "Hr Employee Card (PR)"
{
    Caption = 'Employee Card';
    DelayedInsert = false;
    PageType = Card;
    RefreshOnActivate = true;
    SaveValues = true;
    SourceTable = "HR-Employee Payroll";

    layout
    {
        area(content)
        {
            group(Control206)
            {
                Editable = false;
                ShowCaption = false;
                Visible = false;
                field("gOpt Active"; "gOpt Active")
                {
                    ApplicationArea = All;
                    OptionCaption = 'Show Active Employees,Show Archived Employees,Show All Employees';

                    trigger OnValidate()
                    begin
                        if "gOpt Active" = "gOpt Active"::All then
                            AllgOptActiveOnValidate;
                        if "gOpt Active" = "gOpt Active"::Archive then
                            ArchivegOptActiveOnValidate;
                        if "gOpt Active" = "gOpt Active"::Active then
                            ActivegOptActiveOnValidate;
                    end;
                }
                field("Employee Act. Qty"; Rec."Employee Act. Qty")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee Arc. Qty"; Rec."Employee Arc. Qty")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee Qty"; Rec."Employee Qty")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("General Information")
            {
                Caption = 'General Information';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    Editable = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                }
                field("Known As"; Rec."Known As")
                {
                    ApplicationArea = All;
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = All;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = All;
                    Caption = 'Passport No.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
                field(Citizenship; Rec.Citizenship)
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
                field("Post Code2"; Rec."Post Code2")
                {
                    ApplicationArea = All;
                    Caption = 'Post Code';
                    // LookupPageID = "Post Codes";
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
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Status Change Date"; Rec."Status Change Date")
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
                field("NHF No."; Rec."NHF No.")
                {
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = All;
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = All;
                }
                field(Tribe; Rec.Tribe)
                {
                    ApplicationArea = All;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = All;
                    LookupPageID = Languages;
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = All;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = All;
                    LookupPageID = Languages;
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = All;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = All;
                    LookupPageID = Languages;
                }
                field("Driving Licence"; Rec."Driving Licence")
                {
                    ApplicationArea = All;
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = All;
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = All;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if Rec.Disabled = Rec.Disabled::No then begin
                            "Disabling DetailsEditable" := false;
                            "Disability GradeEditable" := false;
                        end
                        else
                            "Disabling DetailsEditable" := true;
                        "Disability GradeEditable" := true;
                    end;
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ApplicationArea = All;
                    Editable = "Disabling DetailsEditable";
                }
                field("Disability Grade"; Rec."Disability Grade")
                {
                    ApplicationArea = All;
                    Editable = "Disability GradeEditable";
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = All;
                    Caption = 'Health Assessment?';
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = All;
                    Visible = false;
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
                field("Medical Scheme Name #2"; Rec."Medical Scheme Name #2")
                {
                    ApplicationArea = All;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = All;
                    Caption = 'Health Assessment Date';
                }
                group("  R      W     S")
                {

                    Caption = '  R      W     S';
                    field("First Language Read"; Rec."First Language Read")
                    {
                        ApplicationArea = All;
                    }
                    field("Second Language Read"; Rec."Second Language Read")
                    {
                        ApplicationArea = All;
                    }
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = All;
                }
                field(DAge; DAge)
                {
                    ApplicationArea = All;
                    Caption = 'Age';
                    Editable = false;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = All;
                    Caption = 'Date Of Joining The Company';
                }
                field(DService; DService)
                {
                    ApplicationArea = All;
                    Caption = 'Length of Service';
                    Editable = false;
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = All;
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = All;
                    Caption = 'Pension Scheme Join Date';
                }
                field(DPension; DPension)
                {
                    ApplicationArea = All;
                    Caption = 'Time On Pension Scheme';
                    Editable = false;
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = All;
                    Caption = 'Medical Aid Scheme Join Date';
                }
                field(DMedical; DMedical)
                {
                    ApplicationArea = All;
                    Caption = 'Time On Medical Aid Scheme';
                    Editable = false;
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = All;
                }
            }
            group("Contact Numbers")
            {
                Caption = 'Contact Numbers';
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = All;
                }
                field("Fax Number"; Rec."Fax Number")
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
                field("Post Office No"; Rec."Post Office No")
                {
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    ApplicationArea = All;
                }
            }
            group("Job Information")
            {
                Caption = 'Job Information';
                field(Position; Rec.Position)
                {
                    ApplicationArea = All;
                    Caption = 'Job Position';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = All;
                }
                field("Name Of Manager"; Rec."Name Of Manager")
                {
                    ApplicationArea = All;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        "Form HR Employee": Page "PYRL Employee-List";
                        "Rec HR Employee": Record "HR-Employee Payroll";
                    begin
                        "Form HR Employee".LookupMode(true);
                        if ("Form HR Employee".RunModal = ACTION::LookupOK) then
                            "Form HR Employee".GetRecord("Rec HR Employee");

                        Rec."Name Of Manager" := "Rec HR Employee"."Known As" + ' ' + "Rec HR Employee"."Last Name";
                        Rec."Manager Emp No" := "Rec HR Employee"."No.";
                    end;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if xRec."Salary Grade" <> Rec."Salary Grade" then
                            Rec."Salary Notch/Step" := '';
                    end;
                }
                field("Salary Notch/Step"; Rec."Salary Notch/Step")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        if not Confirm('Changing the Grade will affect the Basic Salary and the salary notch\step transactions. ' +
                                        'Do you wish to continue?', false) then begin
                            Rec."Salary Notch/Step" := '';
                            Error('You have opted to abort the process.');

                        end;
                    end;
                }
                field("2nd Skills Category"; Rec."2nd Skills Category")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("3rd Skills Category"; Rec."3rd Skills Category")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Primary Skills Category"; Rec."Primary Skills Category")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            group("Contract Information")
            {
                Caption = 'Contract Information';
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
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = All;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("Location/Division Code"; Rec."Location/Division Code")
                {
                    Caption = 'Location/Division';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        LocationName := '';

                        DimValue.Reset;
                        DimValue.SetRange(DimValue.Code, Rec."Location/Division Code");
                        if DimValue.Find('-') then
                            LocationName := DimValue.Name;
                    end;
                }
                field(LocationName; LocationName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    Caption = 'Department';
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        DepartmeName := '';

                        DimValue.Reset;
                        DimValue.SetRange(DimValue.Code, Rec."Department Code");
                        if DimValue.Find('-') then
                            DepartmeName := DimValue.Name;
                    end;
                }
                // field(DepartmeName; DepartmeName)
                // {
                //     Editable = false;
                // }
                field("Cost Center Code"; Rec."Cost Center Code")
                {
                    ApplicationArea = All;
                    Caption = 'Cost Center';

                    trigger OnValidate()
                    begin
                        CostCentreName := '';

                        DimValue.Reset;
                        DimValue.SetRange(DimValue.Code, Rec."Cost Center Code");
                        if DimValue.Find('-') then
                            CostCentreName := DimValue.Name;
                    end;
                }
                field(CostCentreName; CostCentreName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Co-Operative No"; Rec."Co-Operative No")
                {
                    ApplicationArea = All;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = All;
                }
                field("Main Bank"; Rec."Main Bank")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        BankName := '';

                        BankStruc.Reset;
                        BankStruc.SetRange(BankStruc."Bank Code", Rec."Main Bank");
                        BankStruc.SetRange(BankStruc."Branch Code", Rec."Branch Bank");
                        if BankStruc.Find('-') then begin
                            BankName := BankStruc."Bank Name";

                        end;
                    end;
                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        BranchName := '';

                        BankStruc.Reset;
                        BankStruc.SetRange(BankStruc."Bank Code", Rec."Main Bank");
                        BankStruc.SetRange(BankStruc."Branch Code", Rec."Branch Bank");
                        if BankStruc.Find('-') then begin
                            BranchName := BankStruc."Branch Name";

                        end;
                    end;
                }
                field(BankName; BankName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(BranchName; BranchName)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'HR Posting Group';
                }
                field("Payroll Posting Group"; Rec."Payroll Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Payroll Code"; Rec."Payroll Code")
                {
                    ApplicationArea = All;
                }
            }
            group(Separation)
            {

                Caption = 'Separation';
                field("Contract Status"; Rec."Contract Type")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = All;
                }
                field(Notice; Rec."Notice Period")
                {
                    ApplicationArea = All;
                }
                field("Send Alert"; Rec."Send Alert to")
                {
                    ApplicationArea = All;
                }
                field("Served Notice Period"; Rec."Served Notice Period")
                {
                    ApplicationArea = All;
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = All;
                    Caption = 'Date Of Leaving The Company';
                }
                field("Termination Category"; Rec."Termination Category")
                {
                    ApplicationArea = All;
                    Caption = 'Exit Category';

                    trigger OnValidate()
                    begin
                        if Rec."Termination Category" <> Rec."Termination Category"::" " then
                            Rec.Status := Rec.Status::Disabled;
                    end;
                }
                field("Grounds for Term. Code"; Rec."Grounds for Term. Code")
                {
                    ApplicationArea = All;
                    Caption = 'Grounds for Exit';
                }
                field(Hr_Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = All;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = All;
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
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
            action("Update Basic Info")
            {
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    PrsalCard: Record "prSalary Card";
                begin
                    //PProperty.RESET;
                    //PProperty.SETRANGE(PProperty."No.",Property);
                    // IF PProperty.FIND('-') THEN BEGIN
                    // "Property Name":=PProperty.Description;
                    // END;

                    PrsalCard.Reset;
                    PrsalCard.SetRange(PrsalCard."Employee Code", Rec."No.");
                    if PrsalCard.Find('-') then
                        Rec."Date Of Birth" := PrsalCard."Date Of Birth";
                    //  PrsalCard.MODIFY;
                    Message('Basic information for this employee has already been updated');


                    /*RESET;
                    SETRANGE("No.",PrsalCard."Employee Code");
                    IF FINDFIRST  THEN BEGIN
                    PrsalCard.INIT;
                    PrsalCard."Employee Code":="No.";
                    PrsalCard."Date Of Birth":="Date Of Birth";
                    PrsalCard.INSERT;
                    END;
                    //ELSE ERROR('Basic information for this employee has already been updated');
                     */

                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';

        LocationName := '';
        DepartmeName := '';
        CostCentreName := '';
        BankName := '';
        BranchName := '';

        BankStruc.Reset;
        BankStruc.SetRange(BankStruc."Bank Code", Rec."Main Bank");
        BankStruc.SetRange(BankStruc."Branch Code", Rec."Branch Bank");
        if BankStruc.Find('-') then begin
            BankName := BankStruc."Bank Name";
            BranchName := BankStruc."Branch Name";

        end;


        DimValue.Reset;
        DimValue.SetRange(DimValue.Code, Rec."Location/Division Code");
        if DimValue.Find('-') then
            LocationName := DimValue.Name;

        DimValue.Reset;
        DimValue.SetRange(DimValue.Code, Rec."Department Code");
        if DimValue.Find('-') then
            DepartmeName := DimValue.Name;

        DimValue.Reset;
        DimValue.SetRange(DimValue.Code, Rec."Cost Center Code");
        if DimValue.Find('-') then
            CostCentreName := DimValue.Name;




        //Recalculate Important Dates
        if (Rec."Date Of Leaving" = 0D) then begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Today);
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Today);
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Today);
            //MODIFY;
        end else begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Rec."Date Of Leaving");
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Rec."Date Of Leaving");
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Rec."Date Of Leaving");
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Rec."Date Of Leaving");
            // MODIFY;
        end;
    end;

    trigger OnInit()
    begin
        "Disability GradeEditable" := true;
        "Disabling DetailsEditable" := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        //RESET;
        "gOpt Active" := "gOpt Active"::All;
        //MESSAGE('All employee information must be completed.')
    end;

    trigger OnOpenPage()
    begin


        "gOpt Active" := "gOpt Active"::Active;
        Rec.SetCurrentKey("Termination Category");
        // Rec."Filter Employees"(0);
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';

        //Recalculate Important Dates
        if (Rec."Date Of Leaving" = 0D) then begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Today);
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Today);
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Today);
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Today);
            //MODIFY;
        end else begin
            if (Rec."Date Of Birth" <> 0D) then
                DAge := Dates.DetermineAge(Rec."Date Of Birth", Rec."Date Of Leaving");
            if (Rec."Date Of Join" <> 0D) then
                DService := Dates.DetermineAge(Rec."Date Of Join", Rec."Date Of Leaving");
            if (Rec."Pension Scheme Join" <> 0D) then
                DPension := Dates.DetermineAge(Rec."Pension Scheme Join", Rec."Date Of Leaving");
            if (Rec."Medical Scheme Join" <> 0D) then
                DMedical := Dates.DetermineAge(Rec."Medical Scheme Join", Rec."Date Of Leaving");
            //MODIFY;
        end;
        //VALIDATE("Contract End Date");
    end;

    var
        Mail: Codeunit Mail;
        PictureExists: Boolean;
        "gOpt Active": Option Active,Archive,All;
        D: Date;
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        currentmonth: Date;
        Dates: Codeunit "HR Dates No Permission Restric";
        LocationName: Text[200];
        DepartmeName: Text[100];
        CostCentreName: Text[100];
        DimValue: Record "Dimension Value";
        BankName: Text[200];
        BranchName: Text[200];
        BankStruc: Record "prBank Structure";

        "Disabling DetailsEditable": Boolean;

        "Disability GradeEditable": Boolean;
        // PrsalCard: Record "HR Employees(APPR/HR)";
        PrsalCard: Record "HR Employees";


    procedure "Filter Employees"(Type: Option Active,Archive,All)
    begin


        if Type = Type::Active then begin
            Rec.Reset;
            Rec.SetFilter("Termination Category", '=%1', Rec."Termination Category"::" ");
        end
        else
            if Type = Type::Archive then begin
                Rec.Reset;
                Rec.SetFilter("Termination Category", '>%1', Rec."Termination Category"::" ");
            end
            else
                if Type = Type::All then
                    Rec.Reset;

        CurrPage.Update(false);
        Rec.FilterGroup(20);
    end;

    local procedure ActivegOptActiveOnPush()
    begin
        "Filter Employees"(0); //Active Employees
    end;

    local procedure ArchivegOptActiveOnPush()
    begin
        "Filter Employees"(1); //Archived Employees
    end;

    local procedure AllgOptActiveOnPush()
    begin
        "Filter Employees"(2); //  Show All Employees
    end;

    local procedure ActivegOptActiveOnValidate()
    begin
        ActivegOptActiveOnPush;
    end;

    local procedure ArchivegOptActiveOnValidate()
    begin
        ArchivegOptActiveOnPush;
    end;

    local procedure AllgOptActiveOnValidate()
    begin
        AllgOptActiveOnPush;
    end;
}

