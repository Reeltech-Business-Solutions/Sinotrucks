page 54408 "Employee Intranet List"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Employees";
    SourceTableView = WHERE(Status=CONST(Active));
    AdditionalSearchTerms = 'Employee Intranet List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("First Name"; rec."First Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Middle Name"; rec."Middle Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Last Name"; rec."Last Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Company E-Mail"; rec."Company E-Mail")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(BirthDay; BirthDay)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field(Location; rec."Global Dimension 2")
                {
                    Caption = 'Location';
                    ApplicationArea = all;
                    Editable = false;
                }
                field("Residential Address"; rec."Residential Address")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("SMS/WhatsApp Number"; rec."Cell Phone Number")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("No."; rec."No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    trigger OnOpenPage()
    begin
        //Rec.SETFILTER("Date Of Birth", '');
        Rec.SetFilter("Date Of Birth", '<>%1', 0D);
    end;
    var Birthday: Date;
    Day: Integer;
    Month: Text;
}
