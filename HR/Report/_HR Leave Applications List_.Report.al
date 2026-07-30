report 54709 "HR Leave Applications List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './HRLeaveApplicationsList.rdl';

    dataset
    {
        dataitem("HR Leave Application"; "HR Leave Application")
        {
            RequestFilterFields = "Leave Type";

            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(HR_Leave_Application__Application_Code_; "Application Code")
            {
            }
            column(HR_Leave_Application__Application_Date_; "Application Date")
            {
            }
            column(HR_Leave_Application__Employee_No_; "Employee No")
            {
            }
            column(HR_Leave_Application__Job_Tittle_; "Job Title")
            {
            }
            column(HR_Leave_Application_Supervisor; Supervisor)
            {
            }
            column(HR_Leave_Application__Leave_Type_; "Leave Type")
            {
            }
            column(HR_Leave_Application__Days_Applied_; "Days Applied")
            {
            }
            column(HR_Leave_Application__Start_Date_; "Start Date")
            {
            }
            column(HR_Leave_Application__Return_Date_; "Return Date")
            {
            }
            column(HR_Leave_Application_Reliever; Reliever)
            {
            }
            column(HR_Leave_Application__Reliever_Name_; "Relievers Name")
            {
            }
            column(HR_Leave_ApplicationCaption; HR_Leave_ApplicationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(HR_Leave_Application__Application_Code_Caption; FieldCaption("Application Code"))
            {
            }
            column(HR_Leave_Application__Application_Date_Caption; FieldCaption("Application Date"))
            {
            }
            column(HR_Leave_Application__Employee_No_Caption; FieldCaption("Employee No"))
            {
            }
            column(HR_Leave_Application__Job_Tittle_Caption; FieldCaption("Job Title"))
            {
            }
            column(HR_Leave_Application_SupervisorCaption; FieldCaption(Supervisor))
            {
            }
            column(HR_Leave_Application__Leave_Type_Caption; FieldCaption("Leave Type"))
            {
            }
            column(HR_Leave_Application__Days_Applied_Caption; FieldCaption("Days Applied"))
            {
            }
            column(HR_Leave_Application__Start_Date_Caption; FieldCaption("Start Date"))
            {
            }
            column(HR_Leave_Application__Return_Date_Caption; FieldCaption("Return Date"))
            {
            }
            column(HR_Leave_Application_RelieverCaption; FieldCaption(Reliever))
            {
            }
            column(HR_Leave_Application__Reliever_Name_Caption; FieldCaption("Relievers Name"))
            {
            }
            column(Employee_Reliver; "Employee Reliver")
            {
            }
            column(CI_Name; CI.Name)
            {
            }
            column(CI_Address; CI.Address)
            {
            }
            column(CI_PhoneN; CI."Phone No.")
            {
            }
            column(Picture; CI.Picture)
            {
            }
            column(CI_City; CI.City)
            {
            }
            trigger OnPreDataItem()
            begin
                if GetFilter("Leave Type") = '' then Error('Please specify a leave type');
            end;
        }
    }
    requestpage
    {
        layout
        {
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport()
    begin
        CI.Reset;
        CI.Get;
        CI.CalcFields(CI.Picture);
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.FindFirst then begin
            if HREmp.Supervisor = false then begin
                HRLeaveApp.SetRange("Application Code", "HR Leave Application".GetFilter("HR Leave Application"."Application Code"));
                HRLeaveApp.SetRange("Employee No", HREmp."No.");
                if not HRLeaveApp.FindFirst then CurrReport.Quit;
            end;
        end;
    end;

    var
        HR_Leave_ApplicationCaptionLbl: Label 'HR Leave Application';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        CI: Record "Company Information";
        HRLeaveApp: Record "HR Leave Application";
        HREmp: Record "HR Employees";
}
