page 54466 "HR Employee Kin SF"
{
    Caption = 'HR Employee Kin & Beneficiaries';
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Employee Kin & Beneficiaries';
    SourceTable = "HR Employee Kin";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field(Type; rec.Type)
                {
                    ApplicationArea = all;
                }
                field(Relationship; rec.Relationship)
                {
                    ApplicationArea = all;
                }
                field(SurName; rec.SurName)
                {
                    ApplicationArea = all;
                }
                field("Other Names"; Rec."Other Names")
                {
                    ApplicationArea = all;
                }
                field("ID No/Passport No"; Rec."ID No/Passport No")
                {
                    ApplicationArea = all;
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnLookup(var Text: Text): Boolean begin
                    /*
                        FrmCalendar.SetDate("Date Of Birth");
                        FrmCalendar.RUNMODAL;
                        D := FrmCalendar.GetDate;
                        CLEAR(FrmCalendar);
                        IF D <> 0D THEN
                          "Date Of Birth" := D;
                        */
                    end;
                }
                field(Occupation; rec.Occupation)
                {
                    ApplicationArea = all;
                }
                field(Address; rec.Address)
                {
                    ApplicationArea = all;
                }
                field("Office Tel No"; Rec."Office Tel No")
                {
                    ApplicationArea = all;
                }
                field("Home Tel No"; Rec."Home Tel No")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Next of Kin")
            {
                Caption = '&Next of Kin';

                action("Co&mments")
                {
                    ApplicationArea = all;
                    Caption = 'Co&mments';
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name"=CONST("Employee Relative"), "No."=FIELD("Employee Code"), "Table Line No."=FIELD("Line No.");
                }
            }
        }
    }
    var D: Date;
}
