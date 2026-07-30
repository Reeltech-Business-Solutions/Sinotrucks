report 54511 "HR Keep in view"
{
    DefaultLayout = RDLC;
    RDLCLayout = './HRKeepinview.rdlc';

    dataset
    {
        dataitem("Hr Interview Evaluation"; "Hr Interview Evaluation")
        {
            DataItemTableView = WHERE("Offer Status"=CONST("Keep In-view"));
            RequestFilterFields = "Job Title", "Interview Date", "Date Applied";

            column(InterviewNo_HrInterviewEvaluation; "Hr Interview Evaluation"."Interview No.")
            {
            }
            column(ApplicationNo_HrInterviewEvaluation; "Hr Interview Evaluation"."Application No.")
            {
            }
            column(FirstName_HrInterviewEvaluation; "Hr Interview Evaluation"."First Name")
            {
            }
            column(MiddleName_HrInterviewEvaluation; "Hr Interview Evaluation"."Middle Name")
            {
            }
            column(LastName_HrInterviewEvaluation; "Hr Interview Evaluation"."Last Name")
            {
            }
            column(Initial_HrInterviewEvaluation; "Hr Interview Evaluation".Initial)
            {
            }
            column(DateApplied_HrInterviewEvaluation; "Hr Interview Evaluation"."Date Applied")
            {
            }
            column(InterviewDate_HrInterviewEvaluation; "Hr Interview Evaluation"."Interview Date")
            {
            }
            column(JobTitle_HrInterviewEvaluation; "Hr Interview Evaluation"."Job Title")
            {
            }
            column(JobPosition_HrInterviewEvaluation; "Hr Interview Evaluation"."Job Position")
            {
            }
            column(picture; CompInfo.Picture)
            {
            }
            column(USERID; UserId)
            {
            }
            column(Today; Format(Today, 0, 4))
            {
            }
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
    trigger OnInitReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
    end;
    var CompInfo: Record "Company Information";
}
