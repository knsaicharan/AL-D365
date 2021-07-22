
codeunit 50125 "Gac Customer Mgmt"
{

    procedure GetCleFilter(Var cle: Record "Cust. Ledger Entry"; Rec: Record Customer)
    var
        myInt: Integer;
    begin
        cle.SetRange("Customer No.", Rec."No.");
        cle.SetRange("Document Type", cle."Document Type"::Payment);

    end;

}