page 51536 Rent2
{
    ApplicationArea = All;
    Caption = 'Rent';
    PageType = List;
    SourceTable = Rent;
    UsageCategory = Lists;
    CardPageId = Rent;
    //Code by Ifeanyi Ayodeji

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rent Code field.';
                    Editable = false;
                    Caption = 'Rent Code';

                }
                field("Property Address"; Rec."Property Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Property Address field.';
                }
                field("Contact's Name"; Rec."Contact's Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact''s Name field.';
                }
                field("Contact Phone No."; Rec."Contact Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Phone No. field.';
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact Email field.';
                }
                field("Size(Sqm)"; Rec."Size(Sqm)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Size(Sqm) field.';
                    trigger OnValidate()

                    var
                        RentCal: Record Rent;
                        YearlyRent: Decimal;
                    begin
                        YearlyRent := Rec."Rate Per Sqm" * Rec."Size(Sqm)";
                        Rec."Amount Per Year" := YearlyRent;
                    end;
                }
                field("Rate Per Sqm"; Rec."Rate Per Sqm")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Rate Per Sqm field.';

                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Amount Per Year"; Rec."Amount Per Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Per Year field.';
                    Editable = false;
                }
                field("Monthly Amount"; Rec."Monthly Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Monthly Amount field.';
                    Editable = False;
                }



                // NoSeriesMgt: Codeunit NoSeriesManagement;

            }
        }
    }

}

