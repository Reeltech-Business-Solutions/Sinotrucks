page 50056 "Withholding Tax"
{
    ApplicationArea = All;
    Caption = 'Withholding Tax';
    PageType = List;
    SourceTable = "WithHold Tax";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("WHT Code"; Rec."WHT Code")
                {
                    ToolTip = 'Specifies the value of the WHT Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Percentage; Rec.Percentage)
                {
                    ToolTip = 'Specifies the value of the WHT Percentage field.', Comment = '%';
                }
                field("WHT Account"; Rec."WHT Account")
                {
                    ToolTip = 'Specifies the value of the WHT Account field.', Comment = '%';
                }
                field("VAT Account"; Rec."VAT Account")
                {
                    ToolTip = 'Specifies the value of the VAT Account field.', Comment = '%';
                }
                field("G/L Entries"; Rec."G/L Entries")
                {
                    ToolTip = 'Specifies the value of the G/L Entries field.', Comment = '%';
                }
            }
        }
    }
}
