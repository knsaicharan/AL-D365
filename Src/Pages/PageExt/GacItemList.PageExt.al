pageextension 50105 GacItemList extends "Item List"
{
    layout
    {
        addafter("Unit Cost")
        {
            field("Offer Price"; Rec."Offer Price")
            {
                ToolTip = 'Specifies whether offer is applied or not';
                ApplicationArea = all;
            }
        }
    }

    actions
    {
        addlast(reporting)
        //addafter("Adjust Item Cost/Price")
        {
            group(OfferPrice)
            {
                Caption = 'Offer Price';
                action("Apply Offer Price")
                {
                    Caption = 'Apply Offer Price';
                    ApplicationArea = All;
                    Image = ItemCosts;
                    ToolTip = 'Filters the items which have the Unit Cost less then mentioned amount';
                    trigger OnAction()
                    var
                        ItemCostReport: Report GacItemCostReport;
                        Item2: Record Item;

                    begin
                        ItemCostReport.RunModal();
                        ItemCostReport.GetItemDesc(Item2);
                        Rec.Copy(Item2);
                    end;
                }
            }


        }

    }
}