page 54504 "HR Disciplinary Cases SF"
{
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Disciplinary Cases SF';
    SourceTable = "HR Disciplinary Cases";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = all;
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = all;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                }
                field(Selected; rec.Selected)
                {
                    ApplicationArea = all;
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = all;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = all;
                }
                field("Case Discussion"; Rec."Case Discussion")
                {
                    ApplicationArea = all;
                }
                field("Mode of Lodging the Complaint"; Rec."Mode of Lodging the Complaint")
                {
                    ApplicationArea = all;
                }
                field(Accuser; rec.Accuser)
                {
                    ApplicationArea = all;
                }
                field("Witness #1"; Rec."Witness #1")
                {
                    ApplicationArea = all;
                }
                field("Witness #2"; Rec."Witness #2")
                {
                    ApplicationArea = all;
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = all;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = all;
                }
                field("Support Documents"; Rec."Support Documents")
                {
                    ApplicationArea = all;
                }
                field("Policy Guidlines In Effect"; Rec."Policy Guidlines In Effect")
                {
                    ApplicationArea = all;
                }
                field(Recomendations; rec.Recomendations)
                {
                    ApplicationArea = all;
                }
                field("HR/Payroll Implications"; Rec."HR/Payroll Implications")
                {
                    ApplicationArea = all;
                }
                field("Disciplinary Remarks"; Rec."Disciplinary Remarks")
                {
                    ApplicationArea = all;
                }
                field(Comments; rec.Comments)
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
