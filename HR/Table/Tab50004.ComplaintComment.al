table 50201 ComplaintComment
{
    Caption = 'ComplaintComment';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;
            Editable = false;

        }
        field(3; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            AutoIncrement = true;
        }
        field(4; Comment; Text[250])
        {
            Editable = true;
            trigger OnValidate()
            begin
                "Comment By" := UserId;
                "Comment Date" := Today;

            end;
        }
        field(5; "Comment By"; Code[50])
        {
            Editable = false;

        }
        field(7; "Comment Date"; Date)
        {
            Editable = false;
        }
        field(8; "Seen"; Boolean)
        {
            trigger OnValidate()
            begin
                if Seen then begin
                    "Seen By" := UserId;
                    "Seen Date" := Today;
                end else begin
                    Clear("Seen By");
                    Clear("Seen Date");
                end;

            end;
        }
        field(9; "Seen By"; Code[50])
        {
            Editable = false;
        }
        field(10; "Seen Date"; Date)
        {

        }
        field(11; "Notify"; Boolean)
        {
            Caption = 'Send Notification';

            trigger OnValidate()
            begin
                if Comment = '' then
                    Notify := false;
                if Notify = true then begin
                    Modify();
                    NotificationtoEmployee(Rec);
                    Message('Notification sent');

                end else
                    Notify := false;
            end;


        }


    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    procedure NotificationtoEmployee(complaint: Record ComplaintComment)
    var
        EmpName: Text;
        EmpNo: Code[20];
        Empl: Record "HR Employees";
        CompCode: Code[20];

    begin
        Comp.Reset();
        Comp.SetFilter("Complaint No.", rec."Document No.");
        if Comp.Find('-') then begin
            CompCode := Comp."Complaint No.";
            Empl.SetFilter("No.", Comp."Employee No");
            if Empl.find('-') then begin
                EmpNo := Empl."No.";
                EmpName := Empl."First Name" + ' ' + Empl."Middle Name" + ' ' + Empl."Last Name";
            end;
        end;
        Comp.Reset();
        Comp.SetFilter("Company Email", '<>%1', '');
        if rec.Find('-') then
            repeat
                Recipients.Add(Comp."Company Email");
            until Rec.Next() = 0;
        EmailBody := 'Dear Employee, <br><br><p> A new response on complaint form, %1, has been added for %2(%3).';
        EmailBody += '<br><br><hr> This is a system generated e-mail. Please do not reply to this mail.';
        EmailBody += '<br><br><br> Thank you.';
        FormatEmailBody := StrSubstNo(EmailBody, CompCode, EmpName, EmpNo);
        EmailMessage.Create(Recipients, 'NOTIFICATION: HR Response', FormatEmailBody, true);
        EmailSend.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    var
        EmailAccount: record "Email Account";
        EmailMessage: codeunit "Email Message";
        EmailBody: Text;
        FormatEmailBody: Text;
        EmailSend: Codeunit Email;
        Recipients: list of [text];
        Comp: Record "Complaint Form";

}


