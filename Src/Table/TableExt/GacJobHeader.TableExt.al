tableextension 50101 GacJobHeader extends Job
{
    fields
    {
        field(50100; "JobStatus"; Enum JobStatus)
        {
            Caption = 'Job Status';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    trigger OnInsert()
    var
        JobStatusSetup: Record "Jobs Setup";

    begin


        JobStatusSetup.Get();
        Validate(JobStatus, JobStatusSetup.JobStatus);

    end;

}

