pageextension 50104 GacItemPage extends "Item Card"
{
    layout
    {
        addlast("Costs & Posting")
        {
            group(Offer)
            {
                field("Offer Price"; Rec."Offer Price")
                {
                    ToolTip = 'Specifies whether offer is applied or not';
                    ApplicationArea = all;
                    Importance = Promoted;
                }
            }
        }

        addfirst(factboxes)
        {
            part(ItemFactbox; "GacItemFactbox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");

            }
        }

    }

    actions
    {
        addlast(reporting)
        {

            action("Apply Offer Price")
            {
                Caption = 'Apply offer Price';
                ApplicationArea = All;
                Image = ItemCosts;
                ToolTip = 'Filters the items which have the cost less then mentioned amount';

                trigger OnAction()
                var
                    ItemCostReport: Report "GacItemCostReport";

                begin

                    ItemCostReport.RunModal();

                end;
            }

        }

    }

}