codeunit 50100 "No. Series Management"
{
    var NumberSeries: Record "Number Series";
    procedure GetSeries(NumberSeriesCode: Code[20]; var NoSeries: Code[20]; DocumentDate: Date): Boolean;
    begin
        if NumberSeries.Get(NumberSeriesCode)then begin
            NumberSeries.CalcFields(DocumentDate);
            // Convert the integer to code
            NoSeries:=Format(NumberSeries."Last No.");
            // Increment and update the Last No.
            NumberSeries."Last No.":=NumberSeries."Last No." + 1;
            NumberSeries.Modify;
            exit(true);
        end;
        exit(false);
    end;
}
