
page 50600 EmployeeAPI
{
    APIGroup = 'Employee';
    APIPublisher = 'Reeltech';
    APIVersion = 'v1.0';
    Caption = 'employeeAPI';
    DelayedInsert = true;
    EntityName = 'Employee';
    EntitySetName = 'Employees';
    PageType = API;
    SourceTable = Employee;
    ODataKeyFields = SystemId;
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }

                field(jobTitle; Rec."Job Title")
                {
                    Caption = 'Job_Title';
                }
                field(lastName; Rec."Last Name")
                {
                    Caption = 'Last_Name';
                }
                field("First_Name"; Rec."First Name")
                {
                    Caption = 'First_Name';
                }
                field("Job_Title"; Rec."Job Title")
                {
                    Caption = 'Job_Title';
                }
                field("Gender"; Rec.Gender)
                {
                    Caption = 'Gender';
                }
                field("company_phone_number"; Rec."Phone No.")
                {

                }
                field("Company_EMail"; LowerCase(Rec."Company E-Mail"))
                {

                }
                field("Board_Member"; Rec."Board Member")
                {

                }
                field("Manager_Role"; Rec."Manager Role")
                {

                }
                field(Nationality; Rec.Nationality)
                {

                }
                field("Department"; Rec."Global Dimension 1 Code")
                {
                    caption = 'Department';
                }
                field(Address; Rec.Address)
                {

                }

                field("Address_2"; Rec."Address 2")
                {

                }

                field(City; Rec.City)
                {

                }
                field(Image; Rec.Image)
                {


                }
                field("Post_Code"; Rec."Post Code")
                {

                }
                field("Country_Region_Code"; Rec."Country/Region Code")
                {

                }
                field("Mobile_Phone_No"; Rec."Mobile Phone No.")
                {

                }
                field("EMail"; Rec."E-Mail")
                {

                }
                field("Employment_Date"; Rec."Employment Date")
                {

                }
                field(Status; Rec.Status)
                {

                }

                field("Inactive_Date"; Rec."Inactive Date")
                {

                }
                field("Cause_of_Inactivity_Code"; Rec."Cause of Inactivity Code")
                {

                }
                field("Termination_Date"; Rec."Termination Date")
                {

                }
                field("Grounds_for_Term_Code"; Rec."Grounds for Term. Code")
                {

                }
                field("Emplymt_Contract_Code"; Rec."Emplymt. Contract Code")
                {

                }
                field("Engagement_Type"; Rec."Engagement Type")
                {

                }
                field("Birth_Date"; Rec."Birth Date")
                {

                }
                field("Social_Security_No"; Rec."Social Security No.")
                {

                }
                field("Union_Code"; Rec."Union Code")
                {

                }
                field("Union_Membership_No"; Rec."Union Membership No.")
                {

                }
                field("Currency_Code"; Rec."Currency Code")
                {

                }
                field("Bank_Branch_No"; Rec."Bank Branch No.")
                {

                }
                field("Bank_Account_No"; Rec."Bank Account No.")
                {

                }
                field(IBAN; Rec.IBAN)
                {

                }
                field(Payroll; Rec.Payroll)
                {

                }
                field("Payroll_LCY"; Rec."Payroll (LCY)")
                {

                }
                field("Payroll_Currency_Code"; Rec."Payroll Currency Code")
                {

                }
                field("Working_Type"; Rec."Working Type")
                {

                }
                field("working_hours"; Rec."Working Type")
                {

                }

                field(manager_No; Rec."Manager No.")
                {
                    Caption = 'Manager_No.';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }




            }
        }
    }
}
