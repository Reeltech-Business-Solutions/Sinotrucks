page 54541 "HR Employee Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "HR Employees";
    ApplicationArea = All;
    RefreshOnActivate = true;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group("General Details")
            {
                Caption = 'General Details';

                field("No."; Rec."No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;


                }
                field("First Name"; Rec."First Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ShowMandatory = True;
                    Editable = isOpen;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("ID Number"; Rec."ID Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    ShowMandatory = True;
                    Visible = false;

                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec) then CurrPage.Update;
                    end;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field(Citizenship; rec.Citizenship)
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Citizenship Text"; Rec."Citizenship Text")
                {
                    Caption = 'Country / Region Code';
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                    Editable = isOpen;
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    Caption = 'Branch Code';
                    ApplicationArea = all;

                    Visible = false;
                }
                field("Shortcut Dimension 7 Code"; Rec."Shorcut Dimension 7")
                {
                    ApplicationArea = All;
                    Editable = isOpen;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Caption = '<Global Dimension 2 Code>';
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Title; rec.Title)
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }

                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }


                field(City; rec.City)
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field(County; rec.County)
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field(Picture; rec.Picture)
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Type field.';
                    Editable = isOpen;
                }
                field("User ID"; Rec."User ID")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        SupervisorNames := GetSupervisor(rec."User ID");
                    end;
                }
                field(Supervisor; rec.Supervisor)
                {
                    ApplicationArea = all;
                }
                field("Supervisor/Manager"; Rec."Supervisor/Manager")
                {
                    Caption = 'Manager ID';
                    ApplicationArea = all;
                    Editable = isOpen;
                    trigger OnValidate()
                    var
                        Emp: Record "HR Employees";
                    begin
                        Emp.SetRange(Emp."No.", rec."Supervisor/Manager");
                        if Emp.FindFirst then begin
                            rec.SupervisorName := Emp."Last Name" + ' ' + Emp."First Name" + ' ' + Emp."Middle Name";
                            rec."Supervisor's Job Title" := Emp."Job Title";
                        end;

                    end;
                }
                field(SupervisorNames; rec.SupervisorName)
                {
                    Caption = 'Manager Name';
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Supervisor's Job Title"; Rec."Supervisor's Job Title")
                {
                    ApplicationArea = all;
                    Caption = 'Manager s Job Title';
                    Editable = isOpen;
                }

                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }

                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }

                field("Second Line Supervisor ID"; Rec."Second Line Supervisor ID")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Status; rec.Status)
                {
                    Importance = Promoted;
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Reason For Inactive"; Rec."Reason For Inactive")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason For Inactive field.';
                    Editable = isOpen;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    Editable = false;
                    ApplicationArea = all;
                }

                field(Available; rec.Available)
                {
                    ApplicationArea = all;
                }
                field("Date of Last Promotion"; Rec."Alt. Address Start Date")
                {
                    Caption = 'Date of Last Promotion';
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
            group("Communication Details")
            {
                Caption = 'Communication Details';

                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ExtendedDatatype = PhoneNo;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Ext."; Rec."Ext.")
                {
                    ExtendedDatatype = PhoneNo;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    ExtendedDatatype = EMail;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';

                field(Gender; rec.Gender)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field(Religion; rec.Religion)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    ApplicationArea = all;
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    ApplicationArea = all;
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    ApplicationArea = all;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    ApplicationArea = all;
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    ApplicationArea = all;
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    ApplicationArea = all;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Has Driving Licence"; Rec."Has Driving Licence")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field(Disabled; rec.Disabled)
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Disability Details"; Rec."Disability Details")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Medical Scheme Plan"; Rec."Medical Scheme Plan")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Medical Sch. Hospital Code"; Rec."Medical Sch. Hospital Code")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Medical Scheme Hospital"; Rec."Medical Scheme Hospital")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("-"; Rec."-")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
            }
            group("Bank Details")
            {
                Caption = 'Bank Details';

                field("Main Bank"; Rec."Main Bank")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';

                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        if rec."Date Of Birth" >= Today then begin
                            Error('Invalid Entry');
                        end;
                        DAge := Dates.DetermineAge(rec."Date Of Birth", Today);
                    end;
                }
                field(DAge; DAge)
                {
                    ApplicationArea = all;
                    Caption = 'Age';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        DService := Dates.DetermineAge(rec."Date Of Joining the Company", Today);
                    end;
                }
                field(DService; DService)
                {
                    ApplicationArea = all;
                    Caption = 'Length of Service';
                    Editable = false;
                    Enabled = false;
                }
                field("Probation Date 3mnths"; Rec."Probation Date 3mnths")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Probation Form Filled"; Rec."Probation Form Filled")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Confirmation Form Filled"; Rec."Confirmation Form Filled")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("End of Probation Date"; Rec."End of Probation Date")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Pension Scheme Join Date"; Rec."Pension Scheme Join Date")
                {
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        DPension := Dates.DetermineAge(rec."Pension Scheme Join Date", Today);
                    end;
                }
                field(DPension; DPension)
                {
                    Enabled = false;
                    ApplicationArea = All;
                    Editable = isOpen;
                }
                field("Medical Scheme Join Date"; Rec."Medical Scheme Join Date")
                {
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        DMedical := Dates.DetermineAge(rec."Medical Scheme Join Date", Today);
                    end;
                }
                field(DMedical; DMedical)
                {
                    ApplicationArea = all;
                    Caption = 'Time On Medical Aid Scheme';
                    Editable = false;
                    Enabled = false;
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';

                field("Job Title"; Rec."Job Title")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Grade; rec.Grade)
                {
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Job Level"; Rec."Job Level")
                {
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Resource Type"; Rec."Resource Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Salary Step"; Rec."Salary Step")
                {
                    ApplicationArea = all;
                    Editable = isOpen;

                    trigger OnValidate()
                    begin
                        if not Confirm('Changing the Grade will affect the Basic Salary and the salary notch\step transactions. ' + 'Do you wish to continue?', false) then begin
                            rec."Salary Step" := '';
                            Error('You have opted to abort the process.');
                        end;
                    end;
                }
                field("Employee Classification"; Rec."Employee Classification")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Payroll Filter Group"; Rec."Payroll Filter Group")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
            group("Terms of Service")
            {
                Caption = 'Terms of Service';

                field("Employment Type"; Rec."Employment Type")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    Importance = Promoted;
                    Visible = true;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';

                field("PIN Number"; Rec."PIN Number")
                {
                    Caption = 'PEN Number';
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Pension Fund Administrator"; Rec."Pension Fund Administrator")
                {
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Visible = false;
                }
                field("TAX ID No"; Rec."Social Security No.")
                {
                    ApplicationArea = all;
                    Visible = false;

                }
            }
            group("Separation Details")
            {
                Caption = 'Separation Details';

                field("Date Of Leaving the Company"; Rec."Date Of Leaving the Company")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Termination Grounds"; Rec."Termination Grounds")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';

                field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                    Editable = isOpen;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(54578),
                              "No." = FIELD("No.");
            }
            part(Control24; "Log Sheet")
            {
                ApplicationArea = all;
                SubPageLink = "Table Name" = CONST(Employee), "No." = FIELD("No.");
            }
            part("HR Employees Factbox"; "HR Employees Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "No." = FIELD("No.");
            }
            systempart(Outlook; Outlook)
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Print")
            {
                Caption = '&Print';
                action("Create Employee")
                {
                    Caption = 'Create Employee';
                    Image = Create;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;
                    trigger OnAction()
                    var
                        Employees: Record Employee;
                    begin
                        // 1. Prevent duplicates
                        if Employees.Get(Rec."No.") then
                            Error('Employee %1 already exists.', Rec."No.");

                        // 2. Initialize new employee
                        Employees.Init();
                        Employees.Validate("No.", Rec."No.");
                        Employees.Validate("Company E-Mail", Rec."Company E-Mail");
                        Employees.Insert(true);
                        Employees.Validate("First Name", Rec."First Name");
                        Employees.Validate("Last Name", Rec."Last Name");


                        Employees.Validate(Gender, Rec.Gender);


                        // Dimensions
                        Employees.Validate("Global Dimension 1 Code", Rec."Global Dimension 1");
                        Employees.Validate("Global Dimension 2 Code", Rec."Global Dimension 2");


                        // Posting group (must already exist in Employee Posting Groups)
                        Employees.Validate("Employee Posting Group", 'WORKADVANCE');

                        // Bank Account No.
                        Employees.Validate("Bank Account No.", Rec."Bank Account Number");
                        Employees.modify(true);
                        // 3. Insert


                        Message('Employee %1 has been created successfully', Rec."No.");
                    end;


                }
                action("Personal Information File")
                {
                    Caption = 'Personal Information File';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(39003916,,FALSE,HREmp);
                        
                         */
                        rec.Reset;
                        rec.SetFilter("No.", rec."No.");
                        REPORT.Run(Report::"HR Employee PIF", true, false, Rec);
                        // rec.Reset;

                    end;
                }
                action("Assigned Item Info")
                {
                    Caption = 'Assigned Item Info';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Report "Employee - Misc. Article Info.";
                    Visible = false;

                    trigger OnAction()
                    begin
                        Misc.Reset;
                        Misc.SetRange(Misc."Employee No.", rec."No.");
                        if Misc.Find('-') then REPORT.Run(5202, true, true, Misc);
                    end;
                }
                action("Confidential Info")
                {
                    Caption = 'Confidential Info';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Conf.Reset;
                        Conf.SetRange(Conf."Employee No.", rec."No.");
                        if Conf.Find('-') then REPORT.Run(5203, true, true, Conf);
                    end;
                }
                action(Label)
                {
                    Caption = 'Label';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-') then REPORT.Run(5200, true, true, HREmp);
                    end;
                }
                action(Addresses)
                {
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-') then REPORT.Run(5207, true, true, HREmp);
                    end;
                }
                action("Alt. Addresses")
                {
                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-') then REPORT.Run(5213, true, true, HREmp);
                    end;
                }
                action("Phone Nos")
                {
                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-') then REPORT.Run(5210, true, true, HREmp);
                    end;
                }
                action("Value Change Report")
                {
                    Caption = 'Value Change Report';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = false;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        HRValueChange.Reset;
                        HRValueChange.SetRange(HRValueChange."Employee No", rec."No.");
                        if HRValueChange.Find('-') then
                            REPORT.Run(39003910, true, true, HRValueChange)
                        else
                            Error('No value changes have been recorded for this employee');
                    end;
                }
            }
            group("&Functions")
            {
                Caption = '&Functions';

                action("Update Payroll Data")
                {
                    Caption = 'Update Payroll Data';
                    Image = PayrollStatistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        if rec."Posting Group" = '' then Error('Please specify the posting group for this employee');
                        if rec."Approval Status" = rec."Approval Status"::New then Error('Approval status must be Approved');
                        if Confirm('Update Payroll Data?', true) = false then exit;
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.SetRange(HREmp."Approval Status", HREmp."Approval Status"::Approved);
                        HREmp.FindFirst;
                        repeat begin
                            //CHECK IF EMPLOYEE IS ALREADY IN THE PAYROLL TABLE
                            //IF HE IS MODIFY INFORMATION TO REFLECT ANY CHANGES MADE
                            prEmployees.Reset;
                            prEmployees.SetRange(prEmployees."No.", HREmp."No.");
                            if prEmployees.Find('-') then begin
                                prEmployees."First Name" := HREmp."First Name";
                                prEmployees."Middle Name" := HREmp."Middle Name";
                                prEmployees."Last Name" := HREmp."Last Name";
                                prEmployees.Office := HREmp."Global Dimension 2";
                                prEmployees."Search Name" := HREmp."Search Name";
                                prEmployees."Postal Address" := HREmp."Postal Address";
                                prEmployees."Residential Address" := HREmp."Residential Address";
                                prEmployees.City := HREmp.City;
                                prEmployees."Post Code" := HREmp."Post Code";
                                prEmployees.County := HREmp.County;
                                prEmployees."Home Phone Number" := HREmp."Home Phone Number";
                                prEmployees."Work Phone Number" := HREmp."Work Phone Number";
                                prEmployees."Ext." := HREmp."Ext.";
                                prEmployees."E-Mail" := HREmp."Personal E-Mail";
                                prEmployees."ID Number" := HREmp."ID Number";
                                HREmp.Get(HREmp."No.");
                                HREmp.CalcFields(HREmp.Picture);
                                prEmployees.Picture := HREmp.Picture;
                                prEmployees."Union Code" := HREmp."Union Code";
                                prEmployees."UIF Number" := HREmp."UIF Number";
                                prEmployees.Gender := HREmp.Gender;
                                prEmployees.Status := HREmp.Status;
                                prEmployees."Salary Grade" := HREmp."Salary Grade";
                                prEmployees."Salary Notch/Step" := HREmp."Salary Step";
                                prEmployees."Department Code" := HREmp."Department Code";
                                prEmployees."Payment Mode" := HREmp."Payment Mode";
                                prEmployees."Payroll Filter Group" := HREmp."Payroll Filter Group";
                                prEmployees."Resource No." := HREmp."Resource No.";
                                prEmployees."Last Date Modified" := HREmp."Last Date Modified";
                                prEmployees."Fax Number" := HREmp."Fax Number";
                                prEmployees."Company E-Mail" := HREmp."Company E-Mail";
                                prEmployees.Title := HREmp.Title;
                                prEmployees."Salespers./Purch. Code" := HREmp."Salespers./Purch. Code";
                                prEmployees."No. Series" := HREmp."No. Series";
                                prEmployees."Known As" := HREmp."Also Known As";
                                prEmployees."Full / Part Time" := HREmp."Full / Part Time";
                                prEmployees."Contract End Date" := HREmp."Contract End Date";
                                prEmployees."Notice Period" := HREmp."Notice Period";
                                prEmployees."Union Member?" := HREmp."Is Union Member";
                                prEmployees."Shift Worker?" := HREmp."Is Shift Worker";
                                prEmployees."Contracted Hours" := HREmp."Contracted Hours";
                                prEmployees."Pay Period" := HREmp."Pay Period";
                                prEmployees."Pay Per Period" := HREmp."Pay Per Period";
                                prEmployees."Cost Code" := HREmp."Cost Code";
                                prEmployees."PAYE Number" := HREmp."PAYE Number";
                                prEmployees."Marital Status" := HREmp."Marital Status";
                                prEmployees."Ethnic Origin" := HREmp."Ethnic Origin";
                                prEmployees."First Language (R/W/S)" := HREmp."First Language (R/W/S)";
                                prEmployees."Vehicle Registration Number" := HREmp."Vehicle Registration Number";
                                prEmployees.Disabled := HREmp.Disabled;
                                prEmployees."Health Assesment?" := HREmp."Health Assesment?";
                                prEmployees."Health Assesment Date" := HREmp."-";
                                prEmployees."Date Of Birth" := HREmp."Date Of Birth";
                                prEmployees.Age := HREmp.Age;
                                prEmployees."Date Of Join" := HREmp."Date Of Joining the Company";
                                prEmployees."Length Of Service" := HREmp."Length Of Service";
                                prEmployees."End Of Probation Date" := HREmp."End of Probation Date";
                                prEmployees."Branch Bank" := HREmp."Branch Bank";
                                prEmployees."Main Bank" := HREmp."Main Bank";
                                prEmployees."Bank Account Number" := HREmp."Bank Account Number";
                                prEmployees."Per Annum" := HREmp."Per Annum";
                                prEmployees."Allow Overtime" := HREmp."Allow Overtime";
                                prEmployees."Medical Scheme No." := HREmp."Medical Scheme No.";
                                prEmployees."Medical Scheme Plan" := HREmp."Medical Scheme Plan";
                                prEmployees."Number Of Dependants" := HREmp."Number Of Dependants";
                                prEmployees."Medical Scheme Name" := HREmp."Medical Scheme Hospital";
                                prEmployees."Amount Paid By Employee" := HREmp."Amount Paid By Employee";
                                prEmployees."Amount Paid By Company" := HREmp."Amount Paid By Company";
                                prEmployees."Second Language (R/W/S)" := HREmp."Second Language (R/W/S)";
                                prEmployees."Additional Language" := HREmp."Additional Language";
                                prEmployees."UIF Country" := HREmp."UIF Country";
                                prEmployees."Primary Skills Category" := HREmp."Primary Skills Category";
                                prEmployees.Level := HREmp.Level;
                                prEmployees."Termination Category" := HREmp."Termination Grounds";
                                prEmployees."Job Specification" := HREmp."Job Title";
                                prEmployees."Postal Address2" := HREmp."Postal Address 2";
                                prEmployees."Postal Address3" := HREmp."Postal Address 3";
                                prEmployees."Residential Address2" := HREmp."Residential Address 2";
                                prEmployees."Residential Address3" := HREmp."Residential Address 3";
                                prEmployees."Post Code2" := HREmp."Post Code 2";
                                prEmployees.Citizenship := HREmp.Citizenship;
                                prEmployees."Name Of Manager" := HREmp."Name Of Manager";
                                prEmployees."User ID" := HREmp."User ID";
                                prEmployees."Disabling Details" := HREmp."Disability Details";
                                prEmployees."Passport Number" := HREmp."Passport Number";
                                prEmployees."2nd Skills Category" := HREmp."2nd Skills Category";
                                prEmployees."3rd Skills Category" := HREmp."3rd Skills Category";
                                prEmployees."Pension House" := HREmp."Pension Fund Administrator";
                                prEmployees.Temp := HREmp.Temp;
                                prEmployees."Contract Location" := HREmp."Contract Location";
                                prEmployees."First Language Read" := HREmp."First Language Read";
                                prEmployees."First Language Write" := HREmp."First Language Write";
                                prEmployees."First Language Speak" := HREmp."First Language Speak";
                                prEmployees."Second Language Read" := HREmp."Second Language Read";
                                prEmployees."Second Language Write" := HREmp."Second Language Write";
                                prEmployees."Second Language Speak" := HREmp."Second Language Speak";
                                prEmployees."Custom Grading" := HREmp."Custom Grading";
                                prEmployees."PIN No." := HREmp."PIN Number";
                                prEmployees."NSSF No." := HREmp."NSSF No.";
                                prEmployees."NHF No." := HREmp."NHIF No.";
                                prEmployees."Cause of Inactivity Code" := HREmp."Cause of Inactivity Code";
                                prEmployees."Payroll Code" := HREmp."No.";
                                prEmployees."HELB No" := HREmp."HELB No";
                                prEmployees."Co-Operative No" := HREmp."Co-Operative No";
                                prEmployees."Wedding Anniversary" := HREmp."Wedding Anniversary";
                                prEmployees."Position To Succeed" := HREmp."Position To Succeed";
                                prEmployees."Succesion Date" := HREmp."Succesion Date";
                                prEmployees."Send Alert to" := HREmp."Send Alert to";
                                prEmployees.Tribe := HREmp.Tribe;
                                prEmployees.Religion := HREmp.Religion;
                                prEmployees."Job Title" := HREmp."Job Description";
                                prEmployees."Posting Group" := HREmp."Posting Group";
                                prEmployees."Payroll Posting Group" := HREmp."Payroll Posting Group";
                                prEmployees."Served Notice Period" := HREmp."Served Notice Period";
                                prEmployees."Exit Interview Date" := HREmp."Exit Interview Date";
                                prEmployees."Exit Interview Done by" := HREmp."Exit Interview Done by";
                                prEmployees."Allow Re-Employment In Future" := HREmp."Allow Re-Employment In Future";
                                prEmployees."Medical Scheme Name #2" := HREmp."Medical Scheme Name #2";
                                prEmployees."Payroll Departments" := HREmp."Payroll Departments";
                                prEmployees.Comment := HREmp.Comment;
                                prEmployees."Competency Area" := HREmp."Competency Area";
                                prEmployees."Employee Qty" := HREmp."Employee Qty";
                                prEmployees."Employee Classification" := HREmp."Employee Classification";
                                prEmployees."Employee Act. Qty" := HREmp."Employee Act. Qty";
                                prEmployees."Employee Arc. Qty" := HREmp."Employee Arc. Qty";
                                prEmployees."Department Code" := HREmp."Department Code";
                                prEmployees.Office := HREmp."Global Dimension 2";
                                prEmployees."Payroll Code" := HREmp."No.";
                                prEmployees.Modify;
                                prEmployees.Validate("No.");
                            end
                            else begin
                                prEmployees.Init;
                                prEmployees."No." := HREmp."No.";
                                prEmployees."First Name" := HREmp."First Name";
                                prEmployees."Middle Name" := HREmp."Middle Name";
                                prEmployees."Last Name" := HREmp."Last Name";
                                prEmployees."Search Name" := HREmp."Search Name";
                                prEmployees."Postal Address" := HREmp."Postal Address";
                                prEmployees."Residential Address" := HREmp."Residential Address";
                                prEmployees.City := HREmp.City;
                                prEmployees."Post Code" := HREmp."Post Code";
                                prEmployees.County := HREmp.County;
                                prEmployees."Home Phone Number" := HREmp."Home Phone Number";
                                prEmployees."Work Phone Number" := HREmp."Work Phone Number";
                                prEmployees."Ext." := HREmp."Ext.";
                                prEmployees."Salary Grade" := HREmp."Salary Grade";
                                prEmployees."Salary Notch/Step" := HREmp."Salary Step";
                                prEmployees."Department Code" := HREmp."Department Code";
                                prEmployees."Payment Mode" := HREmp."Payment Mode";
                                prEmployees."E-Mail" := HREmp."Personal E-Mail";
                                prEmployees."ID Number" := HREmp."ID Number";
                                prEmployees.Picture := HREmp.Picture;
                                prEmployees."Union Code" := HREmp."Union Code";
                                prEmployees."UIF Number" := HREmp."UIF Number";
                                prEmployees.Gender := HREmp.Gender;
                                prEmployees.Status := HREmp.Status;
                                prEmployees."Resource No." := HREmp."Resource No.";
                                prEmployees."Last Date Modified" := HREmp."Last Date Modified";
                                prEmployees."Fax Number" := HREmp."Fax Number";
                                prEmployees."Company E-Mail" := HREmp."Company E-Mail";
                                prEmployees.Title := HREmp.Title;
                                prEmployees."Salespers./Purch. Code" := HREmp."Salespers./Purch. Code";
                                prEmployees."No. Series" := HREmp."No. Series";
                                prEmployees."Known As" := HREmp."Also Known As";
                                prEmployees."Full / Part Time" := HREmp."Full / Part Time";
                                prEmployees."Contract End Date" := HREmp."Contract End Date";
                                prEmployees."Notice Period" := HREmp."Notice Period";
                                prEmployees."Union Member?" := HREmp."Is Union Member";
                                prEmployees."Shift Worker?" := HREmp."Is Shift Worker";
                                prEmployees."Contracted Hours" := HREmp."Contracted Hours";
                                prEmployees."Pay Period" := HREmp."Pay Period";
                                prEmployees."Pay Per Period" := HREmp."Pay Per Period";
                                prEmployees."Cost Code" := HREmp."Cost Code";
                                prEmployees."PAYE Number" := HREmp."PAYE Number";
                                prEmployees."Marital Status" := HREmp."Marital Status";
                                prEmployees."Ethnic Origin" := HREmp."Ethnic Origin";
                                prEmployees."First Language (R/W/S)" := HREmp."First Language (R/W/S)";
                                prEmployees."Vehicle Registration Number" := HREmp."Vehicle Registration Number";
                                prEmployees.Disabled := HREmp.Disabled;
                                prEmployees."Health Assesment?" := HREmp."Health Assesment?";
                                prEmployees."Health Assesment Date" := HREmp."-";
                                prEmployees."Date Of Birth" := HREmp."Date Of Birth";
                                prEmployees.Age := HREmp.Age;
                                prEmployees."Date Of Join" := HREmp."Date Of Joining the Company";
                                prEmployees."Length Of Service" := HREmp."Length Of Service";
                                prEmployees."End Of Probation Date" := HREmp."End of Probation Date";
                                prEmployees."Per Annum" := HREmp."Per Annum";
                                prEmployees."Allow Overtime" := HREmp."Allow Overtime";
                                prEmployees."Medical Scheme No." := HREmp."Medical Scheme No.";
                                prEmployees."Medical Scheme Plan" := HREmp."Medical Scheme Plan";
                                prEmployees."Number Of Dependants" := HREmp."Number Of Dependants";
                                prEmployees."Medical Scheme Name" := HREmp."Medical Scheme Hospital";
                                prEmployees."Amount Paid By Employee" := HREmp."Amount Paid By Employee";
                                prEmployees."Amount Paid By Company" := HREmp."Amount Paid By Company";
                                prEmployees."Second Language (R/W/S)" := HREmp."Second Language (R/W/S)";
                                prEmployees."Additional Language" := HREmp."Additional Language";
                                prEmployees."UIF Country" := HREmp."UIF Country";
                                prEmployees."Primary Skills Category" := HREmp."Primary Skills Category";
                                prEmployees.Level := HREmp.Level;
                                prEmployees."Termination Category" := HREmp."Termination Grounds";
                                prEmployees."Job Specification" := HREmp."Job Title";
                                prEmployees."Postal Address2" := HREmp."Postal Address 2";
                                prEmployees."Postal Address3" := HREmp."Postal Address 3";
                                prEmployees."Residential Address2" := HREmp."Residential Address 2";
                                prEmployees."Residential Address3" := HREmp."Residential Address 3";
                                prEmployees."Post Code2" := HREmp."Post Code 2";
                                prEmployees.Citizenship := HREmp.Citizenship;
                                prEmployees."Name Of Manager" := HREmp."Name Of Manager";
                                prEmployees."User ID" := HREmp."User ID";
                                prEmployees."Disabling Details" := HREmp."Disability Details";
                                prEmployees."Passport Number" := HREmp."Passport Number";
                                prEmployees."2nd Skills Category" := HREmp."2nd Skills Category";
                                prEmployees."3rd Skills Category" := HREmp."3rd Skills Category";
                                prEmployees."Pension House" := HREmp."Pension Fund Administrator";
                                prEmployees.Temp := HREmp.Temp;
                                prEmployees."Contract Location" := HREmp."Contract Location";
                                prEmployees."First Language Read" := HREmp."First Language Read";
                                prEmployees."First Language Write" := HREmp."First Language Write";
                                prEmployees."First Language Speak" := HREmp."First Language Speak";
                                prEmployees."Second Language Read" := HREmp."Second Language Read";
                                prEmployees."Second Language Write" := HREmp."Second Language Write";
                                prEmployees."Second Language Speak" := HREmp."Second Language Speak";
                                prEmployees."Custom Grading" := HREmp."Custom Grading";
                                prEmployees."PIN No." := HREmp."PIN Number";
                                prEmployees."NSSF No." := HREmp."NSSF No.";
                                prEmployees."NHF No." := HREmp."NHIF No.";
                                prEmployees."Cause of Inactivity Code" := HREmp."Cause of Inactivity Code";
                                prEmployees."Payroll Code" := HREmp."Payroll No";
                                prEmployees."HELB No" := HREmp."HELB No";
                                prEmployees."Co-Operative No" := HREmp."Co-Operative No";
                                prEmployees."Wedding Anniversary" := HREmp."Wedding Anniversary";
                                prEmployees."Position To Succeed" := HREmp."Position To Succeed";
                                prEmployees."Succesion Date" := HREmp."Succesion Date";
                                prEmployees."Send Alert to" := HREmp."Send Alert to";
                                prEmployees.Tribe := HREmp.Tribe;
                                prEmployees.Religion := HREmp.Religion;
                                prEmployees."Job Title" := HREmp."Job Description";
                                prEmployees."Posting Group" := HREmp."Posting Group";
                                prEmployees."Payroll Posting Group" := HREmp."Payroll Posting Group";
                                prEmployees."Served Notice Period" := HREmp."Served Notice Period";
                                prEmployees."Exit Interview Date" := HREmp."Exit Interview Date";
                                prEmployees."Exit Interview Done by" := HREmp."Exit Interview Done by";
                                prEmployees."Allow Re-Employment In Future" := HREmp."Allow Re-Employment In Future";
                                prEmployees."Medical Scheme Name #2" := HREmp."Medical Scheme Name #2";
                                prEmployees."Payroll Departments" := HREmp."Payroll Departments";
                                prEmployees.Comment := HREmp.Comment;
                                prEmployees."Employee Classification" := HREmp."Employee Classification";
                                prEmployees."Competency Area" := HREmp."Competency Area";
                                prEmployees."Employee Qty" := HREmp."Employee Qty";
                                prEmployees."Payroll Filter Group" := HREmp."Payroll Filter Group";
                                prEmployees."Employee Act. Qty" := HREmp."Employee Act. Qty";
                                prEmployees."Employee Arc. Qty" := HREmp."Employee Arc. Qty";
                                prEmployees."Payroll Code" := HREmp."No.";
                                prEmployees."Department Code" := HREmp."Department Code";
                                prEmployees.Office := HREmp."Global Dimension 2";
                                prEmployees.Insert;
                                prEmployees.Validate("No.");
                                prPayrollType.Reset;
                                prPayrollType.SetRange(prPayrollType."Payroll Code", HREmp."No.");
                                if prPayrollType.Find('-') then begin
                                    prPayrollType."Payroll Code" := HREmp."No.";
                                    prPayrollType."Payroll Name" := HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                    prPayrollType.Modify;
                                end
                                else begin
                                    prPayrollType.Init;
                                    prPayrollType."Payroll Code" := HREmp."No.";
                                    prPayrollType."Payroll Name" := HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                    prPayrollType.Insert;
                                end;
                            end;
                        end;
                        until HREmp.Next = 0;
                        Message('Payroll data Successfully Updated.');
                    end;
                }
            }
            group("&Employee")
            {
                Caption = '&Employee';

                action("Employee Attachments")
                {
                    Caption = 'Employee Attachments';
                    Image = Attachments;
                    Promoted = true;
                    ApplicationArea = all;
                    Visible = false;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No" = FIELD("No."), "Document Type" = CONST(Employee);
                }
                action("Next of Kin")
                {
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageView = WHERE(Type = FILTER("Next of Kin"));
                    ApplicationArea = All;
                }
                action(Beneficiaries)
                {
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageView = WHERE(Type = FILTER(Beneficiary));
                }
                action("Change Log Entries")
                {
                    Caption = 'Change Log Entries';
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ApplicationArea = all;
                    PromotedIsBig = true;
                    RunObject = Page "Employee Log Entries";
                    RunPageLink = "Table No." = CONST(54578), "Primary Key Field 1 Value" = field("No."),
                     "Type of Change" = FILTER(Modification | Deletion);

                    //"Primary Key Field 1 Value" = FIELD("No.");
                }
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Qualification Line";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = History;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employment History Lines";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Alternative Addresses")
                {
                    Caption = 'Alternative Addresses';
                    Image = AlternativeAddress;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Alternative Address Card";
                    RunPageLink = "Employee No." = FIELD("No.");
                    Visible = false;
                }
                action("Assigned Items")
                {
                    Caption = 'Assigned Items';
                    Image = ExternalDocument;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action("Assigned Items Overview")
                {
                    Caption = 'Assigned Items Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("&Confidential Information")
                {
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = FIELD("No.");
                    Visible = false;
                }
                action("Co&nfidential Info. Overview")
                {
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Info. Overview";
                    Visible = false;
                    ApplicationArea = all;
                }
                action("A&bsences")
                {
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    ApplicationArea = all;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5200), "No." = FIELD("No.");
                }
                action("Hr Career Event")
                {
                    Caption = 'Career Event';
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category6;
                    ApplicationArea = all;
                    RunObject = Page "Hr Test List";
                    ///RunPageLink = Field7 = FIELD("No."); 
                    RunPageMode = View;
                    RunPageView = WHERE(Score = CONST('3'));
                }
            }
            group(Action21)
            {
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        //Ridwan
                        ApprovalDocType: enum "Approval Document Type";

                    begin
                        DocType := DocType::"HR Employees";
                        // ApprovalEntries.Setrecordfilters(DATABASE::"HR Employees", DocType, rec."No.");
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Employees", ApprovalDocType::Employee, rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;
                    Enabled = isOpen;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                        GenLedgSetup: Record "General Ledger Setup";
                    //NoSeriesMgt: Codeunit NoSeriesManagement;
                    begin
                        rec.TestField("Approval Status", rec."Approval Status"::New);
                        // if rec."Global Dimension 1" = '' then rec.FieldError("Global Dimension 1");
                        // rec.TestField("Department Code");
                        Rec.TestField("Shorcut Dimension 7");
                        Rec.TestField("Global Dimension 2");
                        LogLine.Reset;
                        LogLine.SetRange(LogLine."Table Name", LogLine."Table Name"::Employee);
                        LogLine.SetRange(LogLine."No.", rec."No.");
                        ///if PAGE.RunModal(5222, LogLine) = ACTION::LookupOK then 

                        ///IF ApprovalMgt.SendEmployeeApprovalRequest(Rec) THEN; RBS DEnnis 

                        begin
                            if ApprovalsMgt.CheckEmployeeApprovalsWorkflowEnable(rec) then
                                ApprovalsMgt.OnSendEmployeeForApproval(Rec);
                        end;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;
                    Enabled = not isOpen;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";

                    begin
                        //ApprovalMgt.CancelLeaveAppRequest(Rec,TRUE,TRUE);
                        ApprovalsMgt.OnCancelEmployeeForApproval(Rec);

                    end;
                }
                action("<Action1102755042>")
                {
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = true;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        rec."Approval Status" := rec."Approval Status"::New;
                        rec.Modify;

                    end;

                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        rec.CalcFields(rec."Total Leave Taken");
        //"Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
        //SUM UP LEAVE LEDGER ENTRIES
        rec."Leave Balance" := rec."Total (Leave Days)" - rec."Total Leave Taken";
    end;

    trigger OnAfterGetRecord()
    begin
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';
        //Recalculate Important Dates
        if (rec."Date Of Leaving the Company" = 0D) then begin
            if (rec."Date Of Birth" <> 0D) then DAge := Dates.DetermineAge(rec."Date Of Birth", Today);
            if (rec."Date Of Joining the Company" <> 0D) then DService := Dates.DetermineAge(rec."Date Of Joining the Company", Today);
            if (rec."Pension Scheme Join Date" <> 0D) then DPension := Dates.DetermineAge(rec."Pension Scheme Join Date", Today);
            if (rec."Medical Scheme Join Date" <> 0D) then DMedical := Dates.DetermineAge(rec."Medical Scheme Join Date", Today);
            //MODIFY;
        end
        else begin
            if (rec."Date Of Birth" <> 0D) then DAge := Dates.DetermineAge(rec."Date Of Birth", rec."Date Of Leaving the Company");
            if (rec."Date Of Joining the Company" <> 0D) then DService := Dates.DetermineAge(rec."Date Of Joining the Company", rec."Date Of Leaving the Company");
            if (rec."Pension Scheme Join Date" <> 0D) then DPension := Dates.DetermineAge(rec."Pension Scheme Join Date", rec."Date Of Leaving the Company");
            if (rec."Medical Scheme Join Date" <> 0D) then DMedical := Dates.DetermineAge(rec."Medical Scheme Join Date", rec."Date Of Leaving the Company");
            //MODIFY;
        end;
        //Recalculate Leave Days
        rec.Validate("Allocated Leave Days");
        SupervisorNames := GetSupervisor(rec."User ID");
        //  if rec."Approval Status" <> rec."Approval Status"::New then CurrPage.Editable := false;
        if rec."Approval Status" = rec."Approval Status"::New then
            isOpen := true else begin
            isOpen := false;

            currPage.Update();
        end;

        // Set Leave Status to Resumed

    end;

    trigger OnOpenPage()
    begin
        rec.CalcFields("Total Leave Taken");
        //"Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
        //SUM UP LEAVE LEDGER ENTRIES
        rec."Leave Balance" := rec."Total (Leave Days)" - rec."Total Leave Taken";
        //  if rec."Approval Status" <> rec."Approval Status"::New then CurrPage.Editable := false;
        if rec."Approval Status" = rec."Approval Status"::New then
            isOpen := true else begin
            isOpen := false;

            currPage.Update();
        end;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        // if rec."Global Dimension 1" = '' then
        //     rec.FieldError("Global Dimension 1");
        // rec.TestField("Department Code");
    end;

    var
        PictureExists: Boolean;
        Text001: Label 'Do you want to replace the existing picture of %1 %2?';
        Text002: Label 'Do you want to delete the picture of %1 %2?';
        Dates: Codeunit "HR Dates No Permission Restric";
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        D: Date;
        DoclLink: Record "HR Employee Attachments";
        "Filter": Boolean;
        prEmployees: Record "HR-Employee";
        prPayrollType: Record "prPayroll Type";
        Mail: Codeunit Mail;
        HREmp: Record "HR Employees";
        SupervisorNames: Code[50];
        Misc: Record "Misc. Article Information";
        Conf: Record "Confidential Information";
        HRValueChange: Record "HR Value Change";
        ApprovalMgt: Integer;

        LeaveApp: Record "HR Leave Application";
        ApprovalsMgt: Codeunit "Employee Approval Mgt. Ext.";
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",JV,"Payment Voucher","Petty Cash",Requisition,InterBank,"Staff Claim","Staff Advance",AdvanceSurrender,Capex,IJ,"Hr Job","Emp Loan","Leave Application","Employee Requisition","Interview Evaluation","Training Requisition",Appraisal,HMO,Canteen,EmpTransaction,LeaveAck,PFAMod,PFATransfer,Confirmation,Employee,"HR Employees";
        LogLine: Record "Human Resource Comment Line";
        isOpen: boolean;

    [Scope('Cloud')]
    procedure GetSupervisor(var sUserID: Code[50]) SupervisorName: Text[200]
    var
        UserSetup: Record "User Setup";
    begin
        if sUserID <> '' then begin
            UserSetup.Reset;
            if UserSetup.Get(sUserID) then begin
                SupervisorName := UserSetup."Approver ID";
                if SupervisorName <> '' then begin
                    HREmp.SetRange(HREmp."User ID", SupervisorName);
                    if HREmp.Find('-') then SupervisorName := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                end
                else begin
                    SupervisorName := '';
                end;
            end
            else begin
                Error('User' + ' ' + sUserID + ' ' + 'does not exist in the user setup table');
                SupervisorName := '';
            end;
        end;
    end;
}
