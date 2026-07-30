page 50310 "HR Vital Set up"
{
    ApplicationArea = All;
    Caption = 'HR Vital Set up';
    PageType = List;
    SourceTable = "prVital Setup Info";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(group)
            {
                field("Setup Code"; Rec."Setup Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Setup Code field.';
                }
                field("Tax Relief"; Rec."Tax Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Relief field.';
                }
                field("Insurance Relief"; Rec."Insurance Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Insurance Relief field.';
                }
                field("Max Relief"; Rec."Max Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max Relief field.';
                }
                field("Mortgage Relief"; Rec."Mortgage Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Mortgage Relief field.';
                }
                field("Max Pension Contribution"; Rec."Max Pension Contribution")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Max Pension Contribution field.';
                }
                field("Tax On Excess Pension"; Rec."Tax On Excess Pension")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax On Excess Pension field.';
                }
                field("Loan Market Rate"; Rec."Loan Market Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loan Market Rate field.';
                }
                field("Loan Corporate Rate"; Rec."Loan Corporate Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Loan Corporate Rate field.';
                }
                field("Taxable Pay (Normal)"; Rec."Taxable Pay (Normal)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Taxable Pay (Normal) field.';
                }
                field("Taxable Pay (Agricultural)"; Rec."Taxable Pay (Agricultural)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Taxable Pay (Agricultural) field.';
                }
                field("NHIF Based on"; Rec."NHIF Based on")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NHIF Based on field.';
                }
                field("NSSF Employee"; Rec."NSSF Employee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NSSF Employee field.';
                }
                field("NSSF Employer Factor"; Rec."NSSF Employer Factor")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NSSF Employer Factor field.';
                }
                field("OOI Deduction"; Rec."OOI Deduction")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OOI Deduction field.';
                }
                field("OOI December"; Rec."OOI December")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the OOI December field.';
                }
                field("Security Day (U)"; Rec."Security Day (U)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Security Day (U) field.';
                }
                field("Security Night (U)"; Rec."Security Night (U)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Security Night (U) field.';
                }
                field("Ayah (U)"; Rec."Ayah (U)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ayah (U) field.';
                }
                field("Gardener (U)"; Rec."Gardener (U)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gardener (U) field.';
                }
                field("Security Day (R)"; Rec."Security Day (R)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Security Day (R) field.';
                }
                field("Security Night (R)"; Rec."Security Night (R)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Security Night (R) field.';
                }
                field("Ayah (R)"; Rec."Ayah (R)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ayah (R) field.';
                }
                field("Gardener (R)"; Rec."Gardener (R)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gardener (R) field.';
                }
                field("Benefit Threshold"; Rec."Benefit Threshold")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Benefit Threshold field.';
                }
                field("Tax Relief % of Gross Income"; Rec."Tax Relief % of Gross Income")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Relief % of Gross Income field.';
                }
                field("Child Relief"; Rec."Child Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Child Relief field.';
                }
                field("Dependants Relief"; Rec."Dependants Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dependants Relief field.';
                }
                field("NHF - % of Basic Pay"; Rec."NHF - % of Basic Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NHF - % of Basic Pay field.';
                }
                field("NHF - Maximum Age"; Rec."NHF - Maximum Age")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NHF - Maximum Age field.';
                }
                field("NISTF % of Basic Pay"; Rec."NISTF % of Basic Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NISTF % of Basic Pay field.';
                }
                field("Payroll Cut Off Day"; Rec."Payroll Cut Off Day")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Cut Off Day field.';
                }
                field("Pay upto Cut Off Date"; Rec."Pay upto Cut Off Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay upto Cut Off Date field.';
                }
                field("Prorate Absence"; Rec."Prorate Absence")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prorate Absence field.';
                }
                field("Prorate Pension"; Rec."Prorate Pension")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prorate Pension field.';
                }
                field("Prorate NHF"; Rec."Prorate NHF")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prorate NHF field.';
                }
                field("Arrears Based on days in month"; Rec."Arrears Based on days in month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arrears Based on days in month field.';
                }
                field("Prol. Based on days in month"; Rec."Prol. Based on days in month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prol. Based on days in month field.';
                }
                field("Show Signatory in Payslip"; Rec."Show Signatory in Payslip")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Show Signatory in Payslip field.';
                }
                field("Don't Prorate Basic Pay"; Rec."Don't Prorate Basic Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dont prorate Basic Pay field.';
                }
                field("Exclude NonTax from Relief"; Rec."Exclude NonTax from Relief")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exclude NonTax from Relief field.';
                }
                field("Show Cumm. Stat. on Payslip"; Rec."Show Cumm. Stat. on Payslip")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Show Cumm. Stat. on Payslip field.';
                }
                field("2 Decimals in Payslip"; Rec."2 Decimals in Payslip")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the 2 Decimals in Payslip field.';
                }
                field("Prorate Absence Basic Pay"; Rec."Prorate Absence Basic Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prorate Absence Basic Pay field.';
                }
                field("Prol. Absence on days in month"; Rec."Prol. Absence on days in month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Prol. Absence on days in month field.';
                }
                field("Working Days"; Rec."Working Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Working Days field.';
                }
            }
        }
    }
}
