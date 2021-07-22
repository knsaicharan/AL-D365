pageextension 50102 GacJob extends "Job Card"
{
    layout
    {
        modify(Status)
        {
            Visible = false;
            Caption = 'Standard job status';
        }
        addlast(Posting)
        {
            field(JobStatus; Rec.JobStatus)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the status which is given in job';


            }

        }


    }

}

