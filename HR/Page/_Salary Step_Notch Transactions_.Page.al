page 54626 "Salary Step/Notch Transactions"
{
    ApplicationArea = all;
    PageType = List;
    SourceTable = "Salary Step/Notch Transactions";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'Salary Step/Notch Transactions';

    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = all;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = all;
                }
                field(Frequency; rec.Frequency)
                {
                    ApplicationArea = all;
                }
                field(Amount; rec.Amount)
                {
                    ApplicationArea = all;
                }
                field("% of Basic Pay"; Rec."% of Basic Pay")
                {
                    //    trigger OnValidate()
                    //    var
                    //    if 
                    ApplicationArea = all;

                }
                field(Formula; rec.Formula)
                {
                    Editable = true;
                }
                field("Annual Amount"; Rec."Annual Amount")
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
