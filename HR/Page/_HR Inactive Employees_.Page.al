page 54596 "HR Inactive Employees"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Inactive Employees';
    UsageCategory = Lists;
    SourceTable = "HR Employees";
    SourceTableView = WHERE(Status=CONST(Inactive));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field(Designation; rec.Designation)
                {
                    ApplicationArea = all;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    var
                        UserSetuprec: Record "User Setup";
                    begin
                        if UserSetuprec.Get(UserId)then begin
                            if UserSetuprec."Reinstate Employee" = false then Error('You are not authorised to perform this activity please contact your user administrator');
                        end;
                    end;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = all;
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = all;
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = all;
                }
                field(Age; rec.Age)
                {
                    ApplicationArea = all;
                }
                field("Length Of Service"; Rec."Length Of Service")
                {
                    ApplicationArea = all;
                }
                field(Grade; rec.Grade)
                {
                    ApplicationArea = all;
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = all;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
}
