page 54470 "HR Lookup Values Factbox"
{
    Caption = 'HR Lookup Values Factbox';
    PageType = CardPart;
    SourceTable = "HR Lookup Values";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Type; rec.Type)
            {
                ApplicationArea = all;
            }
            field("Code"; rec.Code)
            {
                ApplicationArea = all;
            }
            field(Description; rec.Description)
            {
                ApplicationArea = all;
            }
            field(Remarks; rec.Remarks)
            {
                ApplicationArea = all;
            }
            field("Notice Period"; Rec."Notice Period")
            {
                ApplicationArea = all;
            }
            field(Closed; rec.Closed)
            {
                ApplicationArea = all;
            }
            field("Contract Length"; Rec."Contract Length")
            {
                ApplicationArea = all;
            }
            field("Current Appraisal Period"; Rec."Current Appraisal Period")
            {
                ApplicationArea = all;
            }
            field("Disciplinary Case Rating"; Rec."Disciplinary Case Rating")
            {
                ApplicationArea = all;
            }
            field("Disciplinary Action"; Rec."Disciplinary Action")
            {
                ApplicationArea = all;
            }
            field(From; rec.From)
            {
                ApplicationArea = all;
            }
            field("To"; Rec."To")
            {
                ApplicationArea = all;
            }
            field(Score; rec.Score)
            {
                ApplicationArea = all;
            }
            field("Basic Salary"; Rec."Basic Salary")
            {
                ApplicationArea = all;
            }
            field("To be cleared by"; Rec."To be cleared by")
            {
                ApplicationArea = all;
            }
        }
    }
    actions
    {
    }
}
