page 54501 "HR Transport Allocation"
{
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Functions';
    SourceTable = "HR Transport Allocations H";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    ApplicationArea = all;
                }
                field("Destination(s)"; Rec."Destination(s)")
                {
                    ApplicationArea = all;
                }
                field("Vehicle Reg Number"; Rec."Vehicle Reg Number")
                {
                    ApplicationArea = all;
                }
                field("Passenger Capacity"; Rec."Passenger Capacity")
                {
                    ApplicationArea = all;
                }
                field("Assigned Driver"; Rec."Assigned Driver")
                {
                    ApplicationArea = all;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = all;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Date of Allocation"; Rec."Date of Allocation")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = all;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = all;
                }
                field("Time of Trip"; Rec."Time of Trip")
                {
                    ApplicationArea = all;
                }
                field(Comments; rec.Comments)
                {
                    ApplicationArea = all;
                }
                field("Linked to Invoice No"; Rec."Linked to Invoice No")
                {
                    ApplicationArea = all;
                }
                field("<Invoice Posting Description>"; Rec."Invoice Description")
                {
                    ApplicationArea = all;
                    Caption = 'Invoice Posting Description';
                    Editable = false;
                }
                field(Status; rec.Status)
                {
                    Importance = Promoted;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                    ApplicationArea = all;
                }
            }
            part("Passenger List"; "HR Transport Requisition Pass")
            {
                ApplicationArea = All;
                Caption = 'Passenger List';
                SubPageLink = "Allocation No"=FIELD("Transport Allocation No");
            }
            group("Closing Remarks")
            {
                Caption = 'Closing Remarks';

                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = all;
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = all;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = all;
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = all;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part("HR Transport Allocations Factbo"; "HR Transport Alloc. Factbox")
            {
                ApplicationArea = All;
                Caption = 'HR Transport Allocations Factbox';
                SubPageLink = "Transport Allocation No"=field("Transport Allocation No");
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
                    Caption = '&Print';
                    Image = PrintForm;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;

                    trigger OnAction()
                    begin
                        HRTransportAllocationsH.Reset;
                        HRTransportAllocationsH.SetRange(HRTransportAllocationsH."Transport Allocation No", rec."Transport Allocation No");
                        if HRTransportAllocationsH.Find('-')then REPORT.Run(39003929, true, true, HRTransportAllocationsH);
                    end;
                }
                action("<Action1102755035>p")
                {
                    Caption = 'Re-Open';
                    ApplicationArea = all;
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
                    Caption = 'Release';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = all;

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
    }
    var HRTransportAllocationsH: Record "HR Transport Allocations H";
    Text19021002: Label 'Passenger List';
    Text001: Label 'Are you sure you want to Release this Document?';
    Question: Text;
}
