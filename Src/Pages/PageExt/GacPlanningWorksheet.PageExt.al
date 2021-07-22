pageextension 50103 GacPlanningWorksheet extends "Planning Worksheet"
{
    layout
    {

        addfirst(factboxes)
        {
            part(ItemFactbox; "GacItemFactbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No."), "Location Filter" = field("Location Code");

            }


        }


    }


}