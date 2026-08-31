page 50380 "NRS Setup"
{
    Caption = 'NRS Setup';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "NRS Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies whether NRS e-invoicing is active. IRN generation is blocked while this is off.';
                }
                field("Business ID"; Rec."Business ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the business_id issued by the regulator when the business was registered on the e-invoicing platform.';
                }
                field("Service ID"; Rec."Service ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the NRS issued/assigned service credential (service_id).';
                }
            }
            group(Credentials)
            {
                Caption = 'API Credentials';

                field("API Key"; Rec."API Key")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the x-api-key issued to you by eTranzact / NRS.';
                }
                field(ClientSecret; ClientSecretMask)
                {
                    Caption = 'Client Secret';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                    ToolTip = 'Specifies the client secret used to sign requests. It is stored securely in Isolated Storage, not in the table.';

                    trigger OnValidate()
                    begin
                        Rec.SetClientSecret(ClientSecretMask);
                        Clear(ClientSecretMask);
                        SecretIsSet := Rec.HasClientSecret();
                        CurrPage.Update(false);
                    end;
                }
                field(SecretIsSet; SecretIsSet)
                {
                    Caption = 'Client Secret Configured';
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Indicates whether a client secret has been saved. Leave the Client Secret field blank to keep the existing value.';
                }
                field(CertificateText; CertificateText)
                {
                    Caption = 'Certificate';
                    ApplicationArea = All;
                    MultiLine = true;
                    ToolTip = 'Specifies the certificate value from your NRS crypto_keys.txt. Required only for QR code generation.';

                    trigger OnValidate()
                    begin
                        Rec.SetCertificate(CertificateText);
                    end;
                }
            }
            group(Endpoint)
            {
                Caption = 'Endpoint';

                field("Base URL"; Rec."Base URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the base URL (up to /invoice). Operation paths such as generate-irn are appended in code.';
                }
            }
            group(SupplierParty)
            {
                Caption = 'Supplier Party (for Validate)';

                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the legal name of the supplier (accounting_supplier_party).';
                }
                field("Supplier TIN"; Rec."Supplier TIN")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier TIN issued by NRS.';
                }
                field("Supplier Email"; Rec."Supplier Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier email.';
                }
                field("Supplier Telephone"; Rec."Supplier Telephone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier telephone (with country code).';
                }
                field("Supplier Business Desc."; Rec."Supplier Business Desc.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a short description of the supplier business.';
                }
                field("Supplier Street"; Rec."Supplier Street")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier street address.';
                }
                field("Supplier City"; Rec."Supplier City")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier city.';
                }
                field("Supplier Postal Zone"; Rec."Supplier Postal Zone")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier postal/ZIP code.';
                }
                field("Supplier LGA Code"; Rec."Supplier LGA Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier Local Government Area code.';
                }
                field("Supplier State Code"; Rec."Supplier State Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier State code.';
                }
                field("Supplier Country"; Rec."Supplier Country")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the supplier country code (e.g. NG).';
                }
            }
            group(Defaults)
            {
                Caption = 'Document Defaults (for Validate)';

                field("Def. Invoice Type Code"; Rec."Def. Invoice Type Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default invoice_type_code (see NRS Resources 1.6.1, e.g. 396).';
                }
                field("Def. Payment Status"; Rec."Def. Payment Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default payment_status (REJECTED, PENDING, PAID, PARTIAL).';
                }
                field("Def. Document Currency"; Rec."Def. Document Currency")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default currency code used when the invoice currency is blank (e.g. NGN).';
                }
                field("Def. Tax Category"; Rec."Def. Tax Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default tax category id (see NRS Resources 1.6.3).';
                }
                field("Def. Price Unit"; Rec."Def. Price Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default price_unit used on invoice lines (e.g. A35).';
                }
                field("Def. Payment Means Code"; Rec."Def. Payment Means Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default payment_means_code (see NRS Resources 1.6.2).';
                }
            }
            group(LineDefaults)
            {
                Caption = 'Default Line Classification';

                field("Def. HSN Code"; Rec."Def. HSN Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default HSN code for invoice lines when the item has none.';
                }
                field("Def. Product Category"; Rec."Def. Product Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default product category when the item has none.';
                }
                field("Def. ISIC Code"; Rec."Def. ISIC Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default ISIC code when the item has none.';
                }
                field("Def. Service Category"; Rec."Def. Service Category")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the default service category (required by NRS whenever an ISIC code is sent).';
                }
            }
        }
    }

    var
        [NonDebuggable]
        ClientSecretMask: Text;
        CertificateText: Text;
        SecretIsSet: Boolean;

    trigger OnOpenPage()
    begin
        Rec.GetRecordOnce();
        SecretIsSet := Rec.HasClientSecret();
        CertificateText := Rec.GetCertificate();
    end;
}
