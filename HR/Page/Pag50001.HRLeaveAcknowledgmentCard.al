page 54664 "HR Leave Acknowledgement"
{
    PageType = Card;
    SourceTable = "HR Leave Acknowledgement";
    PromotedActionCategories = 'New,Process,Report,Functions,Comments';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Leave No."; Rec."Leave No.")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Pending);
                    end;

                }
                field("Employee No."; Rec."Employee No.")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    Caption = 'Approved Days';
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Start Date"; Rec."Start Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Return Date"; Rec."Return Date")
                {
                    Editable = false;
                    ApplicationArea = all;
                }
                field("Actual Days Spent"; Rec."Actual Days Spent")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Pending);
                    end;

                }
                field("Actual Return Day"; Rec."Actual Return Day")
                {
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Pending);
                    end;

                }
                field(Comment; rec.Comment)
                {
                    MultiLine = true;
                    ApplicationArea = all;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Rec.Status, Rec.Status::Pending);
                    end;

                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Status; rec.Status)
                {
                    Editable = false;
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = aLL;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Action14)
            {
                action("Update Leave Application")
                {
                    Image = UpdateDescription;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        HREMP: Record "HR Employees";
                        LeaveLedger: Record "HR Leave Ledger Entries";
                        LeaveApp: Record "HR Leave Application";
                    begin
                        rec.TestField(Status, rec.Status::Approved);
                        if Confirm('Are you sure you want to update leave?') then begin
                            if LeaveApp.Get(rec."Leave No.") then begin
                                LeaveApp."Days Applied" := Rec."Actual Days Spent";
                                LeaveApp.Status := LeaveApp.Status::Resumed;
                                rec.Status := rec.Status::Updated;
                                if HREMP.Get(rec."Employee No.") then begin
                                    HREMP."Leave Status" := HREMP."Leave Status"::Resumed;
                                    HREMP.Modify();
                                    LeaveApp.Modify();
                                    Message('Leave Application Updated');
                                end;
                            end;
                            //  end;

                        end else
                            exit;
                    end;

                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    ApplicationArea = all;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to send this document for approval';
                    begin
                        if ApprovalsMgmt.CheckLeaveAcknwApprovalsWorkflowEnable(Rec) then
                            ApprovalsMgmt.OnSendLeaveAcknwForApproval(Rec);

                    end;
                }
                action("Cancel Approval Request")
                {
                    Caption = 'Cancel Approval Request';
                    Image = CancelApprovalRequest;
                    ApplicationArea = All;
                    PromotedCategory = Process;
                    Promoted = true;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    begin
                        ApprovalsMgmt.OnCancelLeaveAcknwForApproval(Rec);
                    end;
                }
                action(Approvals)
                {
                    Caption = 'Approvals';
                    Image = Approvals;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        ApprovDocType: Enum "Approval Document Type";
                    begin
                        ApprovalEntries.Setrecordfilters(DATABASE::"HR Leave Acknowledgement", ApprovDocType::LaveAckn, rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if rec.Status = rec.Status::Updated then
            CurrPage.Editable := false;

        if rec.Status = rec.Status::"Pending Approval" then
            CurrPage.Editable := false;


    end;

    trigger OnAfterGetRecord()
    begin

    end;



    var
        ApprovalsMgmt: Codeunit "Approval Mgt. Ext";
        ApprovalEntries: page "Approval Entries";
        HREMP: Record "HR Employees";

}
