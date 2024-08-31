import 'package:file_size/src/unit.dart';

sealed class UnitConversion {
  const UnitConversion._();
}

final class BestFitConversion extends UnitConversion {
  final NumeralSystem numeralSystem;

  const BestFitConversion({
    this.numeralSystem = NumeralSystem.decimal,
  }) : super._();
}

final class CustomUnitConversion extends UnitConversion {
  final Unit unit;

  const CustomUnitConversion({required this.unit}) : super._();
}
