page 54507 "HR Employee Attachments SF"
{
    Caption = 'HR Employee Attachments';
    DeleteAllowed = false;
    ApplicationArea = all;
    PageType = List;
    AdditionalSearchTerms = 'HR Employee Attachments';
    PromotedActionCategories = 'New,Process,Report,Attachments';
    SourceTable = "HR Employee Attachments";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                ShowCaption = false;

                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = all;
                }
                field("Attachment Imported"; rec.Attachment)
                {
                    ApplicationArea = all;
                    Caption = 'Attachment Imported';
                }
                field("Employee No"; Rec."Employee No")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Attachment No."; Rec."Attachment No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = all;
                }
            }
        }
    }
    actions
    {
        area(navigation)
        {
            group(Attachments)
            {
                Caption = 'Attachments';
                Visible = false;

                action(Open)
                {
                    Caption = 'Open';
                    Image = Open;
                    ApplicationArea = all;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(rec."Employee No", rec."Document Description") then begin
                            if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)") then InteractTemplLanguage.OpenAttachment;
                        end;
                    end;
                }
                //     action(Create)
                //     {
                //         Caption = 'Create';
                //         Ellipsis = true;
                //         ApplicationArea = all;
                //         Image = Create;
                //         Promoted = true;
                //         PromotedCategory = Category4;
                //         Visible = false;

                //         trigger OnAction()
                //         var
                //             InteractTemplLanguage: Record "Interaction Tmpl. Language";
                //         begin
                //             if DocLink.Get(rec."Employee No", rec."Document Description") then begin
                //                 if not InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)") then begin
                //                     InteractTemplLanguage.Init;
                //                     InteractTemplLanguage."Interaction Template Code" := rec."Employee No";
                //                     InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                //                     InteractTemplLanguage.Description := rec."Document Description";
                //                 end;
                //                 InteractTemplLanguage.CreateAttachment;
                //                 CurrPage.Update;
                //                 DocLink.Attachment := true;
                //                 DocLink.Modify;
                //             end;
                //         end;
                //     }
                //     action("Copy & From")
                //     {
                //         Caption = 'Copy & From';
                //         Ellipsis = true;
                //         Image = Copy;
                //         ApplicationArea = all;
                //         Promoted = true;
                //         PromotedCategory = Category4;
                //         Visible = false;

                //         trigger OnAction()
                //         var
                //             InteractTemplLanguage: Record "Interaction Tmpl. Language";
                //         begin
                //             if DocLink.Get(rec."Employee No", rec."Document Description") then begin
                //                 if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)") then InteractTemplLanguage.CopyFromAttachment;
                //                 CurrPage.Update;
                //                 DocLink.Attachment := true;
                //                 DocLink.Modify;
                //             end;
                //         end;
                //     }
                //     action(Import)
                //     {
                //         Caption = 'Import';
                //         Ellipsis = true;
                //         Image = Import;
                //         ApplicationArea = all;
                //         Promoted = true;
                //         PromotedCategory = Category4;
                //         PromotedIsBig = true;
                //         Visible = false;

                //         trigger OnAction()
                //         var
                //             InteractTemplLanguage: Record "Interaction Tmpl. Language";
                //         begin
                //             if DocLink.Get(rec."Employee No", rec."Document Description") then begin
                //                 if not InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)") then begin
                //                     InteractTemplLanguage.Init;
                //                     InteractTemplLanguage."Interaction Template Code" := rec."Employee No";
                //                     InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                //                     InteractTemplLanguage.Description := DocLink."Document Description";
                //                     InteractTemplLanguage.Insert;
                //                 end;
                //                 InteractTemplLanguage.ImportAttachment;
                //                 CurrPage.Update;
                //                 DocLink.Attachment := true;
                //                 DocLink.Modify;
                //             end;
                //         end;
                //     }
                //     // action("Export")
                //     // {
                //     //     Caption = 'Export';
                //     //     Ellipsis = true;
                //     //     Image = Export;
                //     //     Promoted = true;
                //     //     ApplicationArea = all;
                //     //     PromotedCategory = Category4;
                //     //     PromotedIsBig = true;
                //     //     Visible = false;

                //     //     trigger OnAction()
                //     //     var
                //     //         InteractTemplLanguage: Record "Interaction Tmpl. Language";
                //     //     begin
                //     //         if DocLink.Get(rec."Employee No", rec."Document Description")then begin
                //     //             if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)")then InteractTemplLanguage.ExportAttachment;
                //     //         end;
                //     //     end;
                //     // }
                //     action(Remove)
                //     {
                //         Caption = 'Remove';
                //         Ellipsis = true;
                //         ApplicationArea = all;
                //         Image = RemoveContacts;
                //         Promoted = true;
                //         PromotedCategory = Category4;
                //         PromotedIsBig = true;
                //         Visible = false;

                //         trigger OnAction()
                //         var
                //             InteractTemplLanguage: Record "Interaction Tmpl. Language";
                //         begin
                //             if DocLink.Get(rec."Employee No", rec."Document Description") then begin
                //                 if InteractTemplLanguage.Get(DocLink."Employee No", DocLink."Language Code (Default)") then begin
                //                     InteractTemplLanguage.RemoveAttachment(true);
                //                     DocLink.Attachment := false;
                //                     DocLink.Modify;
                //                 end;
                //             end;
                //         end;
                //     }
                // }
                // group(Attachment)
                // {
                //     Caption = 'Attachment';
                //     Image = Attachments;

                //     action(Action5)
                //     {
                //         Caption = 'Open';
                //         Image = Edit;
                //         ApplicationArea = all;
                //         Promoted = true;
                //         PromotedCategory = Process;
                //         ShortCutKey = 'Return';

                //         trigger OnAction()
                //         begin
                //             //TESTFIELD("Interaction Template Code");
                //             rec.OpenAttachment;
                //         end;
                //     }
                //     action(Action4)
                //     {
                //         Caption = 'Create';
                //         Image = New;
                //         ApplicationArea = all;
                //         Visible = false;

                //         trigger OnAction()
                //         begin
                //             //TESTFIELD("Interaction Template Code");
                //             rec.CreateAttachment;
                //         end;
                //     }
                //     action(Action3)
                //     {
                //         Caption = 'Import';
                //         Image = Import;
                //         ApplicationArea = all;
                //         Promoted = true;
                //         PromotedCategory = Process;

                //         trigger OnAction()
                //         begin
                //TESTFIELD("Interaction Template Code");
                //rec.ImportAttachment;
                //end;
            }
            action(Export)
            {
                Caption = 'Export';
                ApplicationArea = all;
                Image = Export;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //TESTFIELD("Interaction Template Code");
                    rec.ExportAttachment;
                end;
            }
            action(Action1)
            {
                Caption = 'Remove';
                Image = Cancel;
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    //TESTFIELD("Interaction Template Code");
                    rec.RemoveAttachment(false);
                end;
            }
        }
    }

    [Scope('Cloud')]
    procedure GetDocument() Document: Text[200]
    begin
        Document := rec."Document Description";
    end;

    var
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        DocLink: Record "HR Employee Attachments";
}



