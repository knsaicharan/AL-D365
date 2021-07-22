/// <summary>
/// PageExtension Sales_Invoice_Header (ID 50115) extends Record Posted Sales Invoice.
/// </summary>
pageextension 50115 Sales_Invoice_Header extends "Posted Sales Invoice"
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
                    Editable = false;


                }
                field(CustomerSum; Rec.CustomerSum)
                {
                    ApplicationArea = All;
                    ToolTip = 'Sum Of Customer Integer +  Customer Decimal';



                }



            }


        }
    }

}


