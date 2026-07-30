page 54410 "HR Query Card"
{
    PageType = Card;
    SourceTable = "HR Disciplinary Cases";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = all;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = all;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = all;

                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Date To Discuss Case"; Rec."Date To Discuss Case")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Disciplinary Action Taken"; Rec."Disciplinary Action Taken")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field(Recomendations; rec.Recomendations)
                {
                    ApplicationArea = all;
                }
                field(Comments; rec.Comments)
                {
                    ApplicationArea = all;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                }
                field("Supervisor No."; Rec."Supervisor No.")
                {
                    ApplicationArea = all;
                }
                field("Supervisor Name"; Rec."Supervisor Name")
                {
                    ApplicationArea = all;
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = all;
                }
                field("Send to Hr"; Rec."Send to Hr")
                {
                    ApplicationArea = all;
                }
                field("Send to Others"; Rec."Send to Others")
                {
                    ApplicationArea = all;
                }
                group(Control25)
                {
                    ShowCaption = false;

                    field("Query Body"; Rec."Query Body")
                    {
                        Caption = 'Query';
                        MultiLine = true;
                        ApplicationArea = All;
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Notes)
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
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        HRDisciplinary.Reset;
                        //HRDisciplinary.SETRANGE(HRDisciplinary.Selected,TRUE);
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", rec."Employee No");
                        If HRDisciplinary.Find('-') then begin
                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number := 0;
                            Number := HRDisciplinary.Count;
                            if Number > 1 then begin
                                Error('You cannot have more than one application selected');
                                // ERROR(FORMAT(Number)+' applications selected');
                            end;
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status := HRDisciplinary.Status::"Pending Approval";
                                HRDisciplinary."Closed By" := UserId;
                                HRDisciplinary.Modify;
                                // HRDisciplinary."Closed By" := UserId;
                                Message('Query has been marked as Closed');
                            end
                            else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary."Closed By" := '';
                                HRDisciplinary.Modify;
                                // HRDisciplinary."Closed By" := UserId;
                                Message('Query has been marked as Open');
                            end;
                        end
                        else begin
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
                        Emp: Record "HR Employees";
                    begin
                        SendMail;
                    end;
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec.Query := true;
        rec."Query Date" := Today;
        HrSetup.Get;
        rec."Appraisal Period" := HrSetup."Appraisal Period";
    end;

    var
        Email: List of [Text];
        HREmp: Record "HR Employees";
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
        HrSetup: Record "HR Setup";

    local procedure SendMail()
    var
        HREmp: Record "HR Employees";
        ApplicantsEmail: Text[30];
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HrComm: Record "HR Committees";
        Emp: Record "HR Employees";
    begin
        //GET E-MAIL PARAMETERS FOR GENERAL E-MAILS
        if Emp.Get(Rec."Employee No") then EmpNames := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
        //Send Emp
        HREmailParameters.Reset;
        HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::Query);
        if HREmailParameters.Find('-') then begin
            Emp.Get(rec."Employee No");
            Emp.TestField(Emp."Company E-Mail");
            Email.Add(HREmailParameters.Recipients);
            //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EMail,
            //.Subject, 'Dear' + ' ' + Emp."First Name" + ' ' +
            //StrSubstNo(rec."Query Body") + ' ' + HREmailParameters."Body 2", true);
            //SMTP.Send();
            //Message('Employee has been Notified');
        end;
        if rec."Send to Hr" then begin
            HrComm.Reset;
            HrComm.SetRange(HrComm.Commitee, HrComm.Commitee::Query);
            if HrComm.FindSet then begin
                repeat
                    HREmailParameters.Reset;
                    HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::Query);
                    if HREmailParameters.Find('-') then begin
                        HREmp.Get(HrComm."Employee No.");
                        HREmp.TestField(HREmp."Company E-Mail");
                        Email.Add(HREmp."Company E-Mail");
                        //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EMail,
                        //HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                        //StrSubstNo("Query Body") + ' ' + HREmailParameters."Body 2", true);
                        //SMTP.Send();
                    end;
                until HrComm.Next = 0;
                Message('Query has been forwarded to HR');
            end;
        end;
        if rec."Send to Others" then begin
            HrComm.Reset;
            HrComm.SetRange(HrComm.Commitee, HrComm.Commitee::"Query Mgt (others)");
            if HrComm.FindSet then begin
                repeat
                    HREmailParameters.Reset;
                    HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::Query);
                    if HREmailParameters.Find('-') then begin
                        HREmp.Get(HrComm."Employee No.");
                        HREmp.TestField(HREmp."Company E-Mail");
                        Email.Add(HREmp."Company E-Mail");
                        //SMTP.CreateMessage(HREmailParameters."Sender Name", HREmailParameters."Sender Address", EMail,
                        //HREmailParameters.Subject, 'Dear' + ' ' + HREmp."First Name" + ' ' +
                        //StrSubstNo("Query Body") + ' ' + HREmailParameters."Body 2", true);
                        //SMTP.Send();
                    end;
                until HrComm.Next = 0;
                Message('Query has been forwarded to Query Mgt.');
            end;
        end;
    end;
}
