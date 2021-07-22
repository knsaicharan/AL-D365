
pageextension 50101 GacJobSetup extends "Jobs Setup"
{
    layout
    {
        addlast(General)
        {
            field(JobStatus; Rec.JobStatus)
            {

                ApplicationArea = All;
                ToolTip = 'The job will be created with this status';


            }
        }

    }

}