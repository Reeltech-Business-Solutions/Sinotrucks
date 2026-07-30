page 54893 "HR Employee Card Self"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("General Details")
            {
                Caption = 'General Details';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("ID Number"; Rec."ID Number")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec)then CurrPage.Update;
                    end;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Citizenship; rec.Citizenship)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Citizenship Text"; Rec."Citizenship Text")
                {
                    Caption = 'Country / Region Code';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Department Code"; Rec."Department Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Caption = '<Global Dimension 2 Code>';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Title; rec.Title)
                {
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; Rec."Residential Address")
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
                field(Picture; rec.Picture)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        SupervisorNames:=GetSupervisor(rec."User ID");
                    end;
                }
                field(Supervisor; rec.Supervisor)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Supervisor/Manager"; Rec."Supervisor/Manager")
                {
                    Caption = 'Supervisor ID';
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        Emp: Record "HR Employees";
                    begin
                        Emp.SetRange("User ID", rec."Supervisor/Manager");
                        if Emp.FindFirst then begin
                            SupervisorNames:=Emp."Last Name" + ' ' + Emp."First Name" + ' ' + Emp."Middle Name";
                            rec."Supervisor's Job Title":=Emp."Job Title";
                        end;
                    end;
                }
                field(SupervisorNames; SupervisorNames)
                {
                    Caption = 'Supervisor Name';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Supervisor's Job Title"; Rec."Supervisor's Job Title")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Status; rec.Status)
                {
                    Editable = false;
                    Importance = Promoted;
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field(Available; rec.Available)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Communication Details")
            {
                Caption = 'Communication Details';

                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    Editable = true;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    Editable = true;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Fax Number"; Rec."Fax Number")
                {
                    Editable = false;
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    Editable = false;
                    ExtendedDatatype = PhoneNo;
                    ApplicationArea = All;
                }
                field("Ext."; Rec."Ext.")
                {
                    Editable = false;
                    ExtendedDatatype = PhoneNo;
                    ApplicationArea = All;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    Editable = false;
                    ExtendedDatatype = EMail;
                    ApplicationArea = All;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    Editable = false;
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';

                field(Gender; rec.Gender)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Religion; rec.Religion)
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("First Language Read"; Rec."First Language Read")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("First Language Write"; Rec."First Language Write")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("First Language Speak"; Rec."First Language Speak")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Second Language Read"; Rec."Second Language Read")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Second Language Write"; Rec."Second Language Write")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Second Language Speak"; Rec."Second Language Speak")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Has Driving Licence"; Rec."Has Driving Licence")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Vehicle Registration Number"; Rec."Vehicle Registration Number")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Disabled; rec.Disabled)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Disability Details"; Rec."Disability Details")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Medical Scheme Plan"; Rec."Medical Scheme Plan")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Medical Sch. Hospital Code"; Rec."Medical Sch. Hospital Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Medical Scheme Hospital"; Rec."Medical Scheme Hospital")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("-"; Rec."-")
                {
                    ApplicationArea = all;
                }
            }
            group("Bank Details")
            {
                Caption = 'Bank Details';

                field("Main Bank"; Rec."Main Bank")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Branch Bank"; Rec."Branch Bank")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';

                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if rec."Date Of Birth" >= Today then begin
                            Error('Invalid Entry');
                        end;
                        DAge:=Dates.DetermineAge(rec."Date Of Birth", Today);
                    end;
                }
                field(DAge; DAge)
                {
                    Caption = 'Age';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Date Of Joining the Company"; Rec."Date Of Joining the Company")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        DService:=Dates.DetermineAge(rec."Date Of Joining the Company", Today);
                    end;
                }
                field(DService; DService)
                {
                    Caption = 'Length of Service';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Probation Date 3mnths"; Rec."Probation Date 3mnths")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Probation Form Filled"; Rec."Probation Form Filled")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Confirmation Form Filled"; Rec."Confirmation Form Filled")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("End of Probation Date"; Rec."End of Probation Date")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Pension Scheme Join Date"; Rec."Pension Scheme Join Date")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        DPension:=Dates.DetermineAge(rec."Pension Scheme Join Date", Today);
                    end;
                }
                field(DPension; DPension)
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Medical Scheme Join Date"; Rec."Medical Scheme Join Date")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        DMedical:=Dates.DetermineAge(rec."Medical Scheme Join Date", Today);
                    end;
                }
                field(DMedical; DMedical)
                {
                    Caption = 'Time On Medical Aid Scheme';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';

                field("Job Title"; Rec."Job Title")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Grade; rec.Grade)
                {
                    Editable = false;
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Job Level"; Rec."Job Level")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
                field("Resource Type"; Rec."Resource Type")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Salary Step"; Rec."Salary Step")
                {
                    Editable = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        if not Confirm('Changing the Grade will affect the Basic Salary and the salary notch\step transactions. ' + 'Do you wish to continue?', false)then begin
                            rec."Salary Step":='';
                            Error('You have opted to abort the process.');
                        end;
                    end;
                }
                field("Employee Classification"; Rec."Employee Classification")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Payroll Filter Group"; Rec."Payroll Filter Group")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Terms of Service")
            {
                Caption = 'Terms of Service';

                field("Employment Type"; Rec."Employment Type")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    Editable = false;
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    Editable = false;
                    Importance = Promoted;
                    Visible = true;
                    ApplicationArea = All;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';

                field("PIN Number"; Rec."PIN Number")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Pension Fund Administrator"; Rec."Pension Fund Administrator")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("NSSF No."; Rec."NSSF No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("NHIF No."; Rec."NHIF No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
            }
            group("Separation Details")
            {
                Caption = 'Separation Details';

                field("Date Of Leaving the Company"; Rec."Date Of Leaving the Company")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Termination Grounds"; Rec."Termination Grounds")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';

                field("Reimbursed Leave Days"; Rec."Reimbursed Leave Days")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
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
                    ApplicationArea = All;
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(LastLeaveCode; rec.LastLeaveCode)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755004; "HR Employees Factbox")
            {
                SubPageLink = "No."=FIELD("No.");
                ApplicationArea = All;
            }
            systempart(Control1102755002; Outlook)
            {
                ApplicationArea = All;
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

                action("Personal Information File")
                {
                    Caption = 'Personal Information File';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        /*HREmp.RESET;
                        HREmp.SETRANGE(HREmp."No.","No.");
                        IF HREmp.FIND('-') THEN
                        REPORT.RUN(51534516,,FALSE,HREmp);
                        
                         */
                        rec.Reset;
                        rec.SetFilter("No.", rec."No.");
                        REPORT.Run(39005585, true, true, Rec);
                        rec.Reset;
                    end;
                }
                action("Assigned Item Info")
                {
                    Caption = 'Assigned Item Info';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    RunObject = Report "Employee - Misc. Article Info.";
                    Visible = false;

                    trigger OnAction()
                    begin
                        Misc.Reset;
                        Misc.SetRange(Misc."Employee No.", rec."No.");
                        if Misc.Find('-')then REPORT.Run(5202, true, true, Misc);
                    end;
                }
                action("Confidential Info")
                {
                    Caption = 'Confidential Info';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        Conf.Reset;
                        Conf.SetRange(Conf."Employee No.", rec."No.");
                        if Conf.Find('-')then REPORT.Run(5203, true, true, Conf);
                    end;
                }
                action(Label)
                {
                    Caption = 'Label';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-')then REPORT.Run(5200, true, true, HREmp);
                    end;
                }
                action(Addresses)
                {
                    Caption = 'Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-')then REPORT.Run(5207, true, true, HREmp);
                    end;
                }
                action("Alt. Addresses")
                {
                    Caption = 'Alt. Addresses';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-')then REPORT.Run(5213, true, true, HREmp);
                    end;
                }
                action("Phone Nos")
                {
                    Caption = 'Phone Nos';
                    Image = PrintReport;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    Visible = false;

                    trigger OnAction()
                    begin
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."No.", rec."No.");
                        if HREmp.Find('-')then REPORT.Run(5210, true, true, HREmp);
                    end;
                }
                action("Value Change Report")
                {
                    Caption = 'Value Change Report';
                    Image = PrintReport;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        HRValueChange.Reset;
                        HRValueChange.SetRange(HRValueChange."Employee No", rec."No.");
                        if HRValueChange.Find('-')then REPORT.Run(51534510, true, true, HRValueChange)
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
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if rec."Posting Group" = '' then Error('Please specify the posting group for this employee');
                        if Confirm('Update Payroll Data?', true) = false then exit;
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.FindFirst;
                        repeat begin
                            //CHECK IF EMPLOYEE IS ALREADY IN THE PAYROLL TABLE
                            //IF HE IS MODIFY INFORMATION TO REFLECT ANY CHANGES MADE
                            prEmployees.Reset;
                            prEmployees.SetRange(prEmployees."No.", HREmp."No.");
                            if prEmployees.Find('-')then begin
                                prEmployees."First Name":=HREmp."First Name";
                                prEmployees."Middle Name":=HREmp."Middle Name";
                                prEmployees."Last Name":=HREmp."Last Name";
                                prEmployees.Office:=HREmp."Global Dimension 2";
                                prEmployees."Search Name":=HREmp."Search Name";
                                prEmployees."Postal Address":=HREmp."Postal Address";
                                prEmployees."Residential Address":=HREmp."Residential Address";
                                prEmployees.City:=HREmp.City;
                                prEmployees."Post Code":=HREmp."Post Code";
                                prEmployees.County:=HREmp.County;
                                prEmployees."Home Phone Number":=HREmp."Home Phone Number";
                                prEmployees."Work Phone Number":=HREmp."Work Phone Number";
                                prEmployees."Ext.":=HREmp."Ext.";
                                prEmployees."E-Mail":=HREmp."Personal E-Mail";
                                prEmployees."ID Number":=HREmp."ID Number";
                                HREmp.Get(HREmp."No.");
                                HREmp.CalcFields(HREmp.Picture);
                                prEmployees.Picture:=HREmp.Picture;
                                prEmployees."Union Code":=HREmp."Union Code";
                                prEmployees."UIF Number":=HREmp."UIF Number";
                                prEmployees.Gender:=HREmp.Gender;
                                prEmployees.Status:=HREmp.Status;
                                prEmployees."Salary Grade":=HREmp."Salary Grade";
                                prEmployees."Salary Notch/Step":=HREmp."Salary Step";
                                prEmployees."Department Code":=HREmp."Department Code";
                                prEmployees."Payment Mode":=HREmp."Payment Mode";
                                prEmployees."Payroll Filter Group":=HREmp."Payroll Filter Group";
                                prEmployees."Resource No.":=HREmp."Resource No.";
                                prEmployees."Last Date Modified":=HREmp."Last Date Modified";
                                prEmployees."Fax Number":=HREmp."Fax Number";
                                prEmployees."Company E-Mail":=HREmp."Company E-Mail";
                                prEmployees.Title:=HREmp.Title;
                                prEmployees."Salespers./Purch. Code":=HREmp."Salespers./Purch. Code";
                                prEmployees."No. Series":=HREmp."No. Series";
                                prEmployees."Known As":=HREmp."Also Known As";
                                prEmployees."Full / Part Time":=HREmp."Full / Part Time";
                                prEmployees."Contract End Date":=HREmp."Contract End Date";
                                prEmployees."Notice Period":=HREmp."Notice Period";
                                prEmployees."Union Member?":=HREmp."Is Union Member";
                                prEmployees."Shift Worker?":=HREmp."Is Shift Worker";
                                prEmployees."Contracted Hours":=HREmp."Contracted Hours";
                                prEmployees."Pay Period":=HREmp."Pay Period";
                                prEmployees."Pay Per Period":=HREmp."Pay Per Period";
                                prEmployees."Cost Code":=HREmp."Cost Code";
                                prEmployees."PAYE Number":=HREmp."PAYE Number";
                                prEmployees."Marital Status":=HREmp."Marital Status";
                                prEmployees."Ethnic Origin":=HREmp."Ethnic Origin";
                                prEmployees."First Language (R/W/S)":=HREmp."First Language (R/W/S)";
                                prEmployees."Vehicle Registration Number":=HREmp."Vehicle Registration Number";
                                prEmployees.Disabled:=HREmp.Disabled;
                                prEmployees."Health Assesment?":=HREmp."Health Assesment?";
                                prEmployees."Health Assesment Date":=HREmp."-";
                                prEmployees."Date Of Birth":=HREmp."Date Of Birth";
                                prEmployees.Age:=HREmp.Age;
                                prEmployees."Date Of Join":=HREmp."Date Of Joining the Company";
                                prEmployees."Length Of Service":=HREmp."Length Of Service";
                                prEmployees."End Of Probation Date":=HREmp."End of Probation Date";
                                prEmployees."Branch Bank":=HREmp."Branch Bank";
                                prEmployees."Main Bank":=HREmp."Main Bank";
                                prEmployees."Bank Account Number":=HREmp."Bank Account Number";
                                prEmployees."Per Annum":=HREmp."Per Annum";
                                prEmployees."Allow Overtime":=HREmp."Allow Overtime";
                                prEmployees."Medical Scheme No.":=HREmp."Medical Scheme No.";
                                prEmployees."Medical Scheme Plan":=HREmp."Medical Scheme Plan";
                                prEmployees."Number Of Dependants":=HREmp."Number Of Dependants";
                                prEmployees."Medical Scheme Name":=HREmp."Medical Scheme Hospital";
                                prEmployees."Amount Paid By Employee":=HREmp."Amount Paid By Employee";
                                prEmployees."Amount Paid By Company":=HREmp."Amount Paid By Company";
                                prEmployees."Second Language (R/W/S)":=HREmp."Second Language (R/W/S)";
                                prEmployees."Additional Language":=HREmp."Additional Language";
                                prEmployees."UIF Country":=HREmp."UIF Country";
                                prEmployees."Primary Skills Category":=HREmp."Primary Skills Category";
                                prEmployees.Level:=HREmp.Level;
                                prEmployees."Termination Category":=HREmp."Termination Grounds";
                                prEmployees."Job Specification":=HREmp."Job Title";
                                prEmployees."Postal Address2":=HREmp."Postal Address 2";
                                prEmployees."Postal Address3":=HREmp."Postal Address 3";
                                prEmployees."Residential Address2":=HREmp."Residential Address 2";
                                prEmployees."Residential Address3":=HREmp."Residential Address 3";
                                prEmployees."Post Code2":=HREmp."Post Code 2";
                                prEmployees.Citizenship:=HREmp.Citizenship;
                                prEmployees."Name Of Manager":=HREmp."Name Of Manager";
                                prEmployees."User ID":=HREmp."User ID";
                                prEmployees."Disabling Details":=HREmp."Disability Details";
                                prEmployees."Passport Number":=HREmp."Passport Number";
                                prEmployees."2nd Skills Category":=HREmp."2nd Skills Category";
                                prEmployees."3rd Skills Category":=HREmp."3rd Skills Category";
                                prEmployees."Pension House":=HREmp."Pension Fund Administrator";
                                prEmployees.Temp:=HREmp.Temp;
                                prEmployees."Contract Location":=HREmp."Contract Location";
                                prEmployees."First Language Read":=HREmp."First Language Read";
                                prEmployees."First Language Write":=HREmp."First Language Write";
                                prEmployees."First Language Speak":=HREmp."First Language Speak";
                                prEmployees."Second Language Read":=HREmp."Second Language Read";
                                prEmployees."Second Language Write":=HREmp."Second Language Write";
                                prEmployees."Second Language Speak":=HREmp."Second Language Speak";
                                prEmployees."Custom Grading":=HREmp."Custom Grading";
                                prEmployees."PIN No.":=HREmp."PIN Number";
                                prEmployees."NSSF No.":=HREmp."NSSF No.";
                                prEmployees."NHF No.":=HREmp."NHIF No.";
                                prEmployees."Cause of Inactivity Code":=HREmp."Cause of Inactivity Code";
                                prEmployees."Payroll Code":=HREmp."No.";
                                prEmployees."HELB No":=HREmp."HELB No";
                                prEmployees."Co-Operative No":=HREmp."Co-Operative No";
                                prEmployees."Wedding Anniversary":=HREmp."Wedding Anniversary";
                                prEmployees."Position To Succeed":=HREmp."Position To Succeed";
                                prEmployees."Succesion Date":=HREmp."Succesion Date";
                                prEmployees."Send Alert to":=HREmp."Send Alert to";
                                prEmployees.Tribe:=HREmp.Tribe;
                                prEmployees.Religion:=HREmp.Religion;
                                prEmployees."Job Title":=HREmp."Job Description";
                                prEmployees."Posting Group":=HREmp."Posting Group";
                                prEmployees."Payroll Posting Group":=HREmp."Payroll Posting Group";
                                prEmployees."Served Notice Period":=HREmp."Served Notice Period";
                                prEmployees."Exit Interview Date":=HREmp."Exit Interview Date";
                                prEmployees."Exit Interview Done by":=HREmp."Exit Interview Done by";
                                prEmployees."Allow Re-Employment In Future":=HREmp."Allow Re-Employment In Future";
                                prEmployees."Medical Scheme Name #2":=HREmp."Medical Scheme Name #2";
                                prEmployees."Payroll Departments":=HREmp."Payroll Departments";
                                prEmployees.Comment:=HREmp.Comment;
                                prEmployees."Competency Area":=HREmp."Competency Area";
                                prEmployees."Employee Qty":=HREmp."Employee Qty";
                                prEmployees."Employee Classification":=HREmp."Employee Classification";
                                prEmployees."Employee Act. Qty":=HREmp."Employee Act. Qty";
                                prEmployees."Employee Arc. Qty":=HREmp."Employee Arc. Qty";
                                prEmployees."Department Code":=HREmp."Department Code";
                                prEmployees.Office:=HREmp."Global Dimension 2";
                                prEmployees."Payroll Code":=HREmp."No.";
                                prEmployees.Modify;
                                prEmployees.Validate("No.");
                            end
                            else
                            begin
                                prEmployees.Init;
                                prEmployees."No.":=HREmp."No.";
                                prEmployees."First Name":=HREmp."First Name";
                                prEmployees."Middle Name":=HREmp."Middle Name";
                                prEmployees."Last Name":=HREmp."Last Name";
                                prEmployees."Search Name":=HREmp."Search Name";
                                prEmployees."Postal Address":=HREmp."Postal Address";
                                prEmployees."Residential Address":=HREmp."Residential Address";
                                prEmployees.City:=HREmp.City;
                                prEmployees."Post Code":=HREmp."Post Code";
                                prEmployees.County:=HREmp.County;
                                prEmployees."Home Phone Number":=HREmp."Home Phone Number";
                                prEmployees."Work Phone Number":=HREmp."Work Phone Number";
                                prEmployees."Ext.":=HREmp."Ext.";
                                prEmployees."Salary Grade":=HREmp."Salary Grade";
                                prEmployees."Salary Notch/Step":=HREmp."Salary Step";
                                prEmployees."Department Code":=HREmp."Department Code";
                                prEmployees."Payment Mode":=HREmp."Payment Mode";
                                prEmployees."E-Mail":=HREmp."Personal E-Mail";
                                prEmployees."ID Number":=HREmp."ID Number";
                                prEmployees.Picture:=HREmp.Picture;
                                prEmployees."Union Code":=HREmp."Union Code";
                                prEmployees."UIF Number":=HREmp."UIF Number";
                                prEmployees.Gender:=HREmp.Gender;
                                prEmployees.Status:=HREmp.Status;
                                prEmployees."Resource No.":=HREmp."Resource No.";
                                prEmployees."Last Date Modified":=HREmp."Last Date Modified";
                                prEmployees."Fax Number":=HREmp."Fax Number";
                                prEmployees."Company E-Mail":=HREmp."Company E-Mail";
                                prEmployees.Title:=HREmp.Title;
                                prEmployees."Salespers./Purch. Code":=HREmp."Salespers./Purch. Code";
                                prEmployees."No. Series":=HREmp."No. Series";
                                prEmployees."Known As":=HREmp."Also Known As";
                                prEmployees."Full / Part Time":=HREmp."Full / Part Time";
                                prEmployees."Contract End Date":=HREmp."Contract End Date";
                                prEmployees."Notice Period":=HREmp."Notice Period";
                                prEmployees."Union Member?":=HREmp."Is Union Member";
                                prEmployees."Shift Worker?":=HREmp."Is Shift Worker";
                                prEmployees."Contracted Hours":=HREmp."Contracted Hours";
                                prEmployees."Pay Period":=HREmp."Pay Period";
                                prEmployees."Pay Per Period":=HREmp."Pay Per Period";
                                prEmployees."Cost Code":=HREmp."Cost Code";
                                prEmployees."PAYE Number":=HREmp."PAYE Number";
                                prEmployees."Marital Status":=HREmp."Marital Status";
                                prEmployees."Ethnic Origin":=HREmp."Ethnic Origin";
                                prEmployees."First Language (R/W/S)":=HREmp."First Language (R/W/S)";
                                prEmployees."Vehicle Registration Number":=HREmp."Vehicle Registration Number";
                                prEmployees.Disabled:=HREmp.Disabled;
                                prEmployees."Health Assesment?":=HREmp."Health Assesment?";
                                prEmployees."Health Assesment Date":=HREmp."-";
                                prEmployees."Date Of Birth":=HREmp."Date Of Birth";
                                prEmployees.Age:=HREmp.Age;
                                prEmployees."Date Of Join":=HREmp."Date Of Joining the Company";
                                prEmployees."Length Of Service":=HREmp."Length Of Service";
                                prEmployees."End Of Probation Date":=HREmp."End of Probation Date";
                                prEmployees."Per Annum":=HREmp."Per Annum";
                                prEmployees."Allow Overtime":=HREmp."Allow Overtime";
                                prEmployees."Medical Scheme No.":=HREmp."Medical Scheme No.";
                                prEmployees."Medical Scheme Plan":=HREmp."Medical Scheme Plan";
                                prEmployees."Number Of Dependants":=HREmp."Number Of Dependants";
                                prEmployees."Medical Scheme Name":=HREmp."Medical Scheme Hospital";
                                prEmployees."Amount Paid By Employee":=HREmp."Amount Paid By Employee";
                                prEmployees."Amount Paid By Company":=HREmp."Amount Paid By Company";
                                prEmployees."Second Language (R/W/S)":=HREmp."Second Language (R/W/S)";
                                prEmployees."Additional Language":=HREmp."Additional Language";
                                prEmployees."UIF Country":=HREmp."UIF Country";
                                prEmployees."Primary Skills Category":=HREmp."Primary Skills Category";
                                prEmployees.Level:=HREmp.Level;
                                prEmployees."Termination Category":=HREmp."Termination Grounds";
                                prEmployees."Job Specification":=HREmp."Job Title";
                                prEmployees."Postal Address2":=HREmp."Postal Address 2";
                                prEmployees."Postal Address3":=HREmp."Postal Address 3";
                                prEmployees."Residential Address2":=HREmp."Residential Address 2";
                                prEmployees."Residential Address3":=HREmp."Residential Address 3";
                                prEmployees."Post Code2":=HREmp."Post Code 2";
                                prEmployees.Citizenship:=HREmp.Citizenship;
                                prEmployees."Name Of Manager":=HREmp."Name Of Manager";
                                prEmployees."User ID":=HREmp."User ID";
                                prEmployees."Disabling Details":=HREmp."Disability Details";
                                prEmployees."Passport Number":=HREmp."Passport Number";
                                prEmployees."2nd Skills Category":=HREmp."2nd Skills Category";
                                prEmployees."3rd Skills Category":=HREmp."3rd Skills Category";
                                prEmployees."Pension House":=HREmp."Pension Fund Administrator";
                                prEmployees.Temp:=HREmp.Temp;
                                prEmployees."Contract Location":=HREmp."Contract Location";
                                prEmployees."First Language Read":=HREmp."First Language Read";
                                prEmployees."First Language Write":=HREmp."First Language Write";
                                prEmployees."First Language Speak":=HREmp."First Language Speak";
                                prEmployees."Second Language Read":=HREmp."Second Language Read";
                                prEmployees."Second Language Write":=HREmp."Second Language Write";
                                prEmployees."Second Language Speak":=HREmp."Second Language Speak";
                                prEmployees."Custom Grading":=HREmp."Custom Grading";
                                prEmployees."PIN No.":=HREmp."PIN Number";
                                prEmployees."NSSF No.":=HREmp."NSSF No.";
                                prEmployees."NHF No.":=HREmp."NHIF No.";
                                prEmployees."Cause of Inactivity Code":=HREmp."Cause of Inactivity Code";
                                prEmployees."Payroll Code":=HREmp."Payroll No";
                                prEmployees."HELB No":=HREmp."HELB No";
                                prEmployees."Co-Operative No":=HREmp."Co-Operative No";
                                prEmployees."Wedding Anniversary":=HREmp."Wedding Anniversary";
                                prEmployees."Position To Succeed":=HREmp."Position To Succeed";
                                prEmployees."Succesion Date":=HREmp."Succesion Date";
                                prEmployees."Send Alert to":=HREmp."Send Alert to";
                                prEmployees.Tribe:=HREmp.Tribe;
                                prEmployees.Religion:=HREmp.Religion;
                                prEmployees."Job Title":=HREmp."Job Description";
                                prEmployees."Posting Group":=HREmp."Posting Group";
                                prEmployees."Payroll Posting Group":=HREmp."Payroll Posting Group";
                                prEmployees."Served Notice Period":=HREmp."Served Notice Period";
                                prEmployees."Exit Interview Date":=HREmp."Exit Interview Date";
                                prEmployees."Exit Interview Done by":=HREmp."Exit Interview Done by";
                                prEmployees."Allow Re-Employment In Future":=HREmp."Allow Re-Employment In Future";
                                prEmployees."Medical Scheme Name #2":=HREmp."Medical Scheme Name #2";
                                prEmployees."Payroll Departments":=HREmp."Payroll Departments";
                                prEmployees.Comment:=HREmp.Comment;
                                prEmployees."Employee Classification":=HREmp."Employee Classification";
                                prEmployees."Competency Area":=HREmp."Competency Area";
                                prEmployees."Employee Qty":=HREmp."Employee Qty";
                                prEmployees."Payroll Filter Group":=HREmp."Payroll Filter Group";
                                prEmployees."Employee Act. Qty":=HREmp."Employee Act. Qty";
                                prEmployees."Employee Arc. Qty":=HREmp."Employee Arc. Qty";
                                prEmployees."Payroll Code":=HREmp."No.";
                                prEmployees."Department Code":=HREmp."Department Code";
                                prEmployees.Office:=HREmp."Global Dimension 2";
                                prEmployees.Insert;
                                prEmployees.Validate("No.");
                                prPayrollType.Reset;
                                prPayrollType.SetRange(prPayrollType."Payroll Code", HREmp."No.");
                                if prPayrollType.Find('-')then begin
                                    prPayrollType."Payroll Code":=HREmp."No.";
                                    prPayrollType."Payroll Name":=HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
                                    prPayrollType.Modify;
                                end
                                else
                                begin
                                    prPayrollType.Init;
                                    prPayrollType."Payroll Code":=HREmp."No.";
                                    prPayrollType."Payroll Name":=HREmp."First Name" + '' + HREmp."Middle Name" + '' + HREmp."Last Name";
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
                    PromotedCategory = Category6;
                    ApplicationArea = All;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No"=FIELD("No."), "Document Type"=CONST(Employee);
                }
                action("Next of Kin")
                {
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    ApplicationArea = All;
                    RunPageLink = "Employee Code"=FIELD("No.");
                    RunPageView = WHERE(Type=FILTER("Next of Kin"));
                }
                action(Beneficiaries)
                {
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code"=FIELD("No.");
                    RunPageView = WHERE(Type=FILTER(Beneficiary));
                    ApplicationArea = All;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = false;
                    ApplicationArea = All;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name"=CONST(Employee), "No."=FIELD("No.");
                }
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Qualification Line";
                    RunPageLink = "Employee No."=FIELD("No.");
                    ApplicationArea = All;
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = History;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employment History Lines";
                    RunPageLink = "Employee No."=FIELD("No.");
                    ApplicationArea = All;
                }
                action("Alternative Addresses")
                {
                    Caption = 'Alternative Addresses';
                    Image = AlternativeAddress;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Alternative Address Card";
                    RunPageLink = "Employee No."=FIELD("No.");
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Assigned Items")
                {
                    Caption = 'Assigned Items';
                    Image = ExternalDocument;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No."=FIELD("No.");
                    ApplicationArea = All;
                }
                action("Assigned Items Overview")
                {
                    Caption = 'Assigned Items Overview';
                    Image = ViewSourceDocumentLine;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Misc. Articles Overview";
                    ApplicationArea = All;
                }
                action("&Confidential Information")
                {
                    Caption = '&Confidential Information';
                    Image = SNInfo;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No."=FIELD("No.");
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Co&nfidential Info. Overview")
                {
                    Caption = 'Co&nfidential Info. Overview';
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Confidential Info. Overview";
                    Visible = false;
                    ApplicationArea = All;
                }
                action("A&bsences")
                {
                    Caption = 'A&bsences';
                    Image = AbsenceCalendar;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No."=FIELD("No.");
                    ApplicationArea = All;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID"=CONST(5200), "No."=FIELD("No.");
                    ApplicationArea = All;
                }
                action("Hr Career Event")
                {
                    Caption = 'Career Event';
                    Image = Change;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Hr Test List";
                    ApplicationArea = All;
                    ///RunPageLink = Field7 = FIELD("No."); 
 RunPageMode = View;
                    RunPageView = WHERE(Score=CONST('3'));
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        rec.CalcFields(rec."Total Leave Taken");
        //"Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
        //SUM UP LEAVE LEDGER ENTRIES
        rec."Leave Balance":=rec."Total (Leave Days)" - rec."Total Leave Taken";
    end;
    trigger OnAfterGetRecord()
    begin
        HRSetup.Get;
        if HRSetup."Open Period" then FieldEditable:=true
        else
            FieldEditable:=false;
        DAge:='';
        DService:='';
        DPension:='';
        DMedical:='';
        //Recalculate Important Dates
        if(rec."Date Of Leaving the Company" = 0D)then begin
            if(rec."Date Of Birth" <> 0D)then DAge:=Dates.DetermineAge(rec."Date Of Birth", Today);
            if(rec."Date Of Joining the Company" <> 0D)then DService:=Dates.DetermineAge(rec."Date Of Joining the Company", Today);
            if(rec."Pension Scheme Join Date" <> 0D)then DPension:=Dates.DetermineAge(rec."Pension Scheme Join Date", Today);
            if(rec."Medical Scheme Join Date" <> 0D)then DMedical:=Dates.DetermineAge(rec."Medical Scheme Join Date", Today);
        //MODIFY;
        end
        else
        begin
            if(rec."Date Of Birth" <> 0D)then DAge:=Dates.DetermineAge(rec."Date Of Birth", rec."Date Of Leaving the Company");
            if(rec."Date Of Joining the Company" <> 0D)then DService:=Dates.DetermineAge(rec."Date Of Joining the Company", rec."Date Of Leaving the Company");
            if(rec."Pension Scheme Join Date" <> 0D)then DPension:=Dates.DetermineAge(rec."Pension Scheme Join Date", rec."Date Of Leaving the Company");
            if(rec."Medical Scheme Join Date" <> 0D)then DMedical:=Dates.DetermineAge(rec."Medical Scheme Join Date", rec."Date Of Leaving the Company");
        //MODIFY;
        end;
        //Recalculate Leave Days
        rec.Validate(rec."Allocated Leave Days");
        SupervisorNames:=GetSupervisor(rec."User ID");
    end;
    trigger OnOpenPage()
    begin
        rec.CalcFields(rec."Total Leave Taken");
        //"Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
        //SUM UP LEAVE LEDGER ENTRIES
        rec."Leave Balance":=rec."Total (Leave Days)" - rec."Total Leave Taken";
        HRSetup.Get;
        if HRSetup."Open Period" then FieldEditable:=true
        else
            FieldEditable:=false;
    end;
    var PictureExists: Boolean;
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
    FieldEditable: Boolean;
    HRSetup: Record "HR Setup";
    [Scope('Cloud')]
    procedure GetSupervisor(var sUserID: Code[50])SupervisorName: Text[200]var
        UserSetup: Record "User Setup";
    begin
        if sUserID <> '' then begin
            UserSetup.Reset;
            if UserSetup.Get(sUserID)then begin
                SupervisorName:=UserSetup."Approver ID";
                if SupervisorName <> '' then begin
                    HREmp.SetRange(HREmp."User ID", SupervisorName);
                    if HREmp.Find('-')then SupervisorName:=HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
                end
                else
                begin
                    SupervisorName:='';
                end;
            end
            else
            begin
                Error('User' + ' ' + sUserID + ' ' + 'does not exist in the user setup table');
                SupervisorName:='';
            end;
        end;
    end;
}
