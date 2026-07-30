tableextension 54411 ApprovalCommentLine extends "Approval Comment Line"
{
    fields
    {
        field(51534; "Approved Days"; Decimal)
        {
            Caption = 'Approved Days';
            DataClassification = ToBeClassified;
        }
        field(51535; "Approved Start Date"; Date)
        {
            Caption = 'Approved Start Days';
            DataClassification = ToBeClassified;
        }
        field(51536; "Approved Return Date"; Date)
        {
            Caption = 'Approved Return Date';
            DataClassification = ToBeClassified;
        }
        field(51537; Reason; Text[100])
        {
            Caption = 'Reason';
            DataClassification = ToBeClassified;
        }
        field(51538; "Leave Allowance Granted"; decimal)
        {
            Caption = 'Leave Allowance Granted';
            DataClassification = ToBeClassified;
        }
    }
}
