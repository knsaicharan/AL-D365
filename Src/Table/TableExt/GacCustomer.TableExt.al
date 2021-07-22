/// <summary>
/// TableExtension Customerpage (ID 50120) extends Record Customer.
/// </summary>
tableextension 50120 Customerpage extends Customer
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
        field(50103; "Country Code"; code[20])
        {
            Caption = 'Customer\Region Code';
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

        field(50106; CustomerDecimal; Decimal)
        {
            Caption = 'Customer RunTime';
            DataClassification = CustomerContent;
            trigger OnValidate()

            begin
                CheckIsNegatiVeValue(CustomerInteger, CustomerDecimal);

            end;
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
            trigger OnValidate()

            begin
                CheckIsNegatiVeValue(CustomerInteger, CustomerDecimal);
            end;


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
            // FieldClass = FlowField;
            // CalcFormula = max("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Document Type" = FILTER(Payment), "Customer No." = field("No.")));


        }

        field(501004; EntryNumber; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Max("Cust. Ledger Entry"."Entry No." where("Customer No." = field("No.")));

        }
        field(501005; Customertime; Boolean)
        {
            Caption = 'Show Customer Time';
            DataClassification = CustomerContent;
        }

    }
    local procedure CheckIsNegatiVeValue(var a: Integer; var b: Decimal)

    begin
        if (CustomerInteger < 0) OR (CustomerDecimal < 0) then
            Error('The values cannot be negative');
        CustomerSum := CustomerInteger + CustomerDecimal;
    end;

}

