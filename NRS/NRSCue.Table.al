table 50182 "NRS Cue"
{
    Caption = 'NRS Cue';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "Invoices Pending IRN"; Integer)
        {
            Caption = 'Invoices Pending IRN';
            FieldClass = FlowField;
            CalcFormula = count("Sales Invoice Header" where("NRS IRN Status" = const("Not Generated")));
            Editable = false;
        }
        field(3; "IRN Generated"; Integer)
        {
            Caption = 'IRN Generated';
            FieldClass = FlowField;
            CalcFormula = count("NRS IRN Log" where(Status = const(Generated)));
            Editable = false;
        }
        field(4; "Generated Today"; Integer)
        {
            Caption = 'Generated Today';
            FieldClass = FlowField;
            CalcFormula = count("NRS IRN Log" where(Status = const(Generated), "Generated Date" = field("Date Filter")));
            Editable = false;
        }
        field(5; "Failed IRN"; Integer)
        {
            Caption = 'Failed IRN';
            FieldClass = FlowField;
            CalcFormula = count("NRS IRN Log" where(Status = const(Failed)));
            Editable = false;
        }
        field(6; "Duplicate IRN"; Integer)
        {
            Caption = 'Duplicate IRN';
            FieldClass = FlowField;
            CalcFormula = count("NRS IRN Log" where(Status = const(Duplicate)));
            Editable = false;
        }
        field(7; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
