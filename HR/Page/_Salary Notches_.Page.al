page 54625 "Salary Notches"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "Salary Notch";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Salary Notches';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Salary Notch"; Rec."Salary Notch")
                {
                    // Editable = false;
                    ApplicationArea = All;
                }
                field(Description; rec.Description)
                {
                    // Editable = false;
                    ApplicationArea = All;
                }
                field(Gross; Rec.Gross)
                {
                    ToolTip = '40% of Total';
                    Caption = 'Gross(40%)';
                    ApplicationArea = All;
                }
                field("Basic  Pay"; Rec."Basic  Pay")
                {
                    ApplicationArea = all;
                    editable = False;

                }
                field("Hourly Rate"; Rec."Hourly Rate")
                {
                    ApplicationArea = all;
                    Visible = false;
                }
                field("Salary Grade"; Rec."Salary Grade")
                {
                    ApplicationArea = all;
                }
                field(Pallative; Rec.Pallative)
                {
                    Editable = false;
                    ApplicationArea = aLL;
                }
                field("Total"; Rec."Gross Total")
                {
                    ToolTip = '40% Gross + Remaining 60%';
                    Caption = 'Gross Total';
                    ApplicationArea = all;
                    Editable = False;
                }
                field("Annual Salary Amount"; Rec."Annual Salary Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }

            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Notch)
            {
                Caption = 'Notch';


                separator(Action1102755015)
                {
                }
                action("Update All Employees Transactions")
                {
                    Caption = 'Update All Employees Transactions';
                    Image = UpdateDescription;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to update all employees in this salary step/notch with the changes?', false) = false then exit;
                        Employee.Reset;
                        Employee.SetRange(Employee."Salary Grade", rec."Salary Grade");
                        Employee.SetRange(Employee."Salary Notch/Step", rec."Salary Notch");
                        if Employee.Find('-') then begin
                            repeat
                                Employee.Validate(Employee."Salary Notch/Step");
                                Employee.Modify;
                            until Employee.Next = 0;
                        end;
                        Message('Update completed successfully.');
                    end;
                }
                action(Transactions)
                {
                    Caption = 'Transactions';
                    Image = Trace;
                    Promoted = true;
                    RunObject = Page "Salary Step/Notch Transactions";
                    RunPageLink = "Salary Grade" = FIELD("Salary Grade"), "Salary Step/Notch" = FIELD("Salary Notch");
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        Employee: Record "HR-Employee";
}
