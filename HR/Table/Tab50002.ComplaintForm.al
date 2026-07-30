table 50002 "Complaint Form"
{
    DrillDownPageID = "Complaint form list page";
    LookupPageID = "Complaint form list page";
    Caption = 'Complaint Form';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Complaint No."; Code[50])
        {
            Caption = 'Complaint No.';
            Editable = False;
            trigger OnValidate()
            var
                purch: Record "Purchases & Payables Setup";
            begin
                // if "Complaint No." <> xRec."Complaint No." then begin
                //     purch.Get();
                //     NoSeriesMgt.TestManual(purch."Complaint No");
                //     "No Series" := '';
                // end;

                if "Complaint No." < xRec."Complaint No." then
                    if not Rec.Get(Rec."Complaint No.") then begin
                        purch.Get();
                        Noseriesmg.TestManual(purch."Complaint No");
                        "No Series" := '';
                    end;
            end;
        }

        field(2; "Employee No"; Code[50])
        {
            Caption = 'Employee No.';
            TableRelation = "HR Employees";
            TRIGGER OnValidate()
            var
                Employee: Record "HR Employees";
            begin
                if employee.Get("Employee No") then begin
                    rec."Employee Name" := employee."Full Name";
                    rec."Department code" := employee."Department Code";
                    rec."Job Title" := employee."Job Title";
                    rec."Company Email" := employee."Company E-Mail";
                    rec."Supervisor" := Employee."SupervisorName";
                    rec."Job Description" := employee."Job Description";

                end;


            end;
        }
        field(3; "Department Code"; Code[50])
        {
            Caption = 'Department Code';
            Editable = False;
        }
        field(4; "Company Email"; Text[50])
        {
            Caption = 'Company Email';
            Editable = False;
        }
        field(5; "Employee Name"; Text[50])
        {
            Caption = 'Employee Name';
            Editable = False;
        }
        field(6; "Job Title"; Text[50])
        {
            Caption = 'Job Title';
            Editable = FALSE;
        }
        field(7; "Job Description"; Text[50])
        {
            Caption = 'Job Description';
        }
        field(8; Supervisor; Text[50])
        {
            Caption = 'Supervisor';
            Editable = FAlse;
        }


        field(11; "Complaint Details"; Text[200])
        {
            Caption = 'Complaint Details';
        }
        field(12; "Nature of Complaint"; Text[500])
        {
            Caption = 'Nature of Complaint';
        }
        field(13; "Date of incident"; Date)
        {
            Caption = 'Date of incident';
        }
        field(14; "Description of complaint"; Text[500])
        {
            Caption = 'Description of complaint';
        }
        field(15; "Details of Incident"; Text[500])
        {
            Caption = 'Details of Incident';
        }
        Field(18; "No Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(19; Status; Option)
        {
            OptionMembers = "Open","Closed";
            OptionCaption = 'Open,Closed';
        }
    }
    keys
    {
        key(PK; "Complaint No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        purch: Record "Purchases & Payables Setup";

    begin
        // if "Complaint No." = '' then begin
        //     purch.Get();
        //     purch.TestField("Complaint No");
        //     NoSeriesMgt.Initseries(purch."Complaint No", xRec."No Series", 0D, "Complaint No.", "No Series");

        // end;

        if "Complaint No." = '' then begin
            purch.Get();
            purch.TestField("Complaint No");
            if Noseriesmg.AreRelated(purch."Complaint No", xRec."No Series") then
                "No Series" := xRec."No Series";
            "Complaint No." := Noseriesmg.GetNextNo("No Series");

        end;



    end;

    var
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        Noseriesmg: Codeunit "No. Series";
        NoseriesBatch: Codeunit "No. Series - Batch";

}

