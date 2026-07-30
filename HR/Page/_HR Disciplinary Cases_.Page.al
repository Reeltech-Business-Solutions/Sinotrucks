page 54513 "HR Disciplinary Cases"
{
    PageType = Card;
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field(EmpNames; EmpNames)
                {
                    Caption = 'Name';
                    Editable = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                }
            }
            part("Case Details"; "HR Disciplinary Cases SF")
            {
                Caption = 'Case Details';
                SubPageLink = "Employee No"=FIELD("No.");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000001; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control1000000002; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';

                action("&Mark as Closed/Open")
                {
                    Caption = '&Mark as Closed/Open';
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        HRDisciplinary.Reset;
                        HRDisciplinary.SetRange(HRDisciplinary.Selected, true);
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", rec."No.");
                        If HRDisciplinary.Find('-')then begin
                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number:=0;
                            Number:=HRDisciplinary.Count;
                            IF Number > 1 then begin
                                Error('You cannot have more than one application selected');
                            // ERROR(FORMAT(Number)+' applications selected');
                            end;
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status:=HRDisciplinary.Status::"Pending Approval";
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By":=UserId;
                            end
                            else
                            begin
                                HRDisciplinary.Status:=HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By":=UserId;
                            end;
                        end
                        else
                        begin
                            Error('No disciplinary case selected');
                        end;
                    end;
                }
                action("Send Mail")
                {
                    Image = SendMail;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DisPCase: Record "HR Disciplinary Cases";
                    begin
                        SendMail;
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        HREmp.Reset;
        if HREmp.Get(rec."No.")then begin
            EmpNames:=HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end
        else
        begin
            EmpNames:='';
        end;
    end;
    var HREmp: Record "HR Employees";
    EmpNames: Text[40];
    HRDisciplinary: Record "HR Disciplinary Cases";
    Number: Integer;
    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Email: List of[Text];
    begin
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        HrComm.SetRange(HrComm.Commitee, HrComm.Commitee::"Disciplinary Commitee");
        if HrComm.FindSet then begin
            repeat HREmailParameters.Reset;
                HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::"Disciplinary Commitee");
                if HREmailParameters.Find('-')then begin
                    HREmp.Get(HrComm."Employee No.");
                    HREmp.TestField(HREmp."Company E-Mail");
                    Email.Add(HREmp."Company E-Mail");
                //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EMail,
                //HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                //HREmailParameters.Body + ' ' + EmpNames + ' ' + HREmailParameters."Body 2", true);
                //SMTP.Send();
                end;
            until HrComm.Next = 0;
            Message('Disciplinary Commitee Members have been notified successfully');
        end;
    end;
}
