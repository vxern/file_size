import 'package:file_size/src/quantity_display_mode.dart';
import 'package:file_size/src/unit.dart';
import 'package:file_size/src/unit_conversion.dart';

String fileSizeAsHuman(
  num quantity, {
  Unit? inputUnit,
  UnitConversion unitConversion = const BestFitConversion(),
  UnitStyle unitStyle = UnitStyle.shortUppercase,
  QuantityDisplayMode quantityDisplayMode = const FixedPrecisionDisplayMode(),
}) {
  inputUnit ??= Unit.byte;

  if (quantityDisplayMode
      case FixedPrecisionDisplayMode(precision: final precision)) {
    assert(
      0 <= precision && precision <= 20,
      'Precision must be between 0 (inclusive) and 20 (inclusive).',
    );
  }
  if (quantityDisplayMode
      case PrecisionDisplayMode(precision: final precision)) {
    assert(
      1 <= precision && precision <= 21,
      'Precision must be between 1 (inclusive) and 21 (inclusive).',
    );
  }

  final inputBits = inputUnit.quantityToBits(quantity);

  final outputUnit =
      _getOutputUnit(inputBits: inputBits, unitConversion: unitConversion);
  final outputQuantity = outputUnit.bitsToQuantity(inputBits);

  final formattedUnit = _formatUnit(
    outputUnit: outputUnit,
    unitStyle: unitStyle,
  );
  final formattedQuantity = _formatQuantity(
    outputUnit: outputUnit,
    outputQuantity: outputQuantity,
    quantityDisplayMode: quantityDisplayMode,
  );

  return '$formattedQuantity $formattedUnit';
}

Unit _getOutputUnit({
  required BigInt inputBits,
  required UnitConversion unitConversion,
}) =>
    switch (unitConversion) {
      BestFitConversion(numeralSystem: final numeralSystem) =>
        Unit.matchToSize(bits: inputBits, numeralSystem: numeralSystem),
      CustomUnitConversion(unit: final unit) => unit,
    };

String _formatUnit({
  required Unit outputUnit,
  required UnitStyle unitStyle,
}) =>
    switch (unitStyle) {
      UnitStyle.shortLowercase => outputUnit.symbols.shortLowercase,
      UnitStyle.shortUppercase => outputUnit.symbols.shortUppercase,
      UnitStyle.longLowercase => outputUnit.symbols.longLowercase,
      UnitStyle.longUppercase => outputUnit.symbols.longUppercase,
    };

String _formatQuantity({
  required Unit outputUnit,
  required num outputQuantity,
  required QuantityDisplayMode quantityDisplayMode,
}) =>
    switch (quantityDisplayMode) {
      FixedPrecisionDisplayMode(precision: final precision) =>
        outputQuantity.toStringAsFixed(precision),
      PrecisionDisplayMode(precision: final precision) =>
        outputQuantity.toStringAsPrecision(precision),
      TruncateDisplayMode() => outputQuantity.truncate().toString(),
      RoundDisplayMode() => outputQuantity.round().toString(),
      CustomQuantityDisplayMode(converter: final converter) =>
        converter(outputQuantity, unit: outputUnit),
    };
