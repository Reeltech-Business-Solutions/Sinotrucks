pageextension 50022 General_ledgerEntriesExt extends "General Ledger Entries"
{
    layout
    {
        addafter("Global Dimension 1 Code")
        {
            field("1Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = All;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        CASE Rec."Source Type" OF
            0:
                SourceName := '';
            1:
                IF CustRec.GET(Rec."Source No.") THEN BEGIN
                    SourceName := CustRec.Name;

                END ELSE BEGIN
                    SourceName := '';

                END;

            2:
                IF VendRec.GET(Rec."Source No.") THEN BEGIN
                    SourceName := VendRec.Name;

                END ELSE BEGIN
                    SourceName := '';

                END;

            3:
                IF BankRec.GET(Rec."Source No.") THEN BEGIN
                    SourceName := BankRec.Name;

                END ELSE BEGIN
                    SourceName := '';

                END;

            4:
                IF FARec.GET(rec."Source No.") THEN BEGIN
                    SourceName := FARec.Description;

                END ELSE BEGIN
                    SourceName := '';

                END;
        END;
    end;

    var
        SourceName: Text[100];
        CustRec: Record Customer;
        VendRec: Record Vendor;
        BankRec: Record "Bank Account";
        FARec: Record "Fixed Asset";
        
}

