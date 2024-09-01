import 'package:file_size/src/quantity_display_mode.dart';
import 'package:file_size/src/unit.dart';
import 'package:file_size/src/unit_conversion.dart';

/// Given a [quantity] and (optionally) an [inputUnit], formats the quantity as
/// a human-readable string.
///
/// To specify the unit the quantity is in, provide a value for [inputUnit]. By
/// default, the quantity is taken to be in bytes. For more information on
/// units, read the documentation for [Unit].
///
/// ```dart
/// // The size of our file is 1000 bytes.
/// fileSizeToString(1000); // 1 KB
///
/// // The size of our file is 300 bits.
/// fileSizeToString(300, inputUnit: Unit.bit); // 37.5 B
///
/// // Sometimes, we might know our sizes in... terabytes.
/// fileSizeToString(6, inputUnit: Unit.terabyte); // 6 TBs
/// ```
///
/// To specify how the input size is converted into a final unit, provide a
/// value for [unitConversion]. By default, the original size will be converted
/// into a unit from the decimal system it fits into best. For more information
/// on unit conversions, read the documentation for [UnitConversion].
///
/// ```dart
/// // 950 bytes do not fit into a kilobyte...
/// fileSizeToString(950); // 950 B
///
/// // ...but 1000 bytes do.
/// fileSizeToString(1000); // 1 KB
///
/// // We might want to use binary units instead:
/// fileSizeToString(
///   1024,
///   unitConversion: BestFitConversion(numeralSystem: NumeralSystem.binary),
/// ); // 1 KiB
/// ```
///
/// To specify the style which the unit will be displayed in, provide a value
/// for [unitStyle]. By default, the unit will be displayed concisely in
/// uppercase form (Kb, GB, Mb, etc.). For more information on unit styles, read
/// the documentation for [UnitStyle].
///
/// ```dart
/// fileSizeToString(1000, unitStyle: UnitStyle.shortLowercase); // 1 kb
/// fileSizeToString(1000, unitStyle: UnitStyle.shortUppercase); // 1 Kb
/// fileSizeToString(1000, unitStyle: UnitStyle.longLowercase); // 1 kbit
/// fileSizeToString(1000, unitStyle: UnitStyle.longUppercase); // 1 Kbit
/// ```
///
/// To specify the mode in which the quantity will be displayed in, provide a
/// value for [quantityDisplayMode]. By default, the quantity will be displayed
/// with a precision of up to 1 decimal place. For more information on quantity
/// display modes, read the documentation for [QuantityDisplayMode].
String fileSizeToString(
  num quantity, {
  Unit? inputUnit,
  UnitConversion unitConversion = const BestFitConversion(),
  UnitStyle unitStyle = UnitStyle.shortUppercase,
  QuantityDisplayMode quantityDisplayMode = const PrecisionDisplayMode(),
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

  final outputUnit = unitConversion.bitsToUnit(bits: inputBits);
  final outputQuantity = outputUnit.bitsToQuantity(inputBits);

  final formattedUnit = outputUnit.format(unitStyle: unitStyle);
  final formattedQuantity = _formatQuantity(
    outputUnit: outputUnit,
    outputQuantity: outputQuantity,
    quantityDisplayMode: quantityDisplayMode,
  );

  return '$formattedQuantity $formattedUnit';
}

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
