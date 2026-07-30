page 54705 "Employees Card"
{
    PageType = Card;
    SourceTable = "HR Employee Old";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group("General Information")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = all;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = all;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = all;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = all;
                }
                field("Known As"; Rec."Known As")
                {
                    ApplicationArea = all;
                }
                field(Initials; rec.Initials)
                {
                    ApplicationArea = all;
                }
                field(Title; rec.Title)
                {
                    ApplicationArea = all;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = all;
                }
                field("Passport Number"; Rec."Passport Number")
                {
                    ApplicationArea = all;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = all;
                }
                field(Citizenship; rec.Citizenship)
                {
                    ApplicationArea = all;
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = all;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = all;
                }
                field(County; rec.County)
                {
                    ApplicationArea = all;
                }
                field(City; rec.City)
                {
                    ApplicationArea = all;
                }
                field("Residential Address"; Rec."Residential Address")
                {
                    ApplicationArea = all;
                }
            }
            group("Personal Details")
            {
                field(Gender; rec.Gender)
                {
                    ApplicationArea = all;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = all;
                }
                field(Religion; rec.Religion)
                {
                    ApplicationArea = all;
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = all;
                }
                field(Tribe; rec.Tribe)
                {
                    ApplicationArea = all;
                }
                field("First Language (R/W/S)"; Rec."First Language (R/W/S)")
                {
                    ApplicationArea = all;
                }
                field("Second Language (R/W/S)"; Rec."Second Language (R/W/S)")
                {
                    ApplicationArea = all;
                }
                field("Additional Language"; Rec."Additional Language")
                {
                    ApplicationArea = all;
                }
                field(Disabled; rec.Disabled)
                {
                    ApplicationArea = all;
                }
                field("Disabling Details"; Rec."Disabling Details")
                {
                    ApplicationArea = all;
                }
                field("Health Assesment?"; Rec."Health Assesment?")
                {
                    ApplicationArea = all;
                }
                field("Health Assesment Date"; Rec."Health Assesment Date")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme No."; Rec."Medical Scheme No.")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Head Member"; Rec."Medical Scheme Head Member")
                {
                    ApplicationArea = all;
                }
                field("Number Of Dependants"; Rec."Number Of Dependants")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Name"; Rec."Medical Scheme Name")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Name #2"; Rec."Medical Scheme Name #2")
                {
                    ApplicationArea = all;
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = all;
                }
            }
            group("Important Dates")
            {
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = all;
                }
                field(Age; rec.Age)
                {
                    ApplicationArea = all;
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = all;
                }
                field("Length Of Service"; Rec."Length Of Service")
                {
                    ApplicationArea = all;
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = all;
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = all;
                }
                field("Time Pension Scheme"; Rec."Time Pension Scheme")
                {
                    ApplicationArea = all;
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = all;
                }
                field("Time Medical Scheme"; Rec."Time Medical Scheme")
                {
                    ApplicationArea = all;
                }
                field("Wedding Anniversary"; Rec."Wedding Anniversary")
                {
                    ApplicationArea = all;
                }
            }
            group("Contact Numbers")
            {
                field("Home Phone Number"; Rec."Home Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Cellular Phone Number"; Rec."Cellular Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = all;
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = all;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = all;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = all;
                }
            }
            group("Job Information")
            {
                field("Name Of Manager"; Rec."Name Of Manager")
                {
                    ApplicationArea = all;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = all;
                }
                field("Job Specification"; Rec."Job Specification")
                {
                    ApplicationArea = all;
                }
                field("Resource Type"; Rec."Resource Type")
                {
                    ApplicationArea = all;
                }
            }
            group("Contract Information")
            {
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = all;
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = all;
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = all;
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = all;
                }
                field("PAYE Number"; Rec."PAYE Number")
                {
                    ApplicationArea = all;
                }
                field("PIN Number"; Rec."PIN Number")
                {
                    ApplicationArea = all;
                }
                field("Served Notice Period"; Rec."Served Notice Period")
                {
                    ApplicationArea = all;
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = all;
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control70; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control71; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control72; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control73; Links)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
    }
}
