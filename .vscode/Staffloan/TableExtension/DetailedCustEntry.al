tableextension 50091 DetCustLedgEntExt extends "Detailed Cust. Ledg. Entry"
{
    Caption = 'Detailed Cust. Ledg. Entry';
    DataCaptionFields = "Customer No.";
    DrillDownPageID = "Detailed Cust. Ledg. Entries";
    LookupPageID = "Detailed Cust. Ledg. Entries";
    // Permissions = TableData "Detailed Cust. Ledg. Entry" = m;

    fields
    {
        field(50001; "Loan ID"; Code[20])
        {
            //  TableRelation = "prAssignEmployeeLoan.".Code;
        }
        field(50002; "Transaction Code (Loan)"; Code[30])
        {
            TableRelation = "prTransaction Codes"."Transaction Code" WHERE("Transaction Category" = FILTER("Company Loan"));

            trigger OnValidate()
            begin
                /*objPeriod.RESET;
                objPeriod.SETRANGE(objPeriod.Closed,FALSE);
                IF objPeriod.FIND('-') THEN
                BEGIN
                CurrentYr:=objPeriod."Period Year";
                CurrentMonth:=objPeriod."Period Month";
                END;
                
                IF Transcode2.GET("Transaction Code") THEN
                   "Transaction Name":= Transcode2."Transaction Name";
                
                
                
                IF Transcode.GET("Transaction Code") THEN BEGIN
                IF Transcode."Leave Allowance" = TRUE THEN BEGIN
                EmployeeTrans.RESET;
                EmployeeTrans.SETRANGE(EmployeeTrans."Employee Code","Employee Code");
                EmployeeTrans.SETRANGE(EmployeeTrans."Transaction Code","Transaction Code");
                IF EmployeeTrans.FIND('-') THEN BEGIN
                REPEAT
                IF EmployeeTrans."Period Year" = CurrentYr THEN BEGIN
                MonthName:=FORMAT(EmployeeTrans."Payroll Period",0,'<Month Text>');
                //ERROR(MonthName);
                ERROR('Employee has already been paid leave allowance in the period of %1.- %2',EmployeeTrans."Payroll Period",
                       EmployeeTrans."Employee Code");
                END;
                UNTIL EmployeeTrans.NEXT = 0;
                END;
                END;
                END;
                 */

            end;
        }
        field(50003; "Lease ID"; Code[20])
        {
        }
        field(50004; "Transaction Code (Lease)"; Code[30])
        {
        }
        field(50005; "Property Code"; Code[30])
        {
            // TableRelation = Table39005601.Field1;
        }
        field(50006; "Transaction Code"; Code[30])
        {
            TableRelation = "HR E-Mail Parameters"."Associate With";
        }
        field(50007; "Entry Type[Income/expense]"; Option)
        {
            OptionCaption = ' ,Income,Expense';
            OptionMembers = " ",Income,Expense;
        }
        field(50008; "Lease No"; Code[20])
        {
        }
    }

    // keys
    // {
    //     key(Key1; "Entry No.")
    //     {
    //         Clustered = true;
    //     }
    //     key(Key2; "Cust. Ledger Entry No.", "Posting Date")
    //     {
    //     }
    //     key(Key3; "Cust. Ledger Entry No.", "Entry Type", "Posting Date")
    //     {
    //         SumIndexFields = Amount, "Amount (LCY)";
    //     }
    //     key(Key4; "Ledger Entry Amount", "Cust. Ledger Entry No.", "Posting Date")
    //     {
    //         MaintainSQLIndex = false;
    //         SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Debit Amount (LCY)", "Credit Amount", "Credit Amount (LCY)";
    //     }
    //     key(Key5; "Initial Document Type", "Entry Type", "Customer No.", "Currency Code", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Posting Date")
    //     {
    //         SumIndexFields = Amount, "Amount (LCY)";
    //     }
    //     key(Key6; "Customer No.", "Currency Code", "Initial Entry Global Dim. 1", "Initial Entry Global Dim. 2", "Initial Entry Due Date", "Posting Date")
    //     {
    //         SumIndexFields = Amount, "Amount (LCY)";
    //     }
    //     key(Key7; "Document No.", "Document Type", "Posting Date")
    //     {
    //     }
    //     key(Key8; "Applied Cust. Ledger Entry No.", "Entry Type")
    //     {
    //     }
    //     key(Key9; "Transaction No.", "Customer No.", "Entry Type")
    //     {
    //     }
    //     key(Key10; "Application No.", "Customer No.", "Entry Type")
    //     {
    //     }
    //     key(Key11; "Customer No.", "Entry Type", "Posting Date", "Initial Document Type")
    //     {
    //         SumIndexFields = Amount, "Amount (LCY)";
    //     }
    //     key(Key12; "Document Type")
    //     {
    //         SumIndexFields = "Amount (LCY)";
    //     }
    //     key(Key13; "Initial Document Type", "Initial Entry Due Date")
    //     {
    //         SumIndexFields = "Amount (LCY)";
    //     }
    //     key(Key14; "Customer No.", "Initial Entry Due Date")
    //     {
    //         SumIndexFields = "Amount (LCY)";
    //     }
    // }

    // fieldgroups
    // {
    //     fieldgroup(DropDown; "Entry No.", "Cust. Ledger Entry No.", "Customer No.", "Posting Date", "Document Type", "Document No.")
    //     {
    //     }
    // }

    trigger OnInsert()
    begin
        SetLedgerEntryAmount;
    end;

    trigger OnAfterInsert()
    var
        CLE: record "Cust. Ledger Entry";
    begin
        //--------------->> Fola 03052024

        // if CLE.Get(Rec."Cust. Ledger Entry No.") then
        //     if CLE."Loan ID" <> ' ' then begin
        //         Rec."Loan ID" := CLE."Loan ID";
        //         Rec.Modify();
        //     end;

        //--------------->> Fola 03052024
    end;

    // procedure UpdateDebitCredit(Correction: Boolean)
    // begin
    //     if ((Amount > 0) or ("Amount (LCY)" > 0)) and not Correction or
    //        ((Amount < 0) or ("Amount (LCY)" < 0)) and Correction
    //     then begin
    //         "Debit Amount" := Amount;
    //         "Credit Amount" := 0;
    //         "Debit Amount (LCY)" := "Amount (LCY)";
    //         "Credit Amount (LCY)" := 0;
    //     end else begin
    //         "Debit Amount" := 0;
    //         "Credit Amount" := -Amount;
    //         "Debit Amount (LCY)" := 0;
    //         "Credit Amount (LCY)" := -"Amount (LCY)";
    //     end;
    // end;

    // procedure SetZeroTransNo(TransactionNo: Integer)
    // var
    //     DtldCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
    //     ApplicationNo: Integer;
    // begin
    //     DtldCustLedgEntry.SetCurrentKey("Transaction No.");
    //     DtldCustLedgEntry.SetRange("Transaction No.", TransactionNo);
    //     if DtldCustLedgEntry.FindSet(true) then begin
    //         ApplicationNo := DtldCustLedgEntry."Entry No.";
    //         repeat
    //             DtldCustLedgEntry."Transaction No." := 0;
    //             DtldCustLedgEntry."Application No." := ApplicationNo;
    //             DtldCustLedgEntry.Modify;
    //         until DtldCustLedgEntry.Next = 0;
    //     end;
    // end;

    local procedure SetLedgerEntryAmount()
    begin
        "Ledger Entry Amount" :=
          not (("Entry Type" = "Entry Type"::Application) or ("Entry Type" = "Entry Type"::"Appln. Rounding"));
    end;

    // procedure GetUnrealizedGainLossAmount(EntryNo: Integer): Decimal
    // begin
    //     SetCurrentKey("Cust. Ledger Entry No.", "Entry Type");
    //     SetRange("Cust. Ledger Entry No.", EntryNo);
    //     SetRange("Entry Type", "Entry Type"::"Unrealized Loss", "Entry Type"::"Unrealized Gain");
    //     CalcSums("Amount (LCY)");
    //     exit("Amount (LCY)");
    // end;
}

