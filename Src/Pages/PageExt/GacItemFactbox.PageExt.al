page 50100 GacItemFactbox
{
    Caption = 'ItemDetails - Inventory';
    Editable = False;
    PageType = CardPart;
    SourceTable = "Item";

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Item No.';
            }

            field("Qty. on Prod. Order"; Rec."Qty. on Prod. Order")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Prod. Order';

            }
            field("Qty. on Purch. Order"; Rec."Qty. on Purch. Order")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Purch. Order';

            }
            field("Qty. on Sales Order"; Rec."Qty. on Sales Order")
            {

                ApplicationArea = All;
                Caption = 'Qty. on Sales Order';

            }
            field("Qty. on Job Order"; Rec."Qty. on Job Order")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Job Order';

            }
            field("Qty. on Component Lines"; Rec."Qty. on Component Lines")
            {
                ApplicationArea = All;
                Caption = 'Qty. on Component Lines';

            }
        }

    }


}






