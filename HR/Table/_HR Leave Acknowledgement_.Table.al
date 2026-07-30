table 54652 "HR Leave Acknowledgement"
{
    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = ' No.';
            Editable = False;
            trigger OnValidate()
            var
                purch: Record "Purchases & Payables Setup";
            begin
                if "No." <> xRec."No." then
                    if not rec.Get(rec."No.") then begin
                        purch.Get();
                        NoSeriesMgt.TestManual(purch."Acknowledgement No");
                        "No Series" := '';
                    end;
            end;
        }
        field(2; "Leave No."; Code[20])
        {
            TableRelation = "HR Leave Application"."Application Code" WHERE(Status = CONST(Posted));


            trigger OnValidate()
            Var
                HRLeaveApplication: Record "HR Leave Application";
                HREmp: Record "HR Employees";
            begin
                HRLeaveApplication.Get("Leave No.");
                "Days Applied" := HRLeaveApplication."Approved days";
                "Start Date" := HRLeaveApplication."Start Date";
                "Return Date" := HRLeaveApplication."Return Date";
                "Leave Type" := HRLeaveApplication."Leave Type";
                "Employee No." := HRLeaveApplication."Employee No";
                "Responsibility Center" := HRLeaveApplication."Responsibility Center";
                HREmp.Get("Employee No.");
                "Employee Name" := HREmp."Last Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."First Name";

            end;
        }
        field(3; "Days Applied"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "Return Date"; Date)
        {
        }
        field(6; Status; Option)
        {
            OptionCaption = 'New,Pending Approval,Approved,Updated';
            OptionMembers = Pending,"Pending Approval",Approved,Updated;
        }
        field(7; "Leave Type"; Code[20])
        {
        }
        field(8; "Actual Days Spent"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                // if "Actual Days Spent" > "Days Applied" then Error('Actual Days Spent can not exceed days applied');
            end;
        }
        field(9; "User ID"; Code[50])
        {
        }
        field(65; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(66; "Actual Return Day"; Date)
        {
        }
        field(67; Comment; Text[250])
        {
        }
        field(68; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR";
        }
        field(69; "Employee No."; Code[20])
        {
        }
        field(70; "First Name"; Text[30])
        {
        }
        field(71; "Middle Name"; Text[30])
        {
        }
        field(72; "Last Name"; Text[30])
        {
        }
        field(73; "Employee Name"; Text[100])
        {
        }
        Field(74; "No Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
    // trigger OnInsert()
    // var
    //     NoSeriesMgt: Codeunit "No. Series Management";
    // begin
    //     "User ID":=UserId;
    //     if "No." = '' then begin
    //         HRSetup.Get;
    //         HRSetup.TESTFIELD(HRSetup."Ticket Nos");
    //         NoSeriesMgt.GetSeries(HRSetup."Leave Acknowledgement Nos", "No.", TODAY); // Use TODAY to get the current date
    //     end;
    // end;
    // trigger OnModify()
    // begin
    // // Leave Acknowledgement Nos
    // end;
    // var HRSetup: Record "HR Setup";
    // HREmp: Record "HR Employees";
    trigger OnInsert()
    var
        purch: Record "Purchases & Payables Setup";

    begin
        if "No." = '' then begin
            purch.Get();
            purch.TestField("Acknowledgement No");
            "No Series" := purch."Acknowledgement No";
            if NoSeriesMgt.AreRelated(purch."Acknowledgement No", xRec."No Series") then
                "No Series" := xrec."No Series";
            "No." := NoSeriesMgt.GetNextNo("No Series");
            //   NoSeriesMgt.Initseries(purch."Acknowledgement No", xRec."No.", 0D, "No.", "No Series");

        end;
    end;

    var
        NoSeriesMgt: Codeunit "No. Series";
}
