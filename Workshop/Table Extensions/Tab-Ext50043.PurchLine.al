tableextension 50043 "PurchLine " extends "Purchase Line"
{

    fields
    {
        // Add changes to table fields here
        field(50001; "Expense No."; code[20])
        {
            TableRelation = "Receipts and Payment Types".Code where(type = Const(Requisition), Blocked = CONST(false));
        }
        field(50002; "Direct Unit Cost Buffer"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Expiry Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50004; "Property Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50005; "Property Name"; Code[90])
        {
            DataClassification = ToBeClassified;
        }
        field(50006; "PRF No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50007; Committed; boolean)
        {
            Caption = 'Committed';
            //Editable = false;
        }
        field(50008; "RFQ No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50009; Status; Enum "Purchase Document Status")
        {
            Caption = 'Status';
            Editable = false;
            fieldClass = FlowField;
            CalcFormula = lookup("Purchase Header".Status where("No." = field("Document No.")));
        }
        field(50010; "Purchase Type"; Enum "Purchase Type")
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Header"."Purchase Type" where("No." = field("Document No.")));
        }
        field(50011; Copied; Boolean)
        {

        }

        field(60002; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                TestStatusOpen();
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
                //UpdatePurchaseLines(FIELDNO("Shortcut Dimension 3 Code"));
            end;
        }
        field(60003; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                TestStatusOpen();
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;
        }
        field(60004; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                TestStatusOpen();
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;
        }
        field(60005; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                TestStatusOpen();
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;
        }
        field(60006; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(7, "Shortcut Dimension 7 Code");
                TestStatusOpen();
            end;
        }
        field(60007; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            Caption = 'Shortcut Dimension 8 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Shortcut Dimension 8 Code");
                TestStatusOpen();
            end;
        }
        field(60008; "Withholding Tax Group Code"; Code[20])
        {
            TableRelation = "WithHold Tax";
            caption = 'With-Holding Tax Group Code';

            trigger onValidate()
            var
                WHTTable: Record "WithHold Tax";
            begin
                if WHTTable.Get(Rec."Withholding Tax Group Code") then
                    "WHT %" := WHTTable.percentage else
                    "WHT %" := 0;
                TestStatusOpen();
            end;
        }
        field(60009; "WHT %"; Decimal)
        {
            Caption = 'With-Holding Tax %';

            trigger OnValidate()
            begin
                TestStatusOpen();
            end;
        }
        field(60010; "Quantity in Inventory"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("No."), "Location Code" = FIELD("Location Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60011; "Service Quote No."; Code[50])
        {
            Editable = false;
        }
        field(60012; "Serv. Quote No"; Code[50])
        {
            Editable = false;
            // FieldClass = FlowField;
            // CalcFormula = lookup("Purchase Header"."Job No." where("No." = field("Document No.")));
        }
        field(60013; ServiceQtyNo; Code[50])
        {
            // FieldClass = FlowField;
            // CalcFormula = lookup("Purchase Line"."Serv. Quote No" where("Document No." = field("PRF No.")));
        }
        field(60014; "Import file No."; Code[50])
        {
            TableRelation = Vendor where("Vendor Type" = filter('Import File'));
        }
        modify("No.")
        {
            trigger OnAfterValidate()
            var

            begin
                if PurchHeader.Get("Document Type", "Document No.") then
                    "Serv. Quote No" := PurchHeader."Job No."
                else
                    "Serv. Quote No" := '';
            end;
        }

    }

    trigger Oninsert()
    var
        purchase_header: Record "Purchase Header";
        purchase_line: Record "Purchase Line";

    begin

        if purchase_header.Get(Rec."Document Type", Rec."Document No.") then begin
            Rec."Shortcut Dimension 7 Code" := purchase_header."Shortcut Dimension 7 Code";
            Rec."Shortcut Dimension 6 Code" := purchase_header."Shortcut Dimension 6 Code";
            Rec."Shortcut Dimension 5 Code" := purchase_header."Shortcut Dimension 5 Code";
            Rec."Shortcut Dimension 4 Code" := purchase_header."Shortcut Dimension 4 Code";
            Rec."Shortcut Dimension 3 Code" := purchase_header."Shortcut Dimension 3 Code";
            Rec."Import file No." := purchase_header."Import file No.";
            Rec.validate("Buy-from Vendor No.", purchase_header."Buy-from Vendor No.");
        end;
    end;

    var
        DimMgt: Codeunit DimensionManagement;
        myInt: Integer;
        PurchHeader: Record "Purchase Header";

}
