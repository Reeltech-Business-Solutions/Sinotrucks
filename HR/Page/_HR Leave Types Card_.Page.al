page 54474 "HR Leave Types Card"
{
    PageType = Card;
    SourceTable = "HR Leave Types";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; rec.Code)
                {
                    ApplicationArea = all;
                }
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Days; rec.Days)
                {
                    ApplicationArea = all;
                }
                field("Acrue Days"; Rec."Acrue Days")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Unlimited Days"; Rec."Unlimited Days")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                }
                field(Balance; rec.Balance)
                {
                    ApplicationArea = all;
                }
                // field("Leave Category"; Rec."Leave Category")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Leave Category field.';
                // }
                field("Max Carry Forward Days"; Rec."Max Carry Forward Days")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Carry Forward Allowed"; Rec."Carry Forward Allowed")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Inclusive of Non Working Days"; Rec."Inclusive of Non Working Days")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Recurring; rec.Recurring)
                {
                    ApplicationArea = all;
                }
                field(Exam; rec.Exam)
                {
                    ApplicationArea = all;
                }
                field(Sick; rec.Sick)
                {
                    ApplicationArea = all;
                }
                field(Exception; rec.Exception)
                {
                    ApplicationArea = all;
                }
                field(Compassionate; rec.Compassionate)
                {
                    ApplicationArea = all;
                }
                field("Mat/Pat"; Rec."Mat/Pat")
                {
                    ApplicationArea = all;
                }
                field(Maternity; rec.Maternity)
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
