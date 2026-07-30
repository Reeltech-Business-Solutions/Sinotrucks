page 54436 HREmployeeConnection
{
    Caption = 'HREmployeeConnection';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Print,Functions,Employee,Attachments';
    SourceTable = "HR Employees";

    layout
    {
        area(content)
        {
            group("General Details")
            {
                Caption = 'General Details';

                field("No."; rec."No.")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("First Name"; rec."First Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Middle Name"; rec."Middle Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Last Name"; rec."Last Name")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("ID Number"; rec."ID Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;

                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit(xRec)then CurrPage.Update;
                    end;
                }
                field("Passport Number"; rec."Passport Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Department Code"; rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2"; rec."Global Dimension 2")
                {
                    Caption = '<Global Dimension 2 Code>';
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Title; rec.Title)
                {
                    ApplicationArea = all;
                }
                field("Post Code"; rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field("Postal Address"; rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; rec."Residential Address")
                {
                    ApplicationArea = all;
                }
                field(City; rec.City)
                {
                    ApplicationArea = all;
                }
                field(Picture; rec.Picture)
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    Importance = Promoted;
                    Style = Strong;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
            }
            group("Communication Details")
            {
                Caption = 'Communication Details';

                field("Home Phone Number"; rec."Home Phone Number")
                {
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Cell Phone Number"; rec."Cell Phone Number")
                {
                    ExtendedDatatype = PhoneNo;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Personal E-Mail"; rec."Personal E-Mail")
                {
                    ExtendedDatatype = EMail;
                    ApplicationArea = all;
                }
                field("Company E-Mail"; rec."Company E-Mail")
                {
                    ExtendedDatatype = EMail;
                    Importance = Promoted;
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
                }
                field("Marital Status"; rec."Marital Status")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(Religion; rec.Religion)
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
            }
            group("Bank Details")
            {
                Caption = 'Bank Details';

                field("Main Bank"; rec."Main Bank")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Bank Account Number"; rec."Bank Account Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';

                field("Date Of Birth"; rec."Date Of Birth")
                {
                    ApplicationArea = all;

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
                    ApplicationArea = all;
                    Caption = 'Age';
                    Editable = false;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Date Of Joining the Company"; rec."Date Of Joining the Company")
                {
                    Importance = Promoted;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        DService:=Dates.DetermineAge(rec."Date Of Joining the Company", Today);
                    end;
                }
                field(DService; DService)
                {
                    ApplicationArea = all;
                    Caption = 'Length of Service';
                    Editable = false;
                    Enabled = false;
                }
                field("Probation Date 3mnths"; rec."Probation Date 3mnths")
                {
                    ApplicationArea = all;
                }
                field("Confirmation Date"; rec."Confirmation Date")
                {
                    ApplicationArea = all;
                }
                field("Probation Form Filled"; rec."Probation Form Filled")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Confirmation Form Filled"; rec."Confirmation Form Filled")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("End of Probation Date"; rec."End of Probation Date")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Pension Scheme Join Date"; rec."Pension Scheme Join Date")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        DPension:=Dates.DetermineAge(rec."Pension Scheme Join Date", Today);
                    end;
                }
                field(DPension; DPension)
                {
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Medical Scheme Join Date"; rec."Medical Scheme Join Date")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        DMedical:=Dates.DetermineAge(rec."Medical Scheme Join Date", Today);
                    end;
                }
                field(DMedical; DMedical)
                {
                    ApplicationArea = all;
                    Caption = 'Time On Medical Aid Scheme';
                    Editable = false;
                    Enabled = false;
                }
                field("Wedding Anniversary"; rec."Wedding Anniversary")
                {
                    ApplicationArea = all;
                }
            }
            group("Job Details")
            {
                Caption = 'Job Details';

                field("Job Title"; rec."Job Title")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Job Description"; rec."Job Description")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
            }
            group("Terms of Service")
            {
                Caption = 'Terms of Service';

                field("Employment Type"; rec."Employment Type")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Contract Type"; rec."Contract Type")
                {
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Contract End Date"; rec."Contract End Date")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';

                field("PIN Number"; rec."PIN Number")
                {
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Pension Fund Administrator"; rec."Pension Fund Administrator")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control24; "Log Sheet")
            {
                ApplicationArea = all;
                SubPageLink = "Table Name"=CONST(Employee), "No."=FIELD("No.");
            }
            part("HR Employees Factbox"; "HR Employees Factbox")
            {
                ApplicationArea = all;
                SubPageLink = "No."=FIELD("No.");
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
                        if Misc.Find('-')then REPORT.Run(5202, true, true, Misc);
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
                        if Conf.Find('-')then REPORT.Run(5203, true, true, Conf);
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
                        if HREmp.Find('-')then REPORT.Run(5200, true, true, HREmp);
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
                        if HREmp.Find('-')then REPORT.Run(5207, true, true, HREmp);
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
                        if HREmp.Find('-')then REPORT.Run(5213, true, true, HREmp);
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
                        if HREmp.Find('-')then REPORT.Run(5210, true, true, HREmp);
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
                        if HRValueChange.Find('-')then REPORT.Run(39003910, true, true, HRValueChange)
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
                        if Confirm('Update Payroll Data?', true) = false then exit;
                        HREmp.Reset;
                        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                        HREmp.SetRange(HREmp."Approval Status", rec."Approval Status"::Approved);
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
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No"=FIELD("No."), "Document Type"=CONST(Employee);
                }
                action("Next of Kin")
                {
                    ApplicationArea = All;
                    Caption = 'Next of Kin';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code"=FIELD("No.");
                    RunPageView = WHERE(Type=FILTER("Next of Kin"));
                }
                action(Beneficiaries)
                {
                    Caption = 'Beneficiaries';
                    Image = Opportunity;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Kin SF";
                    RunPageLink = "Employee Code"=FIELD("No.");
                    RunPageView = WHERE(Type=FILTER(Beneficiary));
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
                    RunPageLink = "Table No."=CONST(39005575), "Type of Change"=FILTER(Modification|Deletion), "Primary Key Field 1 Value"=FIELD("No.");
                }
                action(Qualifications)
                {
                    Caption = 'Qualifications';
                    Image = QualificationOverview;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employee Qualification Line";
                    RunPageLink = "Employee No."=FIELD("No.");
                }
                action("Employment History")
                {
                    Caption = 'Employment History';
                    Image = History;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "HR Employment History Lines";
                    RunPageLink = "Employee No."=FIELD("No.");
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
                    RunPageLink = "Employee No."=FIELD("No.");
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
                    RunPageLink = "Employee No."=FIELD("No.");
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
                    RunPageLink = "Employee No."=FIELD("No.");
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
                    RunPageLink = "Employee No."=FIELD("No.");
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
                    RunPageLink = "Table ID"=CONST(5200), "No."=FIELD("No.");
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
                    RunPageView = WHERE(Score=CONST('3'));
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
                    begin
                        DocType:=DocType::Employee;
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Employees", DocType, rec."No.");
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

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                        GenLedgSetup: Record "General Ledger Setup";
                    //NoSeriesMgt: Codeunit NoSeriesManagement;
                    begin
                        rec.TestField("Department Code");
                        LogLine.Reset;
                        LogLine.SetRange(LogLine."Table Name", LogLine."Table Name"::Employee);
                        LogLine.SetRange(LogLine."No.", rec."No.");
                    ///if PAGE.RunModal(5222, LogLine) = ACTION::LookupOK then 
 
///IF ApprovalMgt.SendEmployeeApprovalRequest(Rec) THEN; RBS DEnnis 
 end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelledEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                    //IF ApprovalMgt.CancelEmployeeAppApprovalReq(Rec,TRUE,TRUE) THEN;
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
                        rec."Approval Status":=rec."Approval Status"::New;
                        rec.Modify;
                        CurrPage.Close;
                    end;
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        rec.CalcFields("Total Leave Taken");
        //"Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
        //SUM UP LEAVE LEDGER ENTRIES
        rec."Leave Balance":=rec."Total (Leave Days)" - rec."Total Leave Taken";
    end;
    trigger OnAfterGetRecord()
    begin
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
        if rec."Approval Status" <> rec."Approval Status"::New then CurrPage.Editable:=false end;
    trigger OnOpenPage()
    begin
        rec.CalcFields("Total Leave Taken");
        //"Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
        //SUM UP LEAVE LEDGER ENTRIES
        rec."Leave Balance":=rec."Total (Leave Days)" - rec."Total Leave Taken";
        if rec."Approval Status" <> rec."Approval Status"::New then CurrPage.Editable:=false end;
    trigger OnQueryClosePage(CloseAction: Action): Boolean begin
        if rec."Global Dimension 2" = '' then rec.FieldError("Global Dimension 2");
        rec.TestField("Department Code");
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
    ApprovalMgt: Integer;
    DocType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", JV, "Payment Voucher", "Petty Cash", Requisition, InterBank, "Staff Claim", "Staff Advance", AdvanceSurrender, Capex, IJ, "Hr Job", "Emp Loan", "Leave Application", "Employee Requisition", "Interview Evaluation", "Training Requisition", Appraisal, HMO, Canteen, EmpTransaction, LeaveAck, PFAMod, PFATransfer, Confirmation, Employee;
    LogLine: Record "Human Resource Comment Line";
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
