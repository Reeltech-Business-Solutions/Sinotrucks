page 54610 "prList TransCode"
{
    CardPageID = "prTransaction Code";
    ApplicationArea = all;
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "prTransaction Codes";
    SourceTableView = WHERE("Non-Transactional"=CONST(false));
    AdditionalSearchTerms = 'List TransCode';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Enabled = true;
                ShowCaption = false;

                field("Transaction Code"; Rec."Transaction Code")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field(Frequency; rec.Frequency)
                {
                    Editable = true;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Transaction Category"; Rec."Transaction Category")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Taxable; rec.Taxable)
                {
                    Editable = true;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Transfer to"; Rec."Transfer to")
                {
                    ApplicationArea = all;
                }
                field("Gross Variation"; Rec."Gross Variation")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("IsCoop/LnRep"; Rec."IsCoop/LnRep")
                {
                    ApplicationArea = all;
                }
                field("coop parameters"; Rec."coop parameters")
                {
                    ApplicationArea = all;
                }
                field("Is Cash"; Rec."Is Cash")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Is Formula"; Rec."Is Formula")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field(Subledger; rec.Subledger)
                {
                    ApplicationArea = all;
                }
                field(Formula; rec.Formula)
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Amount Preference"; Rec."Amount Preference")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Special Transactions"; Rec."Special Transactions")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Deduct Premium"; Rec."Deduct Premium")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Nominal Interest Rate"; Rec."Nominal Interest Rate")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("GL Account"; Rec."GL Account")
                {
                    ApplicationArea = all;
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
                field("Fringe Benefit"; Rec."Fringe Benefit")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = true;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(View)
            {
                Caption = 'View';

                action("SetUp Card")
                {
                    Caption = 'SetUp Card';
                    RunObject = Page "prTransaction Code";
                    RunPageLink = "Transaction Code"=FIELD("Transaction Code");
                    RunPageView = SORTING("Transaction Code");
                    ApplicationArea = All;
                }
            }
        }
    }
}
