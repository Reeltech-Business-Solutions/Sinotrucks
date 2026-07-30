
page 50241 "Complaint List"
{
    ApplicationArea = All;
    Caption = 'Complaint List';
    PageType = List;
    CardPageId = "Complaint Form Card";
    SourceTable = "Complaint Form";
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ToolTip = 'Specifies the value of the Complaint No. field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Applicant Name field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Company Email"; Rec."Company Email")
                {
                    ToolTip = 'Specifies the value of the Company Email field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Complaint Details"; Rec."Complaint Details")
                {
                    ToolTip = 'Specifies the value of the Complaint Details field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Date of incident"; Rec."Date of incident")
                {
                    ToolTip = 'Specifies the value of the Date of incident field.';

                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Description of complaint"; Rec."Description of complaint")
                {
                    ToolTip = 'Specifies the value of the Description of complaint field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Details of Incident"; Rec."Details of Incident")
                {
                    ToolTip = 'Specifies the value of the Details of Incident field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ToolTip = 'Specifies the value of the Job Description field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ToolTip = 'Specifies the value of the Job Title field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Nature of Complaint"; Rec."Nature of Complaint")
                {
                    ToolTip = 'Specifies the value of the Nature of Complaint field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("No Series"; Rec."No Series")
                {
                    ToolTip = 'Specifies the value of the No Series field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ToolTip = 'Specifies the value of the Supervisor field.';
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }


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
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", rec."Complaint No.");
                        if HRDisciplinary.Find('-') then begin
                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number := 0;
                            Number := HRDisciplinary.Count;
                            if Number > 1 then begin
                                Error('You cannot have more than one application selected');
                                // ERROR(FORMAT(Number)+' applications selected');
                            end;
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status := HRDisciplinary.Status::"Pending Approval";
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end
                            else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify;
                                HRDisciplinary."Closed By" := UserId;
                            end;
                        end
                        else begin
                            Error('No disciplinary case selected');
                        end;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Disciplinary Cases")
            {
                Caption = 'Disciplinary Cases';
                Image = "Report";
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report Report39005597;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        HREmp.Reset;
        if HREmp.Get(rec."Complaint No.") then begin
            EmpNames := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name";
        end
        else begin
            EmpNames := '';
        end;
    end;

    var
        HREmp: Record "HR Employees";
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
}
