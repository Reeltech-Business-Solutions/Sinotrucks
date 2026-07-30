tableextension 50028 "UsersetupExt " extends "User Setup"
{
    fields
    {

        field(50071; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
        field(50001; "Global Dimension 1 Code"; Code[20])
        {
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = ToBeClassified;
        }
        field(50002; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = ToBeClassified;
        }
        field(50003; "Shortcut Dimension 3 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            DataClassification = ToBeClassified;
        }
        field(50004; "Shortcut Dimension 4 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));
            DataClassification = ToBeClassified;
        }
        field(50005; "Staff Travel Account"; Code[20])
        {
            Caption = 'Staff Travel Account';
            DataClassification = ToBeClassified;
            TableRelation = Employee Where(Status = filter(Active));
        }
        field(50006; "Cash Advance Staff Account"; Code[20])
        {
            Caption = 'Staff Advance Staff Account';
            DataClassification = ToBeClassified;
            TableRelation = Employee Where(Status = filter(Active));
        }

        field(50033; "Cash Advance Staff Account 2"; Code[20])
        {
            TableRelation = Customer."No." WHERE("Account Type" = CONST("Staff Advance"));
        }
        field(50007; "Maximum Amount"; Decimal)
        {
            Caption = 'Maximum Amount';
            DataClassification = ToBeClassified;
        }
        field(50008; "Is In HR"; Boolean)
        {
            Caption = 'Is In HR';
            DataClassification = ToBeClassified;
        }
        field(50009; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            DataClassification = ToBeClassified;
            TableRelation = Employee Where(Status = filter(Active));
        }
        field(50010; "Released Status"; Boolean)
        {
            Caption = 'Released Status';
            DataClassification = ToBeClassified;
        }
        field(50011; "ReOpen Job Card"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50012; "Confirm warranty"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50013; "ReOpen Service Quote"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50014; "Close Job"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50015; "Unlimited Imprest Amt Approval"; Boolean)
        {
        }
        field(50016; "Imprest Amount Approval Limit"; Decimal)
        {
        }
        field(50017; "Unlimited Store RqAmt Approval"; Boolean)
        {
        }
        field(50018; "Store Req. Amt Approval Limit"; Decimal)
        {
        }
        field(50019; "Unlimited ImprestSurr Amt Appr"; Boolean)
        {
        }
        field(50020; "ImprestSurr Amt Approval Limit"; Decimal)
        {
        }
        field(50021; "Unlimited Interbank Amt Appr"; Boolean)
        {
        }
        field(50022; "Interbank Amt Approval Limit"; Decimal)
        {
        }
        field(50023; "Post JVs"; Boolean)
        {
        }
        field(50024; "Post Bank Rec"; Boolean)
        {
        }
        field(50025; "Unlimited Receipt Amt Approval"; Boolean)
        {
        }
        field(50026; "Receipt Amt Approval Limit"; Decimal)
        {
        }
        field(50027; "Unlimited Claim Amt Approval"; Boolean)
        {
        }
        field(50028; "Claim Amt Approval Limit"; Decimal)
        {
        }
        field(50029; "Unlimited Advance Amt Approval"; Boolean)
        {
        }
        field(50030; "Advance Amt Approval Limit"; Decimal)
        {
        }
        field(50031; "Unlimited AdvSurr Amt Approval"; Boolean)
        {
        }
        field(50032; "AdvSurr Amt Approval Limit"; Decimal)
        {
        }

        field(50034; "ReOpen/Release"; Option)
        {
            OptionMembers = " ",ReOpen,Release;
        }
        field(50035; "Location Code"; Code[10])
        {
            TableRelation = Location.Code;
        }
        field(50036; "default retail customer"; Code[10])
        {
            TableRelation = Customer;
        }
        field(50037; Leave; Boolean)
        {
        }
        field(50038; "Payroll Type"; Option)
        {
            OptionCaption = 'General,Directors';
            OptionMembers = General,Directors;
        }
        field(50039; "Edit Posted Dimensions"; Boolean)
        {
        }
        field(50040; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
            TableRelation = "Gen. Journal Template";
        }
        field(50041; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
            TableRelation = "Gen. Journal Batch".Name WHERE("Journal Template Name" = FIELD("Journal Template Name"));
        }
        field(50042; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR".Code;
        }
        field(50043; "Modify Item Pricing"; Boolean)
        {
        }
        field(50044; "Modify ItemGross Profit Target"; Boolean)
        {
        }
        field(50045; "ReValidate LPOs"; Boolean)
        {
            Description = 'Can ReOpen Expired LPOs';
        }
        field(50046; "Service Amount Approval Limit"; Integer)
        {
            BlankZero = true;
            Caption = 'Sales Amount Approval Limit';

            trigger OnValidate()
            begin
                //   if "Unlimited Sales Approval" and ("Sales Amount Approval Limit" <> 0) then
                //      Error(Text003, FieldCaption("Sales Amount Approval Limit"), FieldCaption("Unlimited Sales Approval"));
                //if "Sales Amount Approval Limit" < 0 then
                //  Error(Text005);
            end;
        }
        field(50047; "Unlimited Service Approval"; Boolean)
        {
            Caption = 'Unlimited Sales Approval';

            trigger OnValidate()
            begin
                if "Unlimited Sales Approval" then "Sales Amount Approval Limit" := 0;
            end;
        }
        field(50048; FC; Boolean)
        {
        }
        field(50049; "Unlimited WorkOrd Amt Approval"; Boolean)
        {
        }
        field(50050; "WorkOrder Amt Approval Limit"; Decimal)
        {
        }
        field(50051; "Assigned to Employee"; Boolean)
        {
        }
        field(50052; "Reopen Doc"; Boolean)
        {
        }
        field(50053; HR; Boolean)
        {
        }
        field(50054; "PayRoll Cent. Filter"; Code[20])
        {
            TableRelation = "Payroll Classification";
        }
        field(50055; "Payroll Substitute"; Code[50])
        {
            TableRelation = "User Setup";
        }
        field(50056; "HR Job"; Boolean)
        {
            Description = 'Job Creation & Skip action on int evaluation card';
        }
        field(50057; "Internal Audit"; Boolean)
        {
        }
        field(50058; "Grade Classification"; Code[20])
        {
            TableRelation = "prEmployee Posting Group".Code;
        }
        field(50059; "Full Name"; Text[100])
        {
            CalcFormula = Lookup(User."Full Name" WHERE("User Name" = FIELD("User ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50060; "LPO Check"; Boolean)
        {
        }
        field(50061; "Modify Staff Advance"; Boolean)
        {
        }
        field(50062; SignatureUser; BLOB)
        {
            SubType = Bitmap;
        }
        field(50063; "Approval IDs"; Text[250])
        {
            trigger OnLookup()
            begin
                /*  UserSetup.Find('-');
                      if PAGE.RunModal(PAGE::"User Setup", UserSetup) = ACTION::LookupOK then begin
                          if ("Approval IDs" = '') and ("Approver ID" = '') then
                              "Approval IDs" := UserSetup."User ID"
                          else
                              if ("Approval IDs" = '') and ("Approver ID" <> '') then
                                  "Approval IDs" := "Approver ID" + '|' + UserSetup."User ID"
                              else
                                  if ("Approval IDs" <> '') then
                                      "Approval IDs" := "Approval IDs" + '|' + UserSetup."User ID";
                      end;
                      */
            end;
        }
        field(50064; "Send SMS"; Boolean)
        {
        }
        field(50065; "User Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50066; "Reinstate Employee"; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(50067; "Unlimited PV Amount Approval"; Boolean)
        {
        }
        field(50068; "PV Amount Approval Limit"; Decimal)
        {
        }
        field(50069; "Unlimited PettyAmount Approval"; Boolean)
        {
        }
        field(50070; "Petty C Amount Approval Limit"; Decimal)
        {
        }
        field(50072; BlockServiceItem; Boolean)
        {
        }

        field(50073; "Shortcut Dimension 7 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 7 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7));
            DataClassification = ToBeClassified;
        }
        field(50074; "LPO Status"; Boolean)
        {

        }
        field(50075; "FPO Status"; Boolean)
        {

        }
        field(50076; "Reopen Claims"; Boolean)
        {

        }
    }

    var
        myInt: Integer;
}
pageextension 50012 UserSetupExt extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Sales Resp. Ctr. Filter")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                Caption = 'Global Dimension 1 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                Caption = 'Shortcut Dimension 2 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                Caption = 'Shortcut Dimension 3 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
            {
                Caption = 'Shortcut Dimension 4 Code';
                ApplicationArea = All;
            }

            field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
            {
                Caption = 'Shortcut Dimension 7 Code';
                ApplicationArea = All;
            }

            field("Staff Travel Account"; Rec."Staff Travel Account")
            {
                Caption = 'Staff Travel Account';
                ApplicationArea = All;
            }

            // field("Cash Advance Staff Account"; Rec."Cash Advance Staff Account")
            // {
            //     Caption = 'Staff Advance Account';
            //     ApplicationArea = All;
            // }

            field("Cash Advance Staff Account"; Rec."Cash Advance Staff Account 2")
            {
                Caption = 'Staff Advance Account';
                ApplicationArea = All;
            }

            field("Employee No"; Rec."Employee No")
            {
                Caption = 'Employee No';
                ApplicationArea = All;
            }

            field("Maximum Amount"; Rec."Maximum Amount")
            {
                Caption = 'Maximum Amount';
                ApplicationArea = All;
            }

            field("Is In HR"; Rec."Is In HR")
            {
                Caption = 'Is In HR';
                ApplicationArea = All;
            }
            field("Reinstate Employee"; Rec."Reinstate Employee")
            {
                ApplicationArea = All;
            }
            field("ReOpen Job Card"; Rec."ReOpen Job Card")
            {
                ApplicationArea = All;
            }
            field("Close Job"; Rec."Close Job")
            {
                ApplicationArea = All;
            }
            field("Confirm warranty"; Rec."Confirm warranty")
            {
                ApplicationArea = All;
            }
            field("ReOpen Service Quote"; Rec."ReOpen Service Quote")
            {
                ApplicationArea = All;
            }
            field(BlockServiceItem; Rec.BlockServiceItem)
            {
                Caption = 'Block Service Item';
                ApplicationArea = All;
            }
            field("LPO Status"; Rec."LPO Status")
            {
                ApplicationArea = All;
            }
            field("FPO Status"; Rec."FPO Status")
            {
                ApplicationArea = All;
            }
            field("Reopen Doc"; Rec."Reopen Doc")
            {
                ApplicationArea = all;
            }
            field("Reopen Claims"; Rec."Reopen Claims")
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
