report 50101 GacCustomerReport
{
    Caption = 'GacCustomerReport';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {

            RequestFilterFields = City, Balance;
            RequestFilterHeadingML = DAN = 'Kundeliste';


            dataitem("Sales Header"; "Sales Header")
            {

                DataItemLink = "Sell-to Customer No." = field("No.");
                //DataItemTableView = sorting("No.");
                trigger OnPreDataItem()

                begin
                    Message('Sales Header PreDateItem');

                end;

                trigger OnAfterGetRecord()

                begin
                    Message(StrSubstNo('Sales Header OnAfterGetRecord %1 - %2', "No.", "Sell-to Customer No."));

                end;

                trigger OnPostDataItem()

                begin
                    Message('Sales Header OnPostDataItem');

                end;

            }
            trigger OnPreDataItem()

            begin
                Message('Customer PreDateItem');

            end;

            trigger OnAfterGetRecord()

            begin

                Message(StrSubstNo('Customer OnAfterGetRecord %1', Customer."No."));

            end;

            trigger OnPostDataItem()

            begin
                Message('Customer OnPostDataItem');

            end;

        }

        dataitem("Purchase Header"; "Purchase Header")
        {
            trigger OnPreDataItem()

            begin
                Message('Purchase Header PreDateItem');

            end;

            trigger OnAfterGetRecord()

            begin
                Message(StrSubstNo('Purchase Header OnAfterGetRecord %1 - %2', "No.", "Buy-from Vendor No."));

            end;

            trigger OnPostDataItem()

            begin
                Message('Purchase Header OnPostDataItem');

            end;

        }
    }
    var
        test: Report 1322;

    trigger OnPreReport()

    begin
        Message('OnPreReport');
    end;

    trigger OnPostReport()
    begin
        Message('OnPostReport');

    end;

    trigger OnInitReport()
    begin
        Message('OnInitReport');

    end;

}