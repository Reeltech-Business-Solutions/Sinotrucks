page 54540 "HR Leave Application Comments"
{
    PageType = Card;
    SourceTable = "Approval Comment Line";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(DocType; DocType)
            {
                Editable = false;
                ApplicationArea = all;
                OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,None,Payment Voucher,Petty Cash,Imprest,Requisition,ImprestSurrender,Interbank,Receipt,Staff Claim,Staff Advance,AdvanceSurrender,Bank Slip,Grant,Grant Surrender,Employee Requisition,Leave Application,Training Application,Transport Requisition';
            }
            field(DocNo; DocNo)
            {
                Editable = false;
                ApplicationArea = all;
            }
            repeater(Control1102755000)
            {
                ShowCaption = false;

                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field("Date and Time"; Rec."Date and Time")
                {
                    ApplicationArea = all;
                }
                field(Comment; rec.Comment)
                {
                    ApplicationArea = all;
                }
                field("Approved Days"; Rec."Approved Days")
                {
                    ApplicationArea = all;
                }
                field("Approved Start Date"; Rec."Approved Start Date")
                {
                    ApplicationArea = all;
                }
                field("Approved Return Date"; Rec."Approved Return Date")
                {
                    ApplicationArea = all;
                }
                field(Reason; rec.Reason)
                {
                    ApplicationArea = all;
                }
                field("Leave Allowance Granted"; Rec."Leave Allowance Granted")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
    }
    var NewTableId: Integer;
    NewDocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, "Bank Slip", Grant, "Grant Surrender", "Employee Requisition", "Leave Application", "Training Application";
    NewDocumentNo: Code[20];
    DocType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, "Bank Slip", Grant, "Grant Surrender", "Employee Requisition", "Leave Application", "Training Application";
    DocNo: Code[20];
    [Scope('Cloud')]
    procedure SetUpLine(TableId: Integer; DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, "Bank Slip", Grant, "Grant Surrender", "Employee Requisition", "Leave Application", "Training Application"; DocumentNo: Code[20])
    begin
        NewTableId:=TableId;
        NewDocumentType:=DocumentType;
        NewDocumentNo:=DocumentNo;
    end;
    [Scope('Cloud')]
    procedure Setfilters(TableId: Integer; DocumentType: Option Quote, "Order", Invoice, "Credit Memo", "Blanket Order", "Return Order", "None", "Payment Voucher", "Petty Cash", Imprest, Requisition, ImprestSurrender, Interbank, Receipt, "Staff Claim", "Staff Advance", AdvanceSurrender, "Bank Slip", Grant, "Grant Surrender", "Employee Requisition", "Leave Application", "Training Application"; DocumentNo: Code[20])
    begin
        if TableId <> 0 then begin
            rec.FilterGroup(2);
            rec.SetCurrentKey("Table ID", "Document Type", "Document No.");
            rec.SetRange("Table ID", TableId);
            rec.SetRange("Document Type", DocumentType);
            if DocumentNo <> '' then rec.SetRange("Document No.", DocumentNo);
            rec.FilterGroup(0);
        end;
        DocType:=DocumentType;
        DocNo:=DocumentNo;
    end;
}
