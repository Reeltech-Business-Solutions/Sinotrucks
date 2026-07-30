page 54895 "HR Leave Reliver SubForm"
{
    PageType = ListPart;
    SourceTable = "HR Leave Reliver";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Reliver No."; Rec."Reliver No.")
                {
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Employee.Get(rec."Employee No");
                        Emp.SetFilter(Emp."No.", '<>%1', rec."Employee No");
                        Emp.SetRange(Emp."Department Code", rec."Department Code");
                        Emp.SetRange(Emp."Global Dimension 2", Employee."Global Dimension 2");
                        if PAGE.RunModal(54896, Emp) = ACTION::LookupOK then begin
                            rec."Reliver No." := Emp."No.";
                            rec.Validate("Reliver No.");
                        end;
                    end;
                }
                field("Reliver Name"; Rec."Reliver Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
    var
        Employee: Record "HR Employees";
        Emp: Record "HR Employees";
        HRLve: Record "HR Leave Application";
    //LeaveCard: Record "HR Leave Application Card;
    trigger OnOpenPage()
    begin
        if HRLve.Status = HRLve.Status::Approved then
            CurrPage.Editable := false;

        if HRLve.Status = HRLve.Status::"Pending Approval" then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if HRLve.Status = HRLve.Status::Approved then
            CurrPage.Editable := false;

        if HRLve.Status = HRLve.Status::"Pending Approval" then
            CurrPage.Editable := false;
    end;

}
