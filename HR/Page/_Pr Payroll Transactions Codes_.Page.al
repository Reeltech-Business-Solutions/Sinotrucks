page 54557 "Pr Payroll Transactions Codes"
{
    CardPageID = "prTransaction Code";
    ApplicationArea = all;
    PageType = List;
    SourceTable = "prTransaction Codes";
    AdditionalSearchTerms = 'Payroll Transactions Codes';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Code"; Rec."Transaction Code")
                {
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                }
                field("% Setup"; Rec."% Setup")
                {
                }


                field("Add To Notch"; Rec."Add To Notch")
                {
                }
                field(Frequency; Rec.Frequency)
                {
                }
                field("Is Cash"; Rec."Is Cash")
                {
                }
                field(Taxable; Rec.Taxable)
                {
                }
                field("Voluntary Contribution"; Rec."Voluntary Contribution")
                {
                }
                field("Is Formula"; Rec."Is Formula")
                {
                }
                field(Formula; Rec.Formula)
                {
                }
                field("Balance Type"; Rec."Balance Type")
                {
                }
                field("Amount Preference"; Rec."Amount Preference")
                {
                }
                field("Nominal Interest Rate"; Rec."Nominal Interest Rate")
                {
                }
                field("GL Account"; Rec."GL Account")
                {
                }
                field("Special Transactions"; Rec."Special Transactions")
                {
                }
                field("Deduct Premium"; Rec."Deduct Premium")
                {
                }
                field("Repayment Method"; Rec."Repayment Method")
                {
                }
                field("Fringe Benefit"; Rec."Fringe Benefit")
                {
                }
                field("Employer Deduction"; Rec."Employer Deduction")
                {
                }
                field(isHouseAllowance; Rec.isHouseAllowance)
                {
                }
                field("Include Employer Deduction"; Rec."Include Employer Deduction")
                {
                }
                field("Is Formula for employer"; Rec."Is Formula for employer")
                {
                }
                field("Transaction Code old"; Rec."Transaction Code old")
                {
                }
                field("GL Employee Account"; Rec."GL Employee Account")
                {
                }
                field("coop parameters"; Rec."coop parameters")
                {
                }
                field("IsCoop/LnRep"; Rec."IsCoop/LnRep")
                {
                }
                field("Deduct Mortgage"; Rec."Deduct Mortgage")
                {
                }
                field(Subledger; Rec.Subledger)
                {
                }
                field(Welfare; Rec.Welfare)
                {
                }
                field(CustomerPostingGroup; Rec.CustomerPostingGroup)
                {
                }
                field("Tax Limit Amount"; Rec."Tax Limit Amount")
                {
                }
                field("Tax Limit Percentage"; Rec."Tax Limit Percentage")
                {
                }
                field(Pension; Rec.Pension)
                {
                }
                field("Non-Transactional"; Rec."Non-Transactional")
                {
                }
                field("Previous Month Filter"; Rec."Previous Month Filter")
                {
                }
                field("Current Month Filter"; Rec."Current Month Filter")
                {
                }
                field("Prev. Amount"; Rec."Prev. Amount")
                {
                }
                field("Curr. Amount"; Rec."Curr. Amount")
                {
                }
                field("Gross Variation"; Rec."Gross Variation")
                {
                }
                field("Group Order"; Rec."Group Order")
                {
                }
                field("Sub Group Order"; Rec."Sub Group Order")
                {
                }
                field("Entry/Exit Filter"; Rec."Entry/Exit Filter")
                {
                }
                field("Leave Allowance"; Rec."Leave Allowance")
                {
                }
                field("Transaction Category"; Rec."Transaction Category")
                {
                }
                field("Employee Code Filter"; Rec."Employee Code Filter")
                {
                }
                field("Overtime Type"; Rec."Overtime Type")
                {
                }
                field("Transfer to"; Rec."Transfer to")
                {
                }
                field("Location/Division Filter"; Rec."Location/Division Filter")
                {
                }
                field("Department Filter"; Rec."Department Filter")
                {
                }
                field("Cost Centre Filter"; Rec."Cost Centre Filter")
                {
                }
                field("Salary Grade Filter"; Rec."Salary Grade Filter")
                {
                }
                field("Salary Notch Filter"; Rec."Salary Notch Filter")
                {
                }
                field("Add to Relief"; Rec."Add to Relief")
                {
                }
                field("Sort Order"; Rec."Sort Order")
                {
                }
                field("Curr. Units"; Rec."Curr. Units")
                {
                }
                field("Prorate Absence"; Rec."Prorate Absence")
                {
                }
                field("Recon Items"; Rec."Recon Items")
                {
                }
                field("Annual Pay"; Rec."Annual Pay")
                {
                }
                field("Excl. from Proration"; Rec."Excl. from Proration")
                {
                }
                field("Special Allowances"; Rec."Special Allowances")
                {
                }
            }
        }
    }
}
