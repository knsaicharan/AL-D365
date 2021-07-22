report 50100 GacItemCostReport
{
    Caption = 'Apply Offer Price';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Offer Price';
    //ProcessingOnly = true;
    RDLCLayout = './getitemcostreport.rdl';

    dataset
    {
        dataitem(Item; Item)
        {
            column(Unit_Cost; "Unit/Standard Cost")
            {
                DecimalPlaces = 2;


            }
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Offer_Price; "Offer Price")
            {

            }
            column(ItemDesc; ItemDesc1)
            {

            }

            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin
                CalUnitStandardCost(Item);
                ItemDesc1 := (StrSubstNo(CreatedMsg, counter, ItemDesc, "Unit/Standard Cost"));


            end;

            trigger OnPostDataItem()

            begin
                if counter = 0 then begin
                    Message('There are no items found greater than unit cost entered');
                end

            end;

        }
    }

    requestpage
    {
        SaveValues = true;


        layout
        {
            area(Content)
            {
                group(Option)
                {
                    Caption = 'Item Options';
                    field(AssigPrice; AssigPrice)
                    {
                        ApplicationArea = All;
                        Caption = 'Required Price';
                        ToolTip = 'Specifies the required price to be filled in offer price';
                        BlankZero = true;
                    }

                    field("Unit/Standard Cost"; "Unit/Standard Cost")
                    {
                        ApplicationArea = All;
                        Caption = 'Unit/Standard Cost';
                        ToolTip = 'Enter Unit Cost or Standard Cost';
                        BlankZero = true;
                    }


                }
            }
        }


    }

    var
        counter: Integer;
        ItemDesc: Text;
        ItemDesc1: Text;

        AssigPrice: Decimal;
        "Unit/Standard Cost": Decimal;

        IsreportExec: Boolean;
        CreatedMsg: Label 'Records Processed: %1  %2 for:Unit/Standard Cost %3';


    trigger OnInitReport()
    begin
        clear(counter);
    end;

    trigger OnPreReport()
    begin
        if ((AssigPrice = 0) or ("Unit/Standard Cost" = 0)) then
            Error('Assignprice or Unit/Standard Cost cannot be zero or empty');

    end;

    trigger OnPostReport()
    begin
        CurrReport.Quit();
        Message(StrSubstNo(CreatedMsg, counter, ItemDesc, "Unit/Standard Cost"));
    end;



    procedure GetItemDesc(var Item2: Record Item)

    begin
        if ItemDesc <> '' then
            Item2.SetFilter("No.", ItemDesc);
    end;

    procedure CalUnitStandardCost(var Item1: Record Item)

    begin
        if (Item1."Unit Cost" >= ("Unit/Standard Cost")) or (Item1."Standard Cost" >= ("Unit/Standard Cost")) then begin
            if ItemDesc = '' then
                ItemDesc := Item."No."

            else
                ItemDesc += Format(',' + Item."No.");
            Item."Offer Price" := AssigPrice;
            counter += 1;
            item.Modify();
        end
        else
            CurrReport.Skip();
    end;

}

