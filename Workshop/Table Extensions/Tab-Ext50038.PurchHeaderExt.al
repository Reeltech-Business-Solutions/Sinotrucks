tableextension 50038 PurchHeaderExt extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50002; "Vendor Type"; Option)
        {
            Caption = 'Vendor Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Foreign","Local","Cash","Import";
            OptionCaption = ' ,Foreign Vendor,Local Vendor,Cash Vendor,Import Vendor';
        }

        field(50003; "PWN_Vendor No"; Code[20])
        {
            Caption = 'Vendor No';
            TableRelation =
            IF ("Vendor Type" = FILTER("Import")) Vendor."No." WHERE("Vendor Type" = CONST("Import File")) ELSE
            IF ("Vendor Type" = FILTER(Foreign)) Vendor."No." WHERE("Vendor Type" = CONST("Foreign"))
            else
            IF ("Vendor Type" = FILTER("Foreign")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign))
            ELSE
            IF ("Vendor Type" = FILTER("Local")) Vendor."No." WHERE("Vendor Type" = CONST("Local"))
            else
            IF ("Vendor Type" = filter("Local")) Vendor."No." WHERE("Vendor Type" = const("Local"));

            // IF ("Purchase Type" = FILTER("Import Charge")) Vendor."No." WHERE("Vendor Type" = CONST("Import File")) ELSE
            // IF ("Purchase Type" = FILTER(Foreign)) Vendor."No." WHERE("Vendor Type" = CONST("Foreign"))
            // else
            // IF ("Purchase Type" = FILTER("Foreign Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign))
            // ELSE
            // IF ("Purchase Type" = FILTER("Local Requisition")) Vendor."No." WHERE("Vendor Type" = CONST("Local"))
            // else
            // IF ("Purchase Type" = const("Local")) Vendor."No." WHERE("Vendor Type" = const("Local"));

            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Buy-from Vendor No." := "PWN_Vendor No";
                Validate("Buy-from Vendor No.");
            end;

            // modify("Buy-from Vendor No.")
            // {
            //     TableRelation = if ("Vendor Type" = filter(Foreign | Local | "Cash Vendor" | Import)) Vendor where("Vendor Type" = field("Vendor Type"));
            // }
        }
        field(50007; "Requisition No."; Code[20])
        {
            Caption = 'Requisition No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                //UpdatePurchaseLines(FIELDNO("Requisition No."));
            end;
        }
        field(50008; "PWN2_Vendor No"; Code[20])
        {
            Caption = 'Vendor No2';
            TableRelation = Vendor;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //"Vendor Order No." :=
            end;
        }
        field(50009; RequisionEdit; Boolean)
        {
            Caption = 'RequisitionEditable';
        }
        field(50010; "Request Type"; Option)
        {
            Caption = 'Request Type';
            DataClassification = ToBeClassified;
            OptionMembers = "",Requisition;
            OptionCaption = ',Requisition';
        }
        field(50011; "Purchase Type"; Enum "Purchase Type")
        {
            trigger OnValidate()
            begin
                //UpdatePurchaseLines(FIELDNO("Purchase Type"));
            end;
        }
        field(50012; Description; Text[150])
        {
            Caption = 'Description';
        }
        field(50013; VendorNoFilter; Code[20])
        {
            Caption = 'Vendor No';
            //TableRelation = Vendor."No.";

            TableRelation = IF ("Purchase Type" = FILTER("Import Charge")) Vendor."No." WHERE("Vendor Type" = CONST(Import)) else
            IF ("Purchase Type" = FILTER(Foreign | "Foreign Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Foreign)) else
            IF ("Purchase Type" = FILTER(Local | "Local Requisition")) Vendor."No." WHERE("Vendor Type" = CONST(Local)) else
            IF ("Purchase Type" = FILTER(Cash)) Vendor."No." WHERE("Vendor Type" = CONST(Cash));
            //Foreign,Local,"Cash Vendor",Import

            trigger OnValidate()
            begin
                //"Buy-from Vendor No." := VendorNoFilter;
                //Validate("Buy-from Vendor No.");
            end;
        }

        field(50014; "Approval Code"; Code[20])
        {
            Caption = 'Approval Code';
            //to    TableRelation = "Approval Code";
            DataClassification = ToBeClassified;
        }
        field(50015; "Responsibility CenterRBS"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(50019; "Material Req. No."; Code[20])
        {
            Caption = 'Material Req. No.';
            Editable = false;

        }


        field(50016; "RFQ No."; Code[20])
        {
            TableRelation = "Quotation Request Vendors"."Document No." where("Vendor No." = field("Buy-from Vendor No."));
            Caption = 'RFQ No.';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                RFQLines: Record "Purchase Quote Line";
                PurchaseLines: Record "Purchase Line";
                PurchaseLines2: Record "Purchase Line";
            begin
                if xRec."RFQ No." <> '' then begin
                    PurchaseLines2.Reset();
                    PurchaseLines2.SetRange("Document Type", Rec."Document Type");
                    PurchaseLines2.SetRange("Document No.", Rec."No.");
                    PurchaseLines2.SetRange("RFQ No.", xRec."RFQ No.");
                    if not PurchaseLines2.IsEmpty then
                        PurchaseLines2.DeleteAll();
                end;

                RFQLines.Init();
                RFQLines.SetRange("Document No.", "RFQ No.");
                IF RFQLines.FIND('-') then begin
                    REPEAT

                        PurchaseLines.INIT;
                        PurchaseLines.TRANSFERFIELDS(RFQLines);
                        PurchaseLines."Document Type" := PurchaseLines."Document Type"::Quote;
                        PurchaseLines."Document No." := "No.";
                        //PurchaseLines."RFQ No." := "RFQ No.";
                        PurchaseLines.Validate("Buy-from Vendor No.", "buy-from Vendor No.");

                        // PurchaseLines.Validate("Buy-from Vendor No.", RFQLines."Buy-from Vendor No.");
                        PurchaseLines.Validate("Shortcut Dimension 1 Code", RFQLines."Shortcut Dimension 1 Code");
                        PurchaseLines.Validate("Shortcut Dimension 2 Code", RFQLines."Shortcut Dimension 2 Code");
                        PurchaseLines.Validate("Shortcut Dimension 3 Code", RFQLines."Shortcut Dimension 3 Code");
                        PurchaseLines.Validate("Shortcut Dimension 4 Code", RFQLines."Shortcut Dimension 4 Code");
                        PurchaseLines.Validate("Shortcut Dimension 5 Code", RFQLines."Shortcut Dimension 5 Code");
                        PurchaseLines.Validate("Shortcut Dimension 6 Code", RFQLines."Shortcut Dimension 6 Code");
                        PurchaseLines.Validate("Shortcut Dimension 7 Code", RFQLines."Shortcut Dimension 7 Code");
                        PurchaseLines.Validate("Shortcut Dimension 8 Code", RFQLines."Shortcut Dimension 8 Code");
                        PurchaseLines."Expense No." := RFQLines."Expense No.";
                        PurchaseLines."PRF No." := RFQLines."PRF No";
                        PurchaseLines."Service Quote No." := RFQLines."Servcie Quote No.";
                        PurchaseLines."RFQ No." := RFQLines."Document No.";
                        PurchaseLines."Purchase Type" := "Purchase Type"::Local;
                        PurchaseLines.INSERT;
                    UNTIL RFQLines.NEXT = 0;
                end;
            end;

        }

        field(60002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //UpdatePurchaseLines(FIELDNO("Shortcut Dimension 3 Code"));
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line.Validate("Shortcut Dimension 3 Code", Rec."Shortcut Dimension 3 Code");
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end


            end;
        }
        field(60003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4), Blocked = CONST(false));
            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 4 Code" := Rec."Shortcut Dimension 4 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 5 Code" := Rec."Shortcut Dimension 5 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60005; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 6 Code" := Rec."Shortcut Dimension 6 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60006; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 7 Code" := Rec."Shortcut Dimension 7 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        field(60007; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Editable = true;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8), Blocked = CONST(false));


            trigger OnValidate()
            var
                purchase_line: Record "Purchase Line";
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
                purchase_line.SetRange("Document Type", Rec."Document Type");
                purchase_line.SetRange("Document No.", Rec."No.");
                if purchase_line.FindSet() then begin
                    repeat
                        purchase_line."Shortcut Dimension 8 Code" := Rec."Shortcut Dimension 8 Code";
                        purchase_line.Modify();
                    until purchase_line.Next() = 0;
                end
            end;
        }
        modify(Status)
        {
            trigger OnAfterValidate()
            begin
                //UpdatePurchaseLines(FIELDNO(Status));
            end;
        }


        field(60008; "Created By"; Text[50])
        {

        }
        field(60009; "created Date"; Date)
        {

        }
        field(60010; "Withholding Tax Group Code"; Code[20])
        {
            TableRelation = "WithHold Tax";
            caption = 'With-Holding Tax Group Code';

            trigger onValidate()
            var
                Confirmed: Boolean;
                Text001: Label 'Do you want to update the %1 on the related lines?';
            begin
                if xRec."Withholding Tax Group Code" <> Rec."Withholding Tax Group Code" then begin
                    If HideValidationDialog or
                      (xRec."Withholding Tax Group Code" = '')
                    then
                        Confirmed := true
                    else
                        Confirmed := Confirm(Text001, false, FieldCaption("Withholding Tax Group Code"));
                    if Confirmed then
                        UpdatePurchaseLines(FieldNo("Withholding Tax Group Code"))
                    else begin
                        "Withholding Tax Group Code" := xRec."Withholding Tax Group Code";
                        exit;
                    end;
                end

            end;

        }
        field(60011; "WHT %"; Decimal)
        {
            Caption = 'With-Holding Tax %';
        }
        field(60012; "Job No."; Code[50])
        {
            TableRelation = "Service Header"."No.";
            //  editable = false;

        }
        field(60013; "Service Qte No."; Code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Service Header"."No." where("Document Type" = const(Quote), "No." = field("Job No.")));
        }
        field(60014; "Service Quote"; Code[50])
        {

        }
        field(60015; "Project No."; code[50])
        {
            TableRelation = Job."No.";
        }
        field(60016; "Import file No."; Code[50])
        {
            TableRelation = Vendor where("Vendor Type" = filter('Import File'));

            trigger OnValidate()
            begin
                UpdatePurchLine(FieldNo("Import file No."));
            end;
        }
        field(60017; "LPO No."; code[30])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Line"."Document No." where("PRF No." = field("No.")));
        }

    }

    trigger OnInsert()
    begin
        "Created By" := UserId;
        "created Date" := Today;

        if UserSet.Get(UserId) then
            "Responsibility Center" := UserSet."Purchase Resp. Ctr. Filter";
    end;



    local procedure UpdatePurchaseLines(FieldRef: Integer)
    var
        PurchaseLine: Record "Purchase Line";

    begin
        PurchaseLine.LockTable;
        PurchaseLine.SetRange("Document No.", "No.");
        PurchaseLine.setRange("No.", vat);
        if not PurchaseLine.FindFirst() then begin
            PurchaseLine.reset();
            PurchaseLine.SetRange("Document No.", "No.");
            PurchaseLine.SetRange("No.", wth);
        end;
        if PurchaseLine.Find('-') then begin
            repeat
                if FieldRef = FieldNo("Withholding Tax Group Code") then begin
                    PurchaseLine.Validate("Withholding Tax Group Code", "Withholding Tax Group Code");
                end;

                PurchaseLine.Modify(true);
            until PurchaseLine.Next = 0;
        end;
    end;

    procedure witholdingTax2()

    var
        PurchLine: Record "Purchase Line";
        PurchLine2: Record "Purchase Line";
        PurchHeader: Record "Purchase Header";
        NewLine: Record "Purchase Line";
        LineNo: Integer;
        TotalBaseAmount: Decimal;
        WHTPercent: Decimal;
        WHTAmount: Decimal;
        BaseLine: Record "Purchase Line";
        WhtResult: Decimal;
        checkWHT: Boolean;
        PurchLine3: Record "Purchase Line";
        PurchLine4: Record "Purchase Line";
        wthAccount: code[20];
        //  percnt: Record percentage;
        percentage: decimal;
        Accessories: code[20];
        BaseLine2: Record "Purchase Line";
        wthTax: Record "WithHold Tax";

    begin

        PurchHeader.Get(Rec."Document Type", Rec."No.");
        // WthTax.Reset();
        // if wthTax.Find('-') then begin
        if wthTax.Get("Withholding Tax Group Code") then begin
            wthAccount := wthTax."WHT Account";

        end;
        PurchLine.Reset();
        PurchLine.SetRange("Document Type", PurchHeader."Document Type");
        PurchLine.SetRange("Document No.", PurchHeader."No.");
        PurchLine.SetRange(Type, PurchLine.Type::"G/L Account");
        PurchLine.SetRange("No.", wthAccount);

        if PurchLine.FindFirst() then
            PurchLine.Delete;
        BaseLine2.Reset();
        BaseLine2.SetRange("Document Type", PurchHeader."Document Type");
        BaseLine2.SetRange("Document No.", PurchHeader."No.");
        if BaseLine2.FindSet() then
            repeat  
                if BaseLine2.Type <> BaseLine2.Type::" " then
                    TotalBaseAmount += BaseLine2.Amount;
            until BaseLine2.Next() = 0;

        PurchLine3.Reset();
        PurchLine3.SetRange("Document Type", PurchHeader."Document Type");
        PurchLine3.SetRange("Document No.", PurchHeader."No.");
        if PurchLine3.FindLast() then
            LineNo := PurchLine3."Line No." + 10000
        else
            LineNo := PurchLine3."Line No.";


        PurchLine2.Reset();
        PurchLine2.setRange("Document Type", PurchHeader."Document Type");
        PurchLine2.setRange("Document No.", PurchHeader."No.");
        PurchLine2.setRange("No.", wthAccount);

        if PurchLine2.findset() then begin
            checkWHT := false;

            repeat
                if PurchLine2."Withholding Tax Group Code" <> '' then
                    checkWHT := true;

            //   WhtResult += PurchLine2."Withholding Tax %" * 0.01 * (PurchLine2.Quantity * PurchLine2."Direct Unit Cost");
            until PurchLine2.next() = 0;
            if not checkWHT then
                Error('Kindly select with-Holding tax group code');


        end;

        PurchLine3.Reset();
        PurchLine3.init();
        PurchLine3.validate("Document Type", rec."Document Type");
        PurchLine3.Validate("Document No.", rec."No.");
        PurchLine3."Line No." := LineNo;
        PurchLine3.validate(Type, NewLine.Type::"G/L Account");
        PurchLine3.Validate("No.", wthAccount); // WHT G/L Account
        PurchLine3.Description := 'Withholding Tax for ' + Rec."No.";
        PurchLine3.Validate("WHT %", PurchHeader."WHT %");
        PurchLine3.Validate(Quantity, -1);
        //PurchLine."Qty. to Invoice" := 1;
        //PurchLine3."Qty. to Receive" := 1;

        PurchLine3.Validate("Direct Unit Cost", Round((TotalBaseAmount) * ((PurchLine3."WHT %" / 100)), 0.01));
        Message('With-Holding Tax created successfully.');

        PurchLine3.Validate("VAT Prod. Posting Group", 'NOVAT');
        PurchLine3.Insert(true);
    end;

    procedure wth(): Text
    begin
        if WitholdingTax.Get("Withholding Tax Group Code") then
            exit(WitholdingTax."WHT Account");
    end;

    procedure Vat(): Text
    begin
        if WitholdingTax.Find('-') then
            exit(WitholdingTax."VAT Account");
    end;

    procedure UpdatePurchLine(FieldRef: Integer)
    var
        PurchLine: Record "Purchase Line";
    begin
        PurchLine.LOCKTABLE;
        PurchLine.SETRANGE("Document No.", "No.");
        IF PurchLine.FIND('-') THEN BEGIN
            REPEAT
                if FieldRef = FieldNo("Import file No.") then begin
                    PurchLine.Validate("Import file No.", "Import file No.");
                end;
                PurchLine.Modify(true);
            until PurchLine.Next() = 0;
        end;
    end;

    var
        WitholdingTax: Record "WithHold Tax";
        UserSet: Record "User Setup";
}
