page 54623 "Salary Grades List"
{
    CardPageID = "Salary Grades";
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    SourceTable = "Salary Grades";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Salary Grades List';

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                ShowCaption = false;

                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field("Salary Amount"; Rec."Salary Amount")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        FilterPage2;
    end;
    var UserSetupMgt: Codeunit "User Setup Management";
    PayrollUserMgt: Codeunit "Payroll User Mgt";
    UserSetup: Record "User Setup";
    CurGroup: Text[100];
    local procedure FilterPage2()
    var
        UserSet: Record "User Setup";
    begin
        if PayrollUserMgt.GetGradeFilter <> '' then begin
            rec.FilterGroup(2);
            rec.SetRange("Grade Classification", PayrollUserMgt.GetGradeFilter);
            CurGroup:=rec.GetFilter("Grade Classification");
            rec.FilterGroup(0);
        end;
    end;
}
