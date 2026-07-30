page 54497 "HR Exit Interview Checklist"
{
    AutoSplitKey = true;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Exit Interview Checklist';
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Exit Interview Checklist";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;

                field("CheckList Item"; Rec."CheckList Item")
                {
                    ApplicationArea = all;
                }
                field(Cleared; rec.Cleared)
                {
                    ApplicationArea = all;
                }
                field("Clearance Date"; Rec."Clearance Date")
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

                action("&Get Checklist Items")
                {
                    Caption = '&Get Checklist Items';
                    Image = ChangeTo;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        //GET EMPLOYEES JOB TITLE
                        HREmp.Reset;
                        HREmp.SetRange(HREmp."User ID", UserId);
                        if HREmp.Find('-')then begin
                            //IMPORT CHECKLIST ITEMS
                            HRLV.Reset;
                            HRLV.SetRange(HRLV.Type, HRLV.Type::"Checklist Item");
                            HRLV.SetRange(HRLV."To be cleared by", HREmp."Job Title");
                            if HRLV.Find('-')then begin
                                HRLV.FindFirst;
                                repeat rec.Init;
                                    rec."Exit Interview No":=rec.GetFilter("Exit Interview No");
                                    rec."Employee No":=rec.GetFilter("Employee No");
                                    rec."CheckList Item":=HRLV.Code;
                                    rec."Line No":=rec."Line No" + 1000;
                                    rec.Insert;
                                until HRLV.Next = 0;
                            end
                            else
                            begin
                                Message('No checklist items have been assigned to ' + UserId);
                            end;
                        end
                        else
                        begin
                            Message('User ID ' + UserId + ' has not been assigned to any employee');
                        end;
                    end;
                }
            }
        }
    }
    var HRLV: Record "HR Lookup Values";
    HREmp: Record "HR Employees";
    JT: Code[50];
}
