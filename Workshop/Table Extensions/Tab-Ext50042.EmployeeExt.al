tableextension 50042 "EmployeeExt " extends Employee
{

    fields
    {
        // Add changes to table fields here
        field(50000; "Account Type"; Option)
        {
            Caption = 'Account Type';
            OptionMembers = "Staff Advance","Staff Debtors",Drivers;
            OptionCaption = 'Staff Advance,Staff Debtors,Drivers';
            DataClassification = ToBeClassified;
        }

        field(50001; "Advance Limit"; Integer)
        {
            Caption = 'Advance Limit';
            DataClassification = ToBeClassified;
        }

        field(50002; "Claim Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(50003; "Sub GL Code"; Code[20])
        {
            Caption = 'Sub GL Code';
            DataClassification = ToBeClassified;
        }

        field(50004; "Main GL"; code[20])
        {
            Caption = 'Main GL';
            DataClassification = ToBeClassified;
        }

        field(50005; "RC Number"; Code[20])
        {
            Caption = 'RC Number';
            DataClassification = ToBeClassified;
        }

        field(50006; "Incorporation Date"; Date)
        {
            Caption = 'Incorporation Date';
            DataClassification = ToBeClassified;
        }
        field(50007; Driver; Boolean)
        {

        }
        field(50008; "Responsibility Center"; Code[20])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }

        modify("First Name")
        {
            trigger OnafterValidate()
            begin
                if "Company E-Mail" = '' then
                    Error('company E-mail cannot be empty');
            end;
        }

    }

    var
        myInt: Integer;
}

pageextension 50144 EmployeeExt extends "Employee Card" //MyTargetPageId
{
    layout
    {
        addafter("Last Name")
        {
            field("Account Type"; Rec."Account Type")
            {
                ApplicationArea = All;
            }
            field(Driver; Rec.Driver)
            {
                ApplicationArea = All;
            }
        }
        addafter("Last Date Modified")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = All;
            }


        }

        modify("No.")
        {
            Editable = false;
        }

    }

    actions
    {
        addfirst(processing)
        {


            action("Salary Journal")
            {
                ApplicationArea = All;
                Caption = 'Salary Journal';
                Image = Payroll;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                //to   RunObject = page 50110;
            }
        }

    }

}
