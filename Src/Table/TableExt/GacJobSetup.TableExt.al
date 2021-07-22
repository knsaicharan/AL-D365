
tableextension 50100 GacJobSetup extends "Jobs Setup"
{

    fields
    {
        field(50100; "JobStatus"; Enum JobStatus)
        {
            Caption = 'JobStatus';
            DataClassification = CustomerContent;

        }


    }

}