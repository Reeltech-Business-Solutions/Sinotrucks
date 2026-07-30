tableextension 50053 "Transfer HeaderExt" extends "Transfer Header"
{
    fields
    {
        field(50000; "Approval Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = "Open","Pending Approval","Released";
            OptionCaption = 'Open,Pending Approval,Released';
            DataClassification = ToBeClassified;
        }
        field(50001; "Created By"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Created Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; "Responsibility Center"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    trigger OnInsert()
    var
        Userset: Record "User Setup";
    begin
        "Created By" := UserId;
        "Created Date" := Today;

        if Userset.Get(UserId) then
            "Responsibility Center" := Userset."Purchase Resp. Ctr. Filter";

    end;


    procedure SetSecurityFilterOnRespCenter()
    var
        UserSetupMgt: Codeunit "User Setup Management";
    begin

        if (UserSetupMgt.GetPurchasesFilter() <> '') then begin
            FilterGroup(2);
            SetRange("Responsibility Center", UserSetupMgt.GetPurchasesFilter());
            FilterGroup(0);
        end;
    end;
}
