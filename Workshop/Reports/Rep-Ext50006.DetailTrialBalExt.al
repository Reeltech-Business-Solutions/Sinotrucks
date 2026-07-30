reportextension 50006 DetailTrialBalExt extends "Detail Trial Balance"
{
    dataset
    {
         add("G/L Entry")
        {
            column(Source_No_; "Source No.")
            {

            }
            column(SourceName; SourceName)
            {

            }


        }
        modify("G/L Entry")
        {
            trigger OnAfterAfterGetRecord()
            var
                Customer: Record Customer;

            begin
                case "G/L Entry"."Source Type" of
                    "G/L Entry"."Source Type"::Customer:
                        if Customer.Get("G/L Entry"."Source No.") then
                            SourceName := Customer.Name;

                    "G/L Entry"."Source Type"::Vendor:
                        if Vendor.Get("G/L Entry"."Source No.") then
                            SourceName := Vendor.Name;

                    "G/L Entry"."Source Type"::"Bank Account":
                        if BankAccount.Get("G/L Entry"."Source No.") then
                            SourceName := BankAccount.Name;

                    "G/L Entry"."Source Type"::"Fixed Asset":
                        if FixedAsset.Get("G/L Entry"."Source No.") then
                            SourceName := FixedAsset.Description;

                    "G/L Entry"."Source Type"::Employee:
                        if Employee.Get("G/L Entry"."Source No.") then
                            SourceName := Employee.FullName();


                end;
            end;

        }

    }

    var
        SourceName: Text[150];
        Vendor: Record Vendor;
        Employee: Record Employee;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
}

    

