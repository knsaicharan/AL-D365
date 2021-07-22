/// <summary>
/// Enum CustomerCar (ID 50105).
/// </summary>
enum 50105 "CustomerCar"
{
    Extensible = true;
    value(0; None) { }
    value(1; HATCHBACK) { Caption = 'Hatchback'; }
    value(2; SUV) { Caption = 'SUV'; }
    value(3; SEDAN) { Caption = 'Sedan'; }
    value(4; CONVERTIBLE)
    {
        Caption = 'Convertible';
        ObsoleteState = Pending;
        ObsoleteReason = 'Not required this option';
        ObsoleteTag = '18.1';

    }

}