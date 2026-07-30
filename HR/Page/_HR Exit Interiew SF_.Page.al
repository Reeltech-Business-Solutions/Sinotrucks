page 54958 "HR Exit Interiew SF"
{
    PageType = ListPart;
    SourceTable = "HR Emp. Exit Interview Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Question; rec.Question)
                {
                    ApplicationArea = all;
                }
                field("Yes/No"; Rec."Yes/No")
                {
                    ApplicationArea = all;
                }
                field(Excellent; rec.Excellent)
                {
                    ApplicationArea = all;
                }
                field(Good; rec.Good)
                {
                    ApplicationArea = all;
                }
                field(Fair; rec.Fair)
                {
                    ApplicationArea = all;
                }
                field(Poor; rec.Poor)
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
