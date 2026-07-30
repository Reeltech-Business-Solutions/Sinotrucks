table 54402 "Interview Stages"
{
    Caption = 'Interview Stages';

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; "Evaluation Code"; Code[50])
        {
        }
        field(3; "Evaluation Description"; Text[250])
        {
        }
        field(4; "Evaluation Score"; Integer)
        {
        }
        field(5; Stage; Option)
        {
            Caption = 'Stage';
            OptionCaption = 'Stage1, Stage2, Stage3, Stage4';
            OptionMembers = "Stage1","Stage2","Stage3","Stage4";
        }
        field(6; Ratings; Option)
        {
            Caption = 'Ratings 1';

            OptionCaption = ''', 5-Excellent, 4-Good, 3-Average, 2-Poor';
            OptionMembers = "","5-Excellent","4-Good","3-Average","2-poor";
        }
        field(7; "Interview No."; Code[20])
        {
        }
        field(8; Job; Code[30])
        {
        }
        field(9; "Employee Code"; Code[20])
        {
        }
        field(11; Ratings2; Option)
        {
            Caption = 'Ratings2';
            OptionCaption = ''', 5-Excellent, 4-Good, 3-Average, 2-Poor';
            OptionMembers = "","5-Excellent","4-Good","3-Average","2-poor";
        }
        field(12; Ratings3; Option)
        {
            Caption = 'Ratings 3';
            OptionCaption = ''', 5-Excellent, 4-Good, 3-Average, 2-Poor';
            OptionMembers = "","5-Excellent","4-Good","3-Average","2-poor";
        }
        field(10; "Employee Name"; Text[100])
        {
        }
    }
    keys
    {
        key(PK; "Line No.", "Interview No.")
        {
        }
    }
}