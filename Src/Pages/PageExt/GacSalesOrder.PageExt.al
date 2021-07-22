/// <summary>
/// PageExtension Sales_order (ID 50106) extends Record Sales Order.
/// </summary>
pageextension 50106 Sales_order extends "Sales Order"
{
    layout
    {
        addafter(General)
        {
            group(CustomerCustomFields)
            {
                field("Customer Text"; Rec.CustomerText)
                {

                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer text.';

                }

                field("CustomerOption"; Rec.CustomerOption)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer option.';
                }
                field(CustomerDecimal; Rec.CustomerDecimal)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the decimal value';
                }
                field(CustomerDate; Rec.CustomerDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the date';
                }
                field(CustomerCar; Rec.CustomerCar)
                {
                    ApplicationArea = All;
                    ToolTip = 'Select the car type for customer';
                }
                field("Country Code"; Rec."Country Code")
                {
                    TableRelation = "Country/Region" where("EU Country/Region Code" = filter(<> ''));
                    ApplicationArea = All;
                    ToolTip = 'Select the Country/Region';
                }


                field(CustomerInteger; Rec.CustomerInteger)
                {
                    ApplicationArea = All;
                    ToolTip = 'Customer Integer';


                }
                field(CustomerSum; Rec.CustomerSum)
                {
                    ApplicationArea = All;
                    ToolTip = 'Sum Of Customer Integer +  Customer Decimal';



                }




            }

        }

        addfirst(factboxes)
        {
            part(DimensionSetEntryFactbox; "Dimension Set Entries FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Dimension Set ID" = field("Dimension Set ID");

            }
        }
    }
    var
        GacSalesFieldsMgmt: Codeunit "SalesOrderFields";

    trigger OnAfterGetRecord()
    begin
        GacSalesFieldsMgmt.Run()

    end;


}