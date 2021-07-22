/// <summary>
/// TableExtension SalesShipmentHeaderExt (ID 50112) extends Record Sales Shipment Header.
/// </summary>
tableextension 50112 SalesShipmentHeaderExt extends "Sales Shipment Header"
{

    fields
    {

        field(50101; CustomerText; Text[20])
        {
            Caption = 'Customer Text';
            DataClassification = CustomerContent;
        }
        field(50102; CustomerOption; Option)
        {
            Caption = 'Customer Option';
            OptionMembers = " ","Normal","Premium";
            DataClassification = CustomerContent;


        }

        field(50104; CustomerDate; Date)
        {
            Caption = 'Customer Date';
            DataClassification = CustomerContent;
        }
        field(50105; CustomerCar; Enum "CustomerCar")
        {
            Caption = 'Customer Car';
            DataClassification = CustomerContent;


        }
        field(50106; "Country Code"; code[20])
        {
            Caption = 'Customer\Region Code';
            DataClassification = CustomerContent;

        }
        field(50107; ContactPerson; Option)
        {
            Caption = 'CustomerResource';
            OptionMembers = "","Resource";
            DataClassification = CustomerContent;

        }
        field(50108; CustomerInteger; Integer)
        {
            Caption = 'Customer SetupTime';
            DataClassification = CustomerContent;

        }
        field(50103; CustomerDecimal; Decimal)
        {
            Caption = 'Customer RunTime';
            DataClassification = CustomerContent;

        }
        field(50109; CustomerSum; Decimal)
        {
            Caption = 'Customer Setup+RunTime';
            Editable = false;
            DataClassification = CustomerContent;


        }
        field(501001; CusPostingDate; Date)
        {
            Caption = 'Latest Payment Posting Date';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Posting Date" WHERE("Document Type" = FILTER(Payment), "Customer No." = field("No.")));
        }


        field(501002; CusPaymentAmount; Decimal)
        {
            Caption = 'Latest Payment Amount';
            Editable = false;


        }
    }



}
