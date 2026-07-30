page 54681 "HR Confirmation KPI A"
{
    PageType = ListPart;
    SourceTable = "HR Confirmation KPI";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Objectives; rec.Objectives)
                {
                    ApplicationArea = All;
                }
                field(Weight; rec.Weight)
                {
                    ApplicationArea = All;
                }
                field("Behavioural Group"; Rec."Behavioural Group")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Ratings; rec.Ratings)
                {
                    ApplicationArea = All;
                }
                field(Score; rec.Score)
                {
                    ApplicationArea = All;
                }
                field("KPI Weighting"; Rec."KPI Weighting")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Target Score %"; Rec."Target Score %")
                {
                    Caption = 'Weight';
                    ApplicationArea = All;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnAfterGetRecord()
    begin
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", rec."Document No.");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", UserId);
        if ApprovalEntry.FindFirst then begin
            SupEditable:=true;
            EmpEditable:=false;
        end
        else
        begin
            EmpEditable:=true;
            SupEditable:=false;
        end;
    end;
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        rec."Behavioural Group":='FINANCIAL';
    end;
    trigger OnOpenPage()
    begin
        ApprovalEntry.SetRange(ApprovalEntry."Document No.", rec."Document No.");
        ApprovalEntry.SetRange(ApprovalEntry.Status, ApprovalEntry.Status::Open);
        ApprovalEntry.SetRange(ApprovalEntry."Approver ID", UserId);
        if ApprovalEntry.FindFirst then begin
            SupEditable:=true;
            EmpEditable:=false;
        end
        else
        begin
            EmpEditable:=true;
            SupEditable:=false;
        end;
    end;
    var ApprovalEntry: Record "Approval Entry";
    SupEditable: Boolean;
    EmpEditable: Boolean;
}
