page 54505 "HR Employee Attachments"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Attachments';
    SourceTable = "HR Employees";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("Employee Details")
            {
                Caption = 'Employee Details';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field(FullName; rec.FullName)
                {
                    Caption = 'Name';
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Job Description"; Rec."Job Description")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field(Gender; rec.Gender)
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = false;
                    StyleExpr = TRUE;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                    Visible = false;
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    StyleExpr = TRUE;
                }
                field("Personal E-Mail"; Rec."Personal E-Mail")
                {
                    Editable = false;
                    Enabled = false;
                    ApplicationArea = all;
                    Importance = Promoted;
                    StyleExpr = TRUE;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    Editable = false;
                    ApplicationArea = all;
                    Enabled = false;
                    StyleExpr = TRUE;
                }
            }
            part(Attachments; "HR Employee Attachments SF")
            {
                Caption = 'Employee Attachments';
                SubPageLink = "Employee No"=FIELD("No.");
                ApplicationArea = All;
            }
        }
        area(factboxes)
        {
            part(Control1102755005; "HR Employees Factbox")
            {
                SubPageLink = "No."=FIELD("No.");
                ApplicationArea = All;
            }
            systempart(Control1102755001; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Attachment)
            {
                Caption = 'Attachment';

                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    Image = Import;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."No.", CurrPage.Attachments.PAGE.GetDocument)then begin
                            if not InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)")then begin
                                InteractTemplLanguage.Init;
                                InteractTemplLanguage."Interaction Template Code":=rec."No.";
                                InteractTemplLanguage."Language Code":=DocLink."Language Code (Default)";
                                InteractTemplLanguage.Description:=DocLink."Document Description";
                                InteractTemplLanguage.Insert;
                            end;
                            InteractTemplLanguage.ImportAttachment;
                            CurrPage.Update;
                            DocLink.Attachment:=true;
                            DocLink.Modify;
                        end;
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    Image = Export;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."No.", CurrPage.Attachments.PAGE.GetDocument)then begin
                            if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)", DocLink."Document Description")then InteractTemplLanguage.ExportAttachment;
                        end;
                    end;
                }
                action(Open)
                {
                    Caption = 'Open';
                    Image = Open;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."No.", CurrPage.Attachments.PAGE.GetDocument)then begin
                            if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)", DocLink."Document Description")then InteractTemplLanguage.OpenAttachment;
                        end;
                    end;
                }
                action(Create)
                {
                    Caption = 'Create';
                    Ellipsis = true;
                    ApplicationArea = all;
                    Image = Create_Movement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."No.", CurrPage.Attachments.PAGE.GetDocument)then begin
                            if not InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)", DocLink."Document Description")then begin
                                InteractTemplLanguage.Init;
                                InteractTemplLanguage."Interaction Template Code":=rec."No.";
                                InteractTemplLanguage."Language Code":=DocLink."Language Code (Default)";
                                InteractTemplLanguage.Description:=CurrPage.Attachments.PAGE.GetDocument;
                            end;
                            InteractTemplLanguage.CreateAttachment;
                            CurrPage.Update;
                            DocLink.Attachment:=true;
                            DocLink.Modify;
                        end;
                    end;
                }
                action("Copy &from")
                {
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    ApplicationArea = all;
                    Image = Copy;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    Visible = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."No.", CurrPage.Attachments.PAGE.GetDocument)then begin
                            if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)", DocLink."Document Description")then InteractTemplLanguage.CopyFromAttachment;
                            CurrPage.Update;
                            DocLink.Attachment:=true;
                            DocLink.Modify;
                        end;
                    end;
                }
                action(Remove)
                {
                    Caption = 'Remove';
                    Ellipsis = true;
                    ApplicationArea = all;
                    Image = RemoveContacts;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."No.", CurrPage.Attachments.PAGE.GetDocument)then begin
                            if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)", DocLink."Document Description")then begin
                                InteractTemplLanguage.RemoveAttachment(true);
                                DocLink.Attachment:=false;
                                DocLink.Modify;
                            end;
                        end;
                    end;
                }
            }
        }
    }
    var InteractTemplLanguage: Record "Interaction Tmpl. Language";
    DocLink: Record "HR Employee Attachments";
    EmpNames: Text[30];
}
