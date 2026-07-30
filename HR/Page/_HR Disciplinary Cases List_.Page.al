page 54550 "HR Disciplinary Cases List"
{
    CardPageID = "HR Disciplinary Cases";
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Disciplinary Cases List';
    SourceTable = "HR Employees";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field(EmpNames; EmpNames)
                {
                    ApplicationArea = all;
                    Caption = 'Name';
                    Editable = false;
                    Importance = Promoted;
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = all;
                    Editable = false;
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
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Enabled = false;
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
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", rec."No.");
                        if HRDisciplinary.Find('-')then begin
                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number:=0;
                            Number:=HRDisciplinary.Count;
                            if Number > 1 then begin
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
}
