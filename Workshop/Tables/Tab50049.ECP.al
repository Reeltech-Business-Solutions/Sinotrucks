table 50049 "ECPHeader"
{
    Caption = 'ECP';
    DataClassification = ToBeClassified;
    LookupPageId = "ECP List";

    fields
    {
        field(1; "Doc. No."; Code[20])
        {
            Editable = false;

            trigger OnValidate()
            var

                GLSetup: Record "General Ledger Setup";
            begin
                if "Doc. No." < xRec."Doc. No." then
                    if not rec.Get(rec."Doc. No.") then begin
                        JobSetup.Get();
                        NoSeriesMgt.TestManual(JobSetup."ECP No.");
                        "No. Series" := '';
                    end;
            end;
        }
        field(2; "J/C No."; Code[20])
        {
            Caption = 'J/C No.';
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'T-No.';
            DataClassification = ToBeClassified;
        }
        field(5; "5th Wheel Serial No."; Code[20])
        {
            Caption = '5th Wheel Serial No.';
            DataClassification = ToBeClassified;
        }
        field(6; Brand; Text[50])
        {
            Caption = 'Brand';
            DataClassification = ToBeClassified;
        }
        field(7; Image; Blob)
        {
            Caption = 'Image';
            SubType = Bitmap;
        }
        field(8; "Description Of Part(Image)"; Blob)
        {
            Caption = 'Description Of Part(Image)';
            SubType = Bitmap;
        }
        field(9; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10; "Wear Limits"; Blob)
        {

        }
        field(11; "Comments"; Text[250])
        {
            Caption = 'Comments';

        }
        field(12; "Driver's Name"; Code[50])
        {
            //  TableRelation = Employee where(Driver = const(true));
        }
        field(13; "Staff No"; Text[50])
        {
            // TableRelation = Employee;
        }
        field(14; "Odometer"; Decimal)
        {

        }
        field(15; "Time In"; Time)
        {

        }
        field(16; "Work Order No"; Text[50])
        {

        }
        field(17; "Contract"; Text[50])
        {

        }
        field(18; "Vehicle Registration No."; Code[50])
        {
            Editable = false;
        }
        field(19; "DriverName"; Text[50])
        {

        }
        field(20; "VSI Name"; Text[50])
        {

        }
        field(21; VIN; Code[50])
        {

        }
        field(22; "Inspected By"; code[30])
        {
            TableRelation = Employee;
        }
        field(23; "InspectedbyName"; Text[100])
        {
            Editable = false;
        }


    }
    keys
    {
        key(PK; "Doc. No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        // if "Doc. No." = '' then begin
        //     JobSetup.Get();
        //     JobSetup.TestField("ECP No.");
        //     "No. Series" := JobSetup."ECP No.";
        //     if NoSeriesMgt.AreRelated(JobSetup."ECP No.", xRec."No. Series") then
        //         "No. Series" := xRec."No. Series";
        //     "Doc. No." := NoSeriesMgt.GetNextNo("No. Series");

        ECPCheckList();
        // end;

    end;




    // [Scope('Cloud')


    // procedure AssistEdit(OldECP: Record "ECP Header"): Boolean
    // begin
    //     // with ECP do begin
    //     ECP := Rec;
    //     GLSetup.Get();
    //     GLSetup.TestField("ECP No.");
    //     if NoSeriesMgt.SelectSeries(GLSetup."ECP No.", OldECP."No. Series", "No. Series") then begin
    //         NoSeriesMgt.SetSeries("Doc. No.");
    //         Rec := ECP;
    //         exit(true);
    //     end;

    // end;

    var
        GLSetup: Record "General Ledger Setup";
        NoSeriesMgt: codeunit "No. Series";
        ECP: Record "ECPHeader";
        JobSetup: Record "Jobs Setup";
        LineCounter: Integer;
        NextLineNo: Integer;
        ECPLine: Record "ECPLine";

    procedure ECPCheckList()
    var

    begin
        if rec."Doc. No." <> '' then begin
            LineCounter := 1;
            NextLineNo := 1000;

            ECPLine.Reset();
            ECPLine.SetRange("Document No.", "Doc. No.");
            if not ECPLine.FindFirst() then begin
                for LineCounter := 1 to 36 do begin
                    ECPLine.Init();
                    ECPLine."Document No." := "Doc. No.";
                    ECPLine."Line No." += NextLineNo;
                    case LineCounter of
                        1:
                            begin
                                ECPLine.Description := 'CHECK FOR OIL LEAKAGES';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;

                            end;
                        2:
                            begin
                                ECPLine.Description := 'CHECK/REPLACE ENGINE OIL';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        3:
                            begin
                                ECPLine.Description := 'REPLACE FUEL FILTER';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        4:
                            begin
                                ECPLine.Description := 'REPLACE SECURITY FILTER';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        5:
                            begin
                                ECPLine.Description := 'CHECK/REPLACE OIL FILTERS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        6:
                            begin
                                ECPLine.Description := 'CHECK/REPLACE DIFFERENTIAL OIL';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        7:
                            begin
                                ECPLine.Description := 'CHECK/REPLACE TRANSMISSION OIL';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        8:
                            begin
                                ECPLine.Description := 'CHECK COOLANT LEVEL';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        9:
                            begin
                                ECPLine.Description := 'CHECK ATF LEVEL';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;


                        10:
                            begin
                                ECPLine.Description := 'CHECK BRAKE FLUID LEVEL';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        11:
                            begin
                                ECPLine.Description := 'CHECK ALL WHEEL AND BOLTS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        12:
                            begin
                                ECPLine.Description := 'CHECK LIGHTING SYSTEM';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        13:
                            begin
                                ECPLine.Description := 'CHECK ENGINE WIRING AND SENSORS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        14:
                            begin
                                ECPLine.Description := 'CHECK FOR BATTERY TERMINAL CONDITION';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        15:
                            begin
                                ECPLine.Description := 'CHECK/REPLACE AIR CLEANER';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        16:
                            begin
                                ECPLine.Description := 'CHECK ALL VALVES';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        17:
                            begin
                                ECPLine.Description := 'CHECK AND TIGHT WINDSCREEN WIPER';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        18:
                            begin
                                ECPLine.Description := 'CHECK INSTRUMENT CLUSTER';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        19:
                            begin
                                ECPLine.Description := 'CHECK STEERING ALIGNMENT';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        20:
                            begin
                                ECPLine.Description := 'CHECK ALL CAB SEATING BOLTS AND NUTS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        21:
                            begin
                                ECPLine.Description := 'CHECK PROPELLER BOLTS AND NUTS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        22:
                            begin
                                ECPLine.Description := 'CHECK SUSPENSION SYSTEM';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        23:
                            begin
                                ECPLine.Description := 'CHECK/ADJUST BRAKE CLEARANCE';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        24:
                            begin
                                ECPLine.Description := 'CHECK AND DRAIN AIR RESERVOIR';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        25:
                            begin
                                ECPLine.Description := 'CHECK ALL TYRES';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        26:
                            begin
                                ECPLine.Description := 'CHECK FOR AIR LEAKAGES';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        27:
                            begin
                                ECPLine.Description := 'CHECK THE CONDITION OF BRAKE LININGS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        28:
                            begin
                                ECPLine.Description := 'CHECK AND APPLY LUBRICANT AS NEEDED';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        29:
                            begin
                                ECPLine.Description := 'CHECK A/C SYSTEM';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        30:
                            begin
                                ECPLine.Description := 'INSPECT LANDING GEARS';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        31:
                            begin
                                ECPLine.Description := 'CHECK TURN TABLE CONDITION FOR LUBRICATION';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        32:
                            begin
                                ECPLine.Description := 'CHECK WHEEL BEARING AND HUB COVER';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        33:
                            begin
                                ECPLine.Description := 'CHECK UPPER CYLINDER FOR LEAKAGES';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        34:
                            begin
                                ECPLine.Description := 'CHECK INJECTION SEATINGS AND BOLT';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        35:
                            begin
                                ECPLine.Description := 'CHECK FUEL PUMP PRESSURE';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        36:
                            begin
                                ECPLine.Description := 'CHECK FOR OTHER ACCESSORIES';
                                ECPLine.Good := true;
                                ECPLine."SA/Tech Sign" := UserId;
                            end;
                        else
                            ECPLine.Description := '';
                    end;
                    ECPLine.Insert();
                end;
            end;
        end;
    end;

}
