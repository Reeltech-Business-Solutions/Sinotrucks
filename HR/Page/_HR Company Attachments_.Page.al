page 54535 "HR Company Attachments"
{
    Caption = 'HR Company Attachments';
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Company Attachments';
    SourceTable = "HR HMO Hospital";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field(Name; rec.Name)
                {
                    ApplicationArea = all;
                }
                label(Control1000000003)
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group("&Attachment")
            {
                Caption = '&Attachment';

                action(Open)
                {
                    Caption = 'Open';
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                    /*IF DocLink.GET("Hospital Code",Name) THEN
                        
                        BEGIN
                        IF InteractTemplLanguage.GET(DocLink."Hospital Code",DocLink."Language Code (Default)",DocLink.Name) THEN
                          InteractTemplLanguage.OpenAttachment;
                        END;
                          */
                    end;
                }
                action(Create)
                {
                    Caption = 'Create';
                    Ellipsis = true;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                    /*IF DocLink.GET("Hospital Code",Name) THEN
                        BEGIN
                        IF NOT InteractTemplLanguage.GET(DocLink."Hospital Code",DocLink."Language Code (Default)",DocLink.Name) THEN
                        BEGIN
                          InteractTemplLanguage.INIT;
                          InteractTemplLanguage."Interaction Template Code" := "Hospital Code";
                          InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                          InteractTemplLanguage.Description := Name;
                        END;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.UPDATE;
                        DocLink.Attachment:=true;
                        DocLink.MODIFY;
                        END;*/
                    end;
                }
                action("Copy &from")
                {
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."Hospital Code", rec.Name)then begin
                            /*
                           IF InteractTemplLanguage.GET(DocLink."Hospital Code",DocLink."Language Code (Default)",DocLink.Name) THEN

                           InteractTemplLanguage.CopyFromAttachment;*/
                            CurrPage.Update;
                        //DocLink.Attachment:=DocLink.Attachment::Yes;
                        //DocLink.MODIFY;
                        end;
                    end;
                }
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."Hospital Code", rec.Name)then begin
                        /*IF NOT InteractTemplLanguage.GET(DocLink.Name,DocLink."Language Code (Default)") THEN BEGIN
                              InteractTemplLanguage.INIT;
                              InteractTemplLanguage."Interaction Template Code" := "Hospital Code";
                              InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                              InteractTemplLanguage.Description := DocLink.Name;
                              InteractTemplLanguage.INSERT;
                            END;
                            InteractTemplLanguage.ImportAttachment;
                            CurrPage.UPDATE;
                            DocLink.Attachment:=true;
                            DocLink.MODIFY;  */
                        end;
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                    /*IF DocLink.GET("Hospital Code",Name) THEN
                        BEGIN
                        IF InteractTemplLanguage.GET(DocLink."Hospital Code",DocLink."Language Code (Default)",DocLink.Name) THEN
                          InteractTemplLanguage.ExportAttachment;
                        END;
                           */
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Ellipsis = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                    /*IF DocLink.GET("Hospital Code",Name) THEN
                        BEGIN
                        IF InteractTemplLanguage.GET(DocLink."Hospital Code",DocLink."Language Code (Default)",DocLink.Name) THEN BEGIN
                          InteractTemplLanguage.RemoveAttachment(TRUE);
                          DocLink.Attachment:=false;
                          DocLink.MODIFY;
                        END;
                        END;
                          */
                    end;
                }
            }
        }
    }
    var InteractTemplLanguage: Record "Interaction Tmpl. Language";
    DocLink: Record "HR HMO Hospital";
    [Scope('Cloud')]
    procedure GetDocument()Document: Text[200]begin
        Document:=rec.Name;
    end;
}
