page 54549 "HR Transport Allocations List"
{
    CardPageID = "HR Transport Allocation";
    ApplicationArea = all;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Transport Allocations H";
    AdditionalSearchTerms = 'HR Transport Allocations List';
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Destination(s)"; Rec."Destination(s)")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Vehicle Reg Number"; Rec."Vehicle Reg Number")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Assigned Driver"; Rec."Assigned Driver")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Date of Allocation"; Rec."Date of Allocation")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field(Comments; rec.Comments)
                {
                }
                field("Linked to Invoice No"; Rec."Linked to Invoice No")
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                }
                field("<Invoice Posting Description>"; Rec."Invoice Description")
                {
                    Caption = 'Invoice Posting Description';
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; rec.Status)
                {
                    ApplicationArea = all;
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
            }
        }
        area(factboxes)
        {
            part("HR Transport Allocations Factbo"; "HR Transport Alloc. Factbox")
            {
                Caption = 'HR Transport Allocations Factbox';
                SubPageLink = "Transport Allocation No"=FIELD("Transport Allocation No");
                ApplicationArea = All;
            }
            systempart(Control1102755006; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';

                action("&Print")
                {
                    ApplicationArea = all;
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        HRTransportAllocationsH.Reset;
                        HRTransportAllocationsH.SetRange(HRTransportAllocationsH."Transport Allocation No", rec."Transport Allocation No");
                        if HRTransportAllocationsH.Find('-')then REPORT.Run(39003929, true, true, HRTransportAllocationsH);
                    end;
                }
                action("<Action1102755035>p")
                {
                    ApplicationArea = all;
                    Caption = 'Re-Open';
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        rec.Status:=rec.Status::Open;
                        rec.Modify;
                        Message('Transport Allocation No :: :: has been Re-Opened', rec."Transport Allocation No");
                    end;
                }
                action(Release)
                {
                    ApplicationArea = all;
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Question:=Text001;
                        if Confirm(Question)then begin
                            rec.Status:=rec.Status::Released;
                            rec.Modify;
                            Message('Transport Allocation No :: :: has been released', rec."Transport Allocation No");
                        end
                        else
                        begin
                            Message('You selected :: NO :: Release Cancelled');
                        end;
                    end;
                }
            }
        }
        area(reporting)
        {
            action("Transport Allocations")
            {
                ApplicationArea = all;
                Caption = 'Transport Allocations';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "HR Transport Allocations";
            }
        }
    }
    var HRTransportAllocationsH: Record "HR Transport Allocations H";
    Text19021002: Label 'Passenger List';
    Text001: Label 'Are you sure you want to Release this Document?';
    Question: Text;
}
