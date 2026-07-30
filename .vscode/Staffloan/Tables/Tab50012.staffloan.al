table 50012 "prAssignEmployeeLoan."
{         
    fields
    {
        field(1; "Code"; Code[10])
        {

            trigger OnValidate()
            begin
                if Code <> xRec.Code then begin
                    HRSetup.Get();
                    // NoSeriesMgt.TestManual(HRSetup."Loan Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(7; "Period Month"; Integer)
        {
            Editable = false;
        }
        field(8; "Period Year"; Integer)
        {
            Editable = false;
        }
        field(9; "Payroll Period"; Date)
        {
            TableRelation = "prPayroll Periods"."Date Opened";

            trigger OnValidate()
            begin
                "Period Month" := Date2DMY("Payroll Period", 2);
                "Period Year" := Date2DMY("Payroll Period", 3);
            end;
        }
        field(10; "#of Repayments"; Integer)
        {
            Caption = 'No. of Repayments';
            trigger OnValidate()
            var
                MonthsofRepayment: Text;
            begin
                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments";
                MonthsofRepayment := FORMAT("#of Repayments") + 'M';
                "End Date" := CalcDate(MonthsofRepayment, "Start Date");
            end;
        }
        field(24; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(40; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(65; "Employee Code"; Code[30])
        {
            TableRelation = "HR-Employee Payroll"."No.";

            trigger OnValidate()
            begin
                if HREmp.Get("Employee Code") then
                    "Employee Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name"
                else
                    "Employee Name" := '';
            end;
        }
        field(66; "Transaction Code"; Code[30])
        {
            TableRelation = "prTransaction Codes"."Transaction Code" WHERE("Transaction Category" = FILTER("Company Loan"));

            trigger OnValidate()
            begin
                objPeriod.Reset;
                objPeriod.SetRange(objPeriod.Closed, false);
                if objPeriod.Find('-') then begin
                    CurrentYr := objPeriod."Period Year";
                    CurrentMonth := objPeriod."Period Month";
                end;

                if Transcode2.Get("Transaction Code") then
                    "Transaction Name" := Transcode2."Transaction Name";



                if Transcode.Get("Transaction Code") then begin
                    if Transcode."Leave Allowance" = true then begin
                        EmployeeTrans.Reset;
                        EmployeeTrans.SetRange(EmployeeTrans."Employee Code", "Employee Code");
                        EmployeeTrans.SetRange(EmployeeTrans."Transaction Code", "Transaction Code");
                        if EmployeeTrans.Find('-') then begin
                            repeat
                                if EmployeeTrans."Period Year" = CurrentYr then begin
                                    MonthName := Format(EmployeeTrans."Payroll Period", 0, '<Month Text>');
                                    //ERROR(MonthName);
                                    Error('Employee has already been paid leave allowance in the period of %1.- %2', EmployeeTrans."Payroll Period",
                                           EmployeeTrans."Employee Code");
                                end;
                            until EmployeeTrans.Next = 0;
                        end;
                    end;
                end;
            end;
        }
        field(67; "Transaction Name"; Text[100])
        {
            Editable = false;
        }
        field(68; Amount; Decimal)

        {
            Caption = 'Monthly Deduction';
            Editable = false;
            trigger OnValidate()
            begin
                if (Balance > 0) and (Amount > 0) then
                    "#of Repayments" := Balance / Amount;
            end;
        }
        field(69; Balance; Decimal)
        {

            trigger OnValidate()
            begin
                "#of Repayments" := 0;
                //IF (Balance > 0) AND ("#of Repayments" > 0) THEN
                //Amount:=Balance/"#of Repayments"
            end;
        }
        field(70; "Original Amount"; Decimal)
        {
        }
        field(71; code1; Code[10])
        {
        }
        field(75; Membership; Code[10])
        {
            TableRelation = "prInstitutional Membership"."Institution No";
        }
        field(76; "Reference No"; Text[100])
        {
        }
        field(77; integera; Integer)
        {
        }
        field(78; "Employer Amount"; Decimal)
        {
        }
        field(79; "Employer Balance"; Decimal)
        {
        }
        field(80; "Stop for Next Period"; Boolean)
        {
        }
        field(81; "Amortized Loan Total Repay Amt"; Decimal)
        {
        }
        field(82; "Start Date"; Date)
        {

            trigger OnValidate()
            begin
                "End Date" := "Start Date" + "#of Repayments";
                "Start Date Month" := Date2DMY("Start Date", 2);
                if "Start Date Month" = CurrentMonth then
                    Validate("Payroll Period", objPeriod."Date Opened");
            end;
        }
        field(83; "End Date"; Date)
        {
            Editable = false;
        }
        field(84; "Loan Number"; Code[10])
        {
        }
        field(85; "Payroll Code"; Code[20])
        {
            TableRelation = "prPayroll Type";
        }
        field(86; "No of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                if Transcode.Get("Transaction Code") then begin
                    if (Transcode."Transaction Category" = Transcode."Transaction Category"::Overtime) or
                       (Transcode."Transaction Category" = Transcode."Transaction Category"::Entertainment) then begin
                        Amount := 0;
                        Transcode.TestField(Transcode."Overtime Type");
                        if SalCard.Get("Employee Code") then begin
                            if SalaryNotches.Get(SalCard."Salary Grade", SalCard."Salary Notch") then begin
                                if Transcode."Overtime Type" = Transcode."Overtime Type"::"Double OT" then
                                    Amount := SalaryNotches."Hourly Rate" * 2 * "No of Units"
                                else
                                    if Transcode."Overtime Type" = Transcode."Overtime Type"::"Triple OT" then
                                        Amount := SalaryNotches."Hourly Rate" * 3 * "No of Units"
                                    else
                                        Amount := SalaryNotches."Hourly Rate" * 1.5 * "No of Units";

                            end;
                        end;
                    end;
                end;
            end;
        }
        field(87; Suspended; Boolean)
        {
        }
        field(90; "IsCoop/LnRep"; Boolean)
        {
            CalcFormula = Lookup("prTransaction Codes"."IsCoop/LnRep" WHERE("Transaction Code" = FIELD("Transaction Code")));
            Description = 'to be able to report the different coop contributions -Dennis';
            FieldClass = FlowField;
        }
        field(101; Status; Option)
        {

            Editable = false;
            OptionCaption = 'Pending,Pending Approval,Approved,Active,Cancelled';
            OptionMembers = Pending,"Pending Approval",Approved,Active,Cancelled;
        }
        field(102; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(103; "Start Date Month"; Integer)
        {
        }
        field(323; "Payroll Type"; Option)
        {
            CalcFormula = Lookup("HR-Employee Payroll"."Payroll Type" WHERE("No." = FIELD("Employee Code")));
            FieldClass = FlowField;
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
        field(324; "Journal Batch"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = CONST('GENERAL'));
        }
        field(325; "Accounts Type"; Code[10])
        {
        }
        field(326; "Loan Posting Date"; Date)
        {
        }
        field(327; "Vocher No. For the Loan"; Code[10])
        {
        }
        field(328; "Counter Acc. Type"; Option)
        {
            OptionCaption = 'Finance,Staff,Supplier,Bank';
            OptionMembers = Finance,Staff,Supplier,Bank;
        }
        field(329; "Counter Acc. No."; Code[10])
        {
        }
        field(330; "Repayment Interval"; Option)
        {
            OptionCaption = 'Monthly,Quaterly,Annually,BI-Annually';
            OptionMembers = Monthly,Quaterly,Annually,"BI-Annually";
        }
        field(331; "Remaining Amount"; Decimal)
        {
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Customer No." = FIELD("Customer No."),
                                                                                 "Loan ID" = FIELD(Code)));
            FieldClass = FlowField;
        }
        field(332; "Loan Paid Up"; Decimal)
        {
        }
        field(333; "Next Repayment Period"; Code[10])
        {
        }
        field(334; "Open (Y/N)"; Boolean)
        {

            trigger OnValidate()
            begin

                TestField("Suspended (Y/N)", false);
            end;
        }
        field(335; "Suspended (Y/N)"; Boolean)
        {

            trigger OnValidate()
            begin

                TestField("Open (Y/N)", false);
            end;
        }
        field(336; "Cummulative Deduction"; Decimal)
        {
            Description = 'Ledger entries of the customer';
        }
        field(337; "Cumulative Remaining Balance"; Decimal)
        {
            Description = 'Ledger entries of the customer';

            trigger OnValidate()
            begin

                CalcFields("Cummulative Deduction");
                "Cumulative Remaining Balance" := Amount - "Cummulative Deduction";
                Modify;
            end;
        }
        field(338; "Customer No."; Code[10])
        {
            TableRelation = Customer WHERE("Customer Posting Group" = FILTER('STAFF*'));
        }
        field(339; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(340; "Paying Bank Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Stores the name of the paying bank account in the database';
            TableRelation = "Bank Account"."No." WHERE(Blocked = FILTER(false));

            trigger OnValidate()
            begin
                BankAcc.Reset;
                "Bank Name" := '';
                if BankAcc.Get("Paying Bank Account") then begin
                    "Bank Name" := BankAcc.Name;
                    // "Currency Code":=BankAcc."Currency Code";   //Currency Being determined first before document is released for approval
                    // VALIDATE("Currency Code");
                end;
            end;
        }
        field(341; "Pay Mode"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Cash,Cheque,EFT,"Letter of Credit","Custom 3","Custom 4","Custom 5";
        }
        field(342; "Payment Release Date"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin

                //Changed to ensure Release date is not less than the Date entered
                /*IF "Payment Release Date"<Date THEN
                   ERROR('The Payment Release Date cannot be lesser than the Document Date');*/

            end;
        }
        field(343; "Bank Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(344; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal."Global Dimension No.", 1);
                DimVal.SetRange(DimVal.Code, "Global Dimension 1 Code");
                if DimVal.Find('-') then
                    "Function Name" := DimVal.Name;


                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(345; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            DataClassification = ToBeClassified;
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2),
                                                          "Dimension Value Type" = CONST(Standard));

            trigger OnValidate()
            begin
                DimVal.Reset;
                DimVal.SetRange(DimVal."Global Dimension No.", 2);
                DimVal.SetRange(DimVal.Code, "Shortcut Dimension 2 Code");
                if DimVal.Find('-') then
                    "Budget Center Name" := DimVal.Name;


                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }

        field(346; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            DataClassification = ToBeClassified;
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                /*DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 3 Code");
                 IF DimVal.FIND('-') THEN
                    Dim3:=DimVal.Name ;*/

            end;
        }
        field(347; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            DataClassification = ToBeClassified;
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                /*DimVal.RESET;
                //DimVal.SETRANGE(DimVal."Global Dimension No.",2);
                DimVal.SETRANGE(DimVal.Code,"Shortcut Dimension 4 Code");
                 IF DimVal.FIND('-') THEN
                    Dim4:=DimVal.Name;*/

            end;
        }
        field(348; "Budget Center Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(349; "Function Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Stores the name of the function in the database';
        }
        field(350; Cashier; Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Stores the identifier of the cashier in the database';

            trigger OnValidate()
            begin
                /*
                 UserDept.RESET;
                UserDept.SETRANGE(UserDept.UserID,Cashier);
                IF UserDept.FIND('-') THEN
                  //"Global Dimension 1 Code":=UserDept.Department;
                */

            end;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                // ShowDimensions
            end;
        }
        field(481; "PV No."; Code[20])
        {
            CalcFormula = Lookup("Payments Header"."No." WHERE("External Doc No." = FIELD(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(482; "Payment Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Normal,"Petty Cash",Express;
        }
        field(483; "Assigned User ID"; Code[70])
        {
            DataClassification = ToBeClassified;
            TableRelation = "user setup";
        }
        field(484; "User ID"; Code[70])
        {
            DataClassification = ToBeClassified;
        }
        field(485; "User Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(486; "Guarantor1 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR-Employee Payroll";

            trigger OnValidate()

            begin
                if HREmp.Get("Guarantor1 Code") then
                    "Guarantor1 Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name"
                else
                    "Guarantor1 Name" := '';
            end;
        }
        field(487; "Guarantor1 Name"; Code[70])
        {
            Editable = false;
        }

        field(488; "Guarantor2 Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR-Employee Payroll";

            trigger OnValidate()

            begin
                if HREmp.Get("Guarantor2 Code") then
                    "Guarantor2 Name" := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name"
                else
                    "Guarantor2 Name" := '';
            end;
        }
        field(489; "Guarantor2 Name"; Code[70])
        {
            Editable = false;
        }
        field(490; Archive; Boolean)
        {
            trigger OnValidate()
            begin

                if Rec.Archive then begin
                    rec.CalcFields("Remaining Amount");
                    if ("Remaining Amount" = 0) then
                        Rec.Archive := true

                    else
                        Error('The remaining balance must be 0');

                end;
            end;
        }
    }



    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
            HRSetup.Get;
            HRSetup.TestField("Loan Nos");
            if NoSeriesMgt.AreRelated(HRSetup."Loan Nos", xRec."No. Series") then
                "No. Series" := xRec."No. Series"
            else
                "No. Series" := HRSetup."Loan Nos";
            code := NoSeriesMgt.GetNextNo("No. Series", WorkDate());

        end;


        Cashier := UserId;
        Validate(Cashier);
    end;

    trigger OnModify()
    begin
        if Status = Status::Active then Error('This loan has already been processed for this employee');
    end;

    var
        Transcode: Record "prTransaction Codes";
        Transcode2: Record "prTransaction Codes";
        EmployeeTrans: Record "prEmployee Transactions";
        MonthName: Text[100];
        SalCard: Record "prSalary Card";
        SalaryNotches: Record "Salary Notch";
        CurrentYr: Integer;
        objPeriod: Record "prPayroll Periods";
        HREmp: Record "HR-Employee Payroll";
        CurrentMonth: Integer;
        NoSeriesMgt: Codeunit "No. Series";
        HRSetup: Record "HR Setup";
        BankAcc: Record "Bank Account";
        DimVal: Record "Dimension Value";
    // DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        // DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;


    // procedure ShowDimensions()
    // begin
    //     "Dimension Set ID" :=
    //       DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', 'Staff Loan', Code));
    //     //VerifyItemLineDim;
    //     DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Global Dimension 1 Code", "Shortcut Dimension 2 Code");
    // end;
}

