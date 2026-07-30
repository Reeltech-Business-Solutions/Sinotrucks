codeunit 50053 "SendForApproval"
{


    Access = public;
    procedure Ping(): Text
    begin
        exit('Pong');
    end;

    // procedure SendLeaveApprovalSS()

    procedure SendLeaveForApproval(leaveAppNo: code[30]): Boolean
    var
        ApprovalsMgt: Codeunit "Approval Mgt. Ext";
        LeaveAppRec: record "HR Leave Application";
        JJSONObject: JsonObject;
        Jtoken: JsonToken;
        LeaveAppResp: Code[30];
    begin

        //-------->> Read from Json

        Clear(LeaveAppResp);

        JJSONObject.ReadFrom(leaveAppNo);

        JJSONObject.get('LeaveNo', Jtoken);
        LeaveAppResp := Jtoken.AsValue().AsText();

        //-------->> Read from Json

        if LeaveAppResp <> '' then begin
            LeaveAppRec.Reset();
            LeaveAppRec.SetFilter("Application Code", '%1', LeaveAppResp);
            if LeaveAppRec.FindFirst() then begin
                if ApprovalsMgt.CheckLeaveApprovalsWorkflowEnable(LeaveAppRec) then begin
                    ApprovalsMgt.OnSendLeaveForApproval(LeaveAppRec);
                    exit(true);
                end else
                    exit(false);
            end else
                exit(false);

        end else
            exit(false);
    end;


}