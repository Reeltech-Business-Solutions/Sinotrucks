tableextension 50051 "JournalBatchExt " extends "Gen. Journal Batch"
{

    fields
    {
        // Add changes to table fields here
        field(50001; "Approval Code"; Code[20])
        {
            //to   TableRelation = "Approval code";
            DataClassification = ToBeClassified;
        }
    }




}

pageextension 50116 PageJournalBatchExt extends "General Journal Batches"
{
    layout
    {
        // Add changes to page layout here
        addafter("Bank Statement Import Format")
        {
            field("Approval Code"; Rec."Approval Code")
            {
                Caption = 'Approval Code';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;

}
