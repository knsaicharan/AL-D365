/// <summary>
/// PageExtension Customerpage (ID 50100) extends Record Customer Card.
/// </summary>
pageextension 50100 Customerpage extends "Customer Card"
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

                field(CustomerDate; Rec.CustomerDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Enter the date';
                }
                field(CustomerCar; Rec.CustomerCar)
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Select the car type for customer';
                }
                field("Country Code"; Rec."Country Code")
                {
                    TableRelation = "Country/Region" where("EU Country/Region Code" = filter(<> ''));
                    ApplicationArea = All;
                    Importance = Promoted;
                    ToolTip = 'Select the Country/Region';
                }

                // field(CustomerDecimal; Rec.CustomerDecimal)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Enter the decimal value';
                //     DecimalPlaces = 2;
                //     BlankZero = true;
                // }


                // field(CustomerInteger; Rec.CustomerInteger)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Customer Integer';
                // }

                // field(CustomerSum; Rec.CustomerSum)
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Sum Of Customer Integer +  Customer Decimal';

                // }
                field(CusPostingDate; Rec.CusPostingDate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows customer latest payment posting date';



                }
                field(CusPaymentAmount; Rec.CusPaymentAmount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Shows Customer Latest Payament AMount';
                    Caption = 'Latest Payment Amount';
                    trigger OnDrillDown()
                    var
                        clelist: Page "Customer Ledger Entries";

                    begin
                        GacCustomerMgmt.GetCleFilter(CustLedgerEntry, Rec);
                        clelist.SetTableView(CustLedgerEntry);
                        clelist.LookupMode := true;
                        if clelist.RunModal() = Action::LookupOK then;

                    end;


                }
                field(EntryNumber; Rec.EntryNumber)
                {
                    ApplicationArea = All;
                    Visible = false;

                }
                field(Customertime; Rec.Customertime)
                {
                    ApplicationArea = all;
                    ToolTip = 'IF enabled shows the customer time fields';
                    Importance = Standard;
                    trigger OnValidate()
                    begin
                        Initialize();
                    end;

                }


                group(timegroup)
                {
                    Visible = ShowCustomertime;
                    ShowCaption = false;
                    field(CustomerDecimal; Rec.CustomerDecimal)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Enter the decimal value';
                        DecimalPlaces = 2;
                        BlankZero = true;
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



        }


    }
    trigger OnOpenPage()

    begin
        Initialize();
    end;

    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        GacCustomerMgmt: Codeunit "Gac Customer Mgmt";
        custsum1: Decimal;
        itempage: Page "Item Card";

        [InDataSet]
        ShowCustomertime: Boolean;


    local procedure Initialize()
    begin
        if Rec.Customertime = true then
            SetFieldVisible(true)
        else
            SetFieldVisible(false)
    end;

    local procedure SetFieldVisible(NewCustomertime: Boolean)
    begin
        ShowCustomertime := NewCustomertime;
    end;

    trigger OnAfterGetRecord()

    begin
        GacCustomerMgmt.GetCleFilter(CustLedgerEntry, Rec);
        if CustLedgerEntry.FindLast() then begin
            CustLedgerEntry.CalcFields("Amount (LCY)");
            Rec.CusPaymentAmount := CustLedgerEntry."Amount (LCY)";
            Rec.Modify();

        end;
    end;
}




