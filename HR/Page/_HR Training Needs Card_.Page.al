page 54495 "HR Training Needs Card"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "HR Training Needs";
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
                field(Location; rec.Location)
                {
                    ApplicationArea = all;
                }
                field(Provider; rec.Provider)
                {
                    ApplicationArea = all;
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field("No. of Applicants"; Rec."No. of Applicants")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = all;
                }
                field(Posted; rec.Posted)
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field(Closed; rec.Closed)
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
            group("&Functions")
            {
                Caption = '&Functions';

                action("&Mark as Closed/Open")
                {
                    ApplicationArea = all;
                    Caption = '&Mark as Closed/Open';
                    Image = CloseDocument;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        if rec.Closed then begin
                            rec.Closed:=false;
                            Message('Training need :: %1 :: has been Re-Opened', rec.Description);
                        end
                        else
                        begin
                            rec.Closed:=true;
                            Message('Training need :: %1 :: has been closed', rec.Description);
                            rec.Modify;
                        end;
                    end;
                }
            }
        }
    }
    var D: Date;
}
