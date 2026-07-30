page 54640 "HR Shortlisting Lines Test"
{
    Caption = 'Shorlisted Candidates';
    Editable = false;
    ApplicationArea = all;
    PageType = List;
    SourceTable = "HR Shortlisted Applicants";
    UsageCategory = Lists;
    SourceTableView = WHERE("Shortlist Type"=CONST("Test Stage"));
    AdditionalSearchTerms = 'Shorlisted Candidates';

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field(Qualified; rec.Qualified)
                {
                    Caption = 'Qualified';
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        rec."Manual Change":=true;
                        rec.Modify;
                    end;
                }
                field("Job Application No"; Rec."Job Application No")
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
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = all;
                }
                field("Stage Score"; Rec."Stage Score")
                {
                    ApplicationArea = all;
                }
                field(Position; rec.Position)
                {
                    ApplicationArea = all;
                }
                field(Employ; rec.Employ)
                {
                    Caption = 'Employed';
                    ApplicationArea = all;
                }
                field("Reporting Date"; Rec."Reporting Date")
                {
                    ApplicationArea = all;
                }
                field("Manual Change"; Rec."Manual Change")
                {
                    Caption = 'Manual Change';
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    var MyCount: Integer;
    [Scope('Cloud')]
    procedure GetApplicantNo()AppicantNo: Code[20]begin
    //AppicantNo:=Applicant;
    end;
}
