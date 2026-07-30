tableextension 54414 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(51534; "Product Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Product Stage"."Product Code";

            trigger OnValidate()
            begin
                IF "Document Type" = "Document Type"::Quote THEN BEGIN
                    ProductProcessingStages.RESET;
                    ProductProcessingStages.SETFILTER(ProductProcessingStages."Qoute No", "No.");
                    ProductProcessingStages.SETFILTER(Completed, '%1', TRUE);
                    IF ProductProcessingStages.FINDFIRST THEN ERROR('Product Code Cannot Be Chnaged, Because one or more stages have been completed')
                    ELSE
                    BEGIN
                        ProductProcessingStages.RESET;
                        ProductProcessingStages.SETFILTER(ProductProcessingStages."Qoute No", "No.");
                        IF ProductProcessingStages.FINDFIRST THEN ProductProcessingStages.DELETEALL;
                        ProductStageLines.RESET;
                        ProductStageLines.SETFILTER("Product Code", "Product Code");
                        IF ProductStageLines.FINDFIRST THEN REPEAT ProductProcessingStages.INIT;
                                ProductProcessingStages."Qoute No":="No.";
                                ProductProcessingStages."Line No.":=ProductStageLines."Line No.";
                                ProductProcessingStages."Stage Name":=ProductStageLines.Stage;
                                ProductProcessingStages.INSERT;
                            UNTIL ProductStageLines.NEXT = 0;
                    END;
                END;
            end;
        }
        field(51535; "No of Passports"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51536; "No. of Children"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51537; "No. of Minor"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51538; "No. of Adult"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51539; "Additional Minor"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51540; "Additional Adult"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51541; "Dependent Parent <=55"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(51542; "Dependent Parent >=56"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60010; "Unmarried Sibling"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(60011; "No Legal Claim"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    var ProductStageLines: Record "Product Stage Lines";
    ProductProcessingStages: Record "Product Processing Stages";
}
