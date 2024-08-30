import 'package:file_size/src/quantity_display_mode.dart';
import 'package:file_size/src/unit_display_mode.dart';
import 'package:file_size/src/unit.dart';

String fileSize(
  num quantity, {
  Unit inputUnit = Unit.byte,
  UnitDisplayMode unitDisplayMode = const BestFitDisplayMode(),
  QuantityDisplayMode quantityDisplayMode = const FixedPrecisionDisplayMode(),
}) {
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

  final outputUnit = switch (unitDisplayMode) {
    BestFitDisplayMode() => Unit.matchToSize(bits: inputBits),
    CustomDisplayMode(unit: final unit) => unit,
  };
  final outputQuantity = outputUnit.bitsToQuantity(inputBits);

  final formattedUnit = outputUnit.symbol;
  final formattedQuantity = switch (quantityDisplayMode) {
    FixedPrecisionDisplayMode(precision: final precision) =>
      outputQuantity.toStringAsFixed(precision),
    PrecisionDisplayMode(precision: final precision) =>
      outputQuantity.toStringAsPrecision(precision),
    TruncateDisplayMode() => outputQuantity.truncate(),
    RoundDisplayMode() => outputQuantity.round(),
    CustomQuantityDisplayMode(converter: final converter) =>
      converter(outputQuantity, unit: outputUnit),
  };

  return '$formattedQuantity $formattedUnit';
}
