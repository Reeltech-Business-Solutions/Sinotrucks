permissionset 50180 "NRS E-Invoicing"
{
    Assignable = true;
    Caption = 'NRS E-Invoicing';

    Permissions =
        tabledata "NRS Setup" = RIMD,
        tabledata "NRS IRN Log" = RIMD,
        tabledata "NRS Cue" = RIMD,
        tabledata "NRS QR Buffer" = RIMD,
        tabledata Customer = R,
        tabledata Item = R,
        table "NRS Setup" = X,
        table "NRS IRN Log" = X,
        table "NRS Cue" = X,
        table "NRS QR Buffer" = X,
        codeunit "NRS E-Invoice Mgt." = X,
        codeunit "NRS Validate Invoice Mgt." = X,
        report "NRS E-Invoice" = X,
        page "NRS Setup" = X,
        page "NRS IRN Log" = X,
        page "NRS Activities" = X,
        page "NRS E-Invoicing RC" = X,
        page "NRS QR Code" = X,
        page "NRS E-Invoices" = X,
        page "NRS E-Invoice Card" = X;
}
