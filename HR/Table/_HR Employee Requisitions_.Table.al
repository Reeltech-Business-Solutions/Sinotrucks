table 54575 "HR Employee Requisitions"
{
    DrillDownPageID = "HR Employee Requisitions List";
    LookupPageID = "HR Employee Requisitions List";

    fields
    {
        field(2; "Job ID"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Jobs"."Job ID" WHERE(Status = CONST(Approved));

            trigger OnValidate()
            begin
                HRJobs.Reset;
                if HRJobs.Get("Job ID") then "Job Description" := HRJobs."Job Title";
                "Vacant Positions" := HRJobs."Vacant Positions";
                "Job Grade" := HRJobs.Grade;
                "Global Dimension 2 Code" := HRJobs."Global Dimension 2 Code";
                "Job Supervisor/Manager" := HRJobs."Supervisor/Manager";
                "Job Level" := HRJobs."Job Level";
            end;
        }
        field(3; "Requisition Date"; Date)
        {
            trigger OnValidate()
            begin
                if (Rec."Requisition Date" - Today) < 0 then Message('Days in the past are not allowed');
            end;
        }
        field(4; Priority; Option)
        {
            OptionCaption = 'High,Medium,Low';
            OptionMembers = High,Medium,Low;
        }
        field(5; Positions; Integer)
        {
        }
        field(6; Approved; Boolean)
        {
            trigger OnValidate()
            begin
                "Date Approved" := Today;
            end;
        }
        field(7; "Date Approved"; Date)
        {
        }
        field(8; "Job Description"; Text[200])
        {
            Editable = false;
        }
        field(9; Stage; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(10; Score; Decimal)
        {
            Caption = 'Pass Mark for Interview';
            FieldClass = Normal;
        }
        field(11; "Stage Code"; Code[20])
        {
        }
        field(12; Qualified; Boolean)
        {
            FieldClass = Normal;
        }
        field(13; "Job Supervisor/Manager"; Code[10])
        {
            FieldClass = Normal;
        }
        field(14; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(17; "Turn Around Time"; Integer)
        {
            Editable = false;
        }
        field(21; "Grace Period"; Integer)
        {
        }
        field(25; Closed; Boolean)
        {
            Editable = false;
        }
        field(26; "Recruitment Type"; Option)
        {
            OptionCaption = ' ,Internal,External,Both';
            OptionMembers = " ",Internal,External,Both;
        }
        field(27; "Closing Date"; Date)
        {
        }
        field(28; Status; Option)
        {
            Editable = true;
            OptionCaption = 'New,Pending Approval,Approved,Rejected,Advertised';
            OptionMembers = New,"Pending Approval",Approved,Rejected,Advertised;
        }
        field(38; "Required Positions"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                if "Required Positions" > "Vacant Positions" then begin
                    Error('Required positions exceed the total  no of Vacant Positions');
                end;
                if "Required Positions" <= 0 then begin
                    Error('Required positions cannot be Less Than or Equal to Zero');
                end;
            end;
        }
        field(39; "Vacant Positions"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(3949; "Reason for Request(Other)"; Text[100])
        {
        }
        field(3950; "Any Additional Information"; Text[100])
        {
        }
        field(3958; "Job Grade"; Text[100])
        {
            Editable = false;
            TableRelation = "HR Lookup Values".Code WHERE(Type = CONST(Grade));
        }
        field(3964; "Type of Contract Required"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code WHERE(Type = FILTER("Contract Type"));
        }
        field(3965; "Reason For Request"; Option)
        {
            OptionMembers = "New Vacancy",Replacement,Retirement,Retrenchment,Demise,Other;
        }
        field(3966; Requestor; Code[50])
        {
            Editable = false;
        }
        field(3967; "No. Series"; Code[10])
        {
        }
        field(3968; "Requisition No."; Code[20])
        {
            trigger OnValidate()
            begin
                // if "Requisition No." <> xRec."Requisition No." then begin
                //     HRSetup.Get;
                //     NoSeriesMgt.TestManual(HRSetup."Employee Requisition Nos.");
                //     "No. Series" := '';
                // end;

                if "Requisition No." < xRec."Requisition No." then
                    if not Rec.Get("Requisition No.") then begin
                        HRSetup.Get();
                        NseriesMGT.TestManual(HRSetup."Employee Requisition Nos.");
                        "No. Series" := '';
                    end;
            end;
        }
        field(3969; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center BR";
        }
        field(3970; "Job Level"; Code[30])
        {
        }
        field(3971; "Experience Level"; Option)
        {
            OptionCaption = ' ,0-4 Years,5 Years & Above';
            OptionMembers = " ","0-4 Years","5 Years & Above";
        }
        field(3972; Advertise; Boolean)
        {
        }
        field(3973; "Pass Mark for Test"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
    }
    keys
    {
        key(Key1; "Requisition No.", "Job ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Job ID", "Job Description")
        {
        }
    }
    trigger OnDelete()
    begin
        if Status <> Status::New then Error('You cannot delete this record if its status is' + ' ' + Format(Status));
    end;

    trigger OnInsert()
    begin
        //GENERATE DOCUMENT NUMBER
        // if "Requisition No." = '' then begin
        //     HRSetup.Get;
        //     HRSetup.TestField(HRSetup."Employee Requisition Nos.");
        //     NoSeriesMgt.InitSeries(HRSetup."Employee Requisition Nos.", xRec."No. Series", 0D, "Requisition No.", "No. Series");
        // end;

        if "Requisition No." = '' then begin
            HRSetup.Get();
            HRSetup.TestField("Employee Requisition Nos.");
            "No. Series" := HRSetup."Employee Requisition Nos.";
            if NseriesMGT.AreRelated(HRSetup."Employee Requisition Nos.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "Requisition No." := NseriesMGT.GetNextNo("No. Series");
        end;

        //POPULATE FIELDS
        Requestor := UserId;
        "Requisition Date" := Today;
    end;

    var
        HRSetup: Record "HR Setup";
        //  NoSeriesMgt: Codeunit NoSeriesManagement;
        HRJobs: Record "HR Jobs";
        HREmployeeReq: Record "HR Employee Requisitions";
        HRJobEval: Record "HR Job Evaluation Areas";
        NseriesMGT: Codeunit "No. Series";

    procedure CheckHREmpReqLines(): Boolean
    begin
        HRJobEval.Reset;
        HRJobEval.SetRange("Requisition No.", "Requisition No.");
        exit(not HRJobEval.IsEmpty);
    end;
}
