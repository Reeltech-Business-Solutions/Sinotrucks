page 54506 "HR Lookup Values Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "HR Lookup Values";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

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
                label(Control1102755023)
                {
                    ApplicationArea = all;
                    CaptionClass = Text19024457;
                    ShowCaption = false;
                }
                field(Score; rec.Score)
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
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = all;
                }
                field("To be cleared by"; Rec."To be cleared by")
                {
                    ApplicationArea = all;
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    Editable = EmpEdit;
                    ApplicationArea = all;
                }
                field("Exam Leave Days"; Rec."Exam Leave Days")
                {
                    Editable = JobEdit;
                    ApplicationArea = all;
                }
                field("HMO Beneficiaries"; Rec."HMO Beneficiaries")
                {
                    Editable = JobEdit;
                    ApplicationArea = all;
                }
                field(Level; Rec.Level)
                {

                }
            }
        }
    }
    actions
    {
    }
    trigger OnAfterGetRecord()
    begin
        if rec.Type = rec.Type::"Employment Type" then
            EmpEdit := false
        else if rec.Type = rec.Type::"Job Level" then JobEdit := false;
    end;

    trigger OnOpenPage()
    begin
        EmpEdit := true;
        JobEdit := true;
        if rec.Type = rec.Type::"Employment Type" then
            EmpEdit := false
        else if rec.Type = rec.Type::"Job Level" then JobEdit := false;
    end;

    var
        Text19024457: Label 'Months';
        EmpEdit: Boolean;
        JobEdit: Boolean;
}
