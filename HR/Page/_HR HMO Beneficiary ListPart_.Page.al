page 54659 "HR HMO Beneficiary ListPart"
{
    Caption = 'Beneficiaries';
    PageType = ListPart;
    SourceTable = "HR HMO Beneficiary";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff No."; Rec."Staff No.")
                {
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
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
                field(Active; rec.Active)
                {
                    ApplicationArea = all;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = all;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = all;
                }
                field(Relationship; rec.Relationship)
                {
                    ApplicationArea = all;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action("Show Active")
            {
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.SetFilter(Active, '=%1', true);
                end;
            }
            action(Picture)
            {
                ApplicationArea = All;
                RunObject = Page "Hr Hmo Picture";
                RunPageLink = "Staff No."=FIELD("Staff No."), "Line No."=FIELD("Line No.");
            }
        }
    }
    trigger OnQueryClosePage(CloseAction: Action): Boolean begin
        rec.CheckActive;
    end;
}
