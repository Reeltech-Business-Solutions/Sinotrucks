page 54588 "HR Job Interview Areas"
{
    PageType = ListPart;
    SourceTable = "HR Job Evaluation Areas";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("ED of Requesting Dept"; Rec."ED of Requesting Dept")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    var
//HrJbIntArea: Record "Cash Office User Template";
}
