page 54691 "HR Staff Activities"
{
    PageType = Card;
    SourceTable = "HR Company Activities";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; rec.Code)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee No"; Rec."Employee No")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Subject; rec.Subject)
                {
                    ApplicationArea = all;
                }
                field("Email Message"; Rec."Email Message")
                {
                    MultiLine = true;
                    ApplicationArea = All;
                }
                field(Sent; rec.Sent)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            group(Action10)
            {
                action("Send Mail")
                {
                    Image = SendMail;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        SendMail;
                    end;
                }
                action(Attachment)
                {
                    RunObject = Page "HR Employee Attachments SF";
                    RunPageLink = "Employee No"=FIELD("Employee No"), "Document Type"=CONST("Staff Activity");
                    Visible = false;
                    ApplicationArea = All;
                }
                action("Test Attachment")
                { /*
                ApplicationArea = All;
                    Caption = 'Attachment';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Attachment Test";
                    RunPageLink = "Employee No" = FIELD ("Employee No"),
                                  "Document Type" = CONST ("Staff Activity"),
                                  "Application No" = FIELD (Code),
                                  "Folder Type" = CONST (HR);
                                  */
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean begin
        Emp.SetRange("User ID", UserId);
        if Emp.FindFirst then begin
            rec."Employee No":=Emp."No.";
            rec."Employee Name":=Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        end;
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Activity Type":=rec."Activity Type"::Staff;
    end;
    var Emp: Record "HR Employees";
    Text001: Label 'Mail sent successfully';
    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Emp: Record "HR Employees";
        Email: List of[Text];
    begin
        //Send Emp
        if rec.Sent then Error('HR has been notified');
        Emp.Get(rec."Employee No");
        Emp.TestField("Company E-Mail");
        Emp.TestField(Emp."Company E-Mail");
        Email.Add('hr@leadway-Pensure.com');
        //SMTP.CreateMessage("Employee Name", Emp."Company E-Mail", Email,
        //Subject, 'Dear' + ' ' + Emp."First Name" + ' ' +
        //' ' + "Email Message", true);
        //SMTP.Send();
        //Sent := true;
        //Modify;
        Message('%1', Text001);
    end;
}
