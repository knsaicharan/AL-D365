/// <summary>
/// Codeunit SalesOrderFields (ID 50111).
/// </summary>
codeunit 50111 SalesOrderFields
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', true, true)]
    local procedure Table36OnAfterCopySellToCustomerAddressFieldsFromCustomer(var Rec: Record "Sales Header"; var xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        SellToCustomer: Record Customer;
    begin
        SellToCustomer.get(Rec."Sell-to Customer No.");
        Rec.CustomerText := SellToCustomer.CustomerText;
        Rec.CustomerOption := SellToCustomer.CustomerOption;
        Rec.CustomerInteger := SellToCustomer.CustomerInteger;
        Rec.CustomerDecimal := SellToCustomer.CustomerDecimal;
        Rec.CustomerSum := SellToCustomer.CustomerSum;
        // Rec.CusPaymentAmount := SellToCustomer.CusPaymentAmount;
        // Rec.CusPostingDate := SellToCustomer.CusPostingDate;
        Rec."Country Code" := SellToCustomer."Country Code";
        Rec.CustomerCar := SellToCustomer.CustomerCar;
        Rec.CustomerDate := SellToCustomer.CustomerDate;
    end;

}
