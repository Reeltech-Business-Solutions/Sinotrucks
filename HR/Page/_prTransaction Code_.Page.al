page 54619 "prTransaction Code"
{
    PageType = Card;
    SourceTable = "prTransaction Codes";
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = all;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field(Frequency; rec.Frequency)
                {
                    ValuesAllowed = Fixed, Varied, Quarterly, Annual;
                    ApplicationArea = all;
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ValuesAllowed = None, Increasing, Reducing;
                    ApplicationArea = all;
                }
                field("Amount Preference"; Rec."Amount Preference")
                {
                    ValuesAllowed = "Posted Amount", "Take Lower ", "Take Higher";
                    ApplicationArea = all;
                }
                field("Is Cash"; Rec."Is Cash")
                {
                    ApplicationArea = all;
                }
                field(Taxable; rec.Taxable)
                {
                    ApplicationArea = all;
                }
                field("Voluntary Contribution"; Rec."Voluntary Contribution")
                {
                    ApplicationArea = all;
                }
                field(Welfare; rec.Welfare)
                {
                    ApplicationArea = all;
                }
                field(Pension; rec.Pension)
                {
                    ApplicationArea = all;
                }
                field(Meal; rec.Meal)
                {
                    ApplicationArea = all;
                }
                field(Arrear; rec.Arrear)
                {
                    ApplicationArea = all;
                }
                field(Passage; rec.Passage)
                {
                    ApplicationArea = all;
                }
                field("Passage %"; Rec."Passage %")
                {
                    ApplicationArea = all;
                }
                field("Is Formula"; Rec."Is Formula")
                {
                    ApplicationArea = all;
                }
                field(Formula; rec.Formula)
                {
                    ApplicationArea = all;
                }
                label(Control1102756053)
                {
                    CaptionClass = Text19025872;
                    ShowCaption = false;
                    ApplicationArea = all;
                }
                field("Include Employer Deduction"; Rec."Include Employer Deduction")
                {
                    ApplicationArea = all;
                }
                field("Employer Deduction"; Rec."Employer Deduction")
                {
                    ApplicationArea = all;
                }
                field("Is Formula for employer"; Rec."Is Formula for employer")
                {
                    ApplicationArea = all;
                }
                field("Pension EE formula"; Rec."Pension EE formula")
                {
                    ApplicationArea = all;
                }
                label(Control1102756054)
                {
                    CaptionClass = Text19080001;
                    ShowCaption = false;
                    ApplicationArea = all;
                }
                field("Transaction Category"; Rec."Transaction Category")
                {
                    ApplicationArea = all;
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                    ApplicationArea = all;
                }
                field("Pensure Arrears"; Rec."Pensure Arrears")
                {
                    ApplicationArea = all;
                }
                field(Exclude; rec.Exclude)
                {
                    Caption = 'Exclude';
                    ApplicationArea = all;
                }
                field("% Setup"; Rec."% Setup")
                {
                    ApplicationArea = All;
                }
                field("% Setup 1"; Rec."% Setup 1")
                {

                }

                field("Add To Notch"; Rec."Add To Notch")
                {
                    ApplicationArea = All;
                }
                group(Loans)
                {
                    Caption = 'Loans';

                    field("Special Transactions"; Rec."Special Transactions")
                    {
                        Caption = 'Loans';
                        ValuesAllowed = Ignore, "Staff Loan";
                        ApplicationArea = all;
                    }
                    field("Nominal Interest Rate"; Rec."Nominal Interest Rate")
                    {
                        Caption = 'Interest Rate';
                        ApplicationArea = all;
                    }
                    field("Effective Interest Loan"; Rec."Effective Interest Loan")
                    {
                        ApplicationArea = all;
                    }
                    field("Repayment Method"; Rec."Repayment Method")
                    {
                        ValuesAllowed = Reducing, "Straight line", Amortized;
                        ApplicationArea = all;
                    }
                    field("Related Transaction Code"; Rec."Related Transaction Code")
                    {
                        ApplicationArea = all;
                    }
                    field("Fringe Benefit"; Rec."Fringe Benefit")
                    {
                        ApplicationArea = all;
                    }
                    field("Special Allowances"; Rec."Special Allowances")
                    {
                        ApplicationArea = all;
                    }
                }
                field("Non-Transactional"; Rec."Non-Transactional")
                {
                    ApplicationArea = all;
                }
                field("Leave Allowance"; Rec."Leave Allowance")
                {
                    ApplicationArea = all;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = all;
                }
                field(Subledger; rec.Subledger)
                {
                    Caption = 'Posting to Subledger';
                    ApplicationArea = all;
                }
                field(CustomerPostingGroup; rec.CustomerPostingGroup)
                {
                    Caption = 'Debtor Posting Group';
                    ApplicationArea = all;
                }
                field("IsCoop/LnRep"; Rec."IsCoop/LnRep")
                {
                    Caption = 'Is Loan/Coop';
                    ApplicationArea = all;
                }
                field("Add to Relief"; Rec."Add to Relief")
                {
                    ApplicationArea = all;
                }
                field("Prorate Absence"; Rec."Prorate Absence")
                {
                    ApplicationArea = all;
                }
                field("Annual Pay"; Rec."Annual Pay")
                {
                    ApplicationArea = all;
                }
            }
            group("Other Set-Ups")
            {
                Caption = 'Other Set-Ups';

                group("Select one")
                {
                    Caption = 'Select one';

                    field("Special Transactions3"; Rec."Special Transactions")
                    {
                        Caption = 'Other Transactions';
                        ApplicationArea = all;
                        ValuesAllowed = Ignore, "Defined Contribution", "Home Ownership Savings Plan", "Owner Occupier Interest", "Prescribed Benefit", "Salary Arrears", "Value of Quarters";
                    }
                }
                group(Control1102756068)
                {
                    Caption = 'Select one';

                    field("Special Transactions4"; Rec."Special Transactions")
                    {
                        Caption = 'Life Insurance';
                        ApplicationArea = all;
                        ValuesAllowed = "Life Insurance";
                    }
                    field("Deduct Premium"; Rec."Deduct Premium")
                    {
                        ApplicationArea = all;
                    }
                }
                group("Coop Reporting")
                {
                    Caption = 'Coop Reporting';

                    field("IsCoop/LnRep2"; Rec."IsCoop/LnRep")
                    {
                        Caption = 'Coop Parameter';
                        ApplicationArea = all;
                    }
                    field("coop parameters"; Rec."coop parameters")
                    {
                        DrillDown = false;
                        ApplicationArea = all;
                    }
                    field("Palliative"; Rec.Palliative)
                    {
                        ApplicationArea = all;
                    }
                }
            }
        }
    }
    actions
    {
    }
    var
        Text19025872: Label 'E.g ([005]+[020]*[24])/2268';
        Text19080001: Label 'E.g ([005]+[020]*[24])/2268';
}
