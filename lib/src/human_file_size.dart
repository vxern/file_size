import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_conversion.dart';
import 'package:human_file_size/src/unit_style.dart';

/// Given a [quantity], formats the quantity as a human-readable string.
///
/// To specify the unit the quantity is in, provide a value for [inputUnit]. By
/// default, the quantity is taken to be in bytes. For more information on
/// units, read the documentation for [Unit].
///
/// ```dart
/// // The size of our file is 1000 bytes.
/// humanFileSize(1000); // 1 KB
///
/// // The size of our file is 300 bits.
/// humanFileSize(300, inputUnit: Unit.bit); // 37.5 B
///
/// // Sometimes, we might know our sizes in... terabytes.
/// humanFileSize(6, inputUnit: Unit.terabyte); // 6 TB
/// ```
///
/// To specify how the input size is converted into a final unit, provide a
/// value for [unitConversion]. By default, the original size will be converted
/// into a unit from the decimal system it fits into best. For more information
/// on unit conversions, read the documentation for [UnitConversion].
///
/// ```dart
/// // 950 bytes do not fit into a kilobyte...
/// humanFileSize(950); // 950 B
///
/// // ...but 1000 bytes do.
/// humanFileSize(1000); // 1 KB
///
/// // We might want to use binary units instead:
/// humanFileSize(
///   1024,
///   unitConversion: const BestFitConversion(numeralSystem: BinarySystem()),
/// ); // 1 KiB
/// ```
///
/// To specify the style which the unit will be displayed in, provide a value
/// for [unitStyle]. By default, the unit will be displayed concisely in
/// uppercase form (Kb, GB, Mb, etc.). For more information on unit styles, read
/// the documentation for [UnitStyle].
///
/// ```dart
/// humanFileSize(1000, unitStyle: const ShortLowercaseStyle()); // 1 kB
///
/// // This is the default.
/// humanFileSize(1000, unitStyle: const ShortUppercaseStyle()); // 1 KB
///
/// humanFileSize(1000, unitStyle: const LongLowercaseStyle()); // 1 kbyte
///
/// humanFileSize(1000, unitStyle: const LongUppercaseStyle()); // 1 Kbyte
/// ```
///
/// To specify the mode in which the quantity will be displayed in, provide a
/// value for [quantityDisplayMode]. By default, the quantity will be displayed
/// using [SimpleDisplayMode]. For more information on quantity display modes,
/// read the documentation for [QuantityDisplayMode].
///
/// ```dart
/// humanFileSize(1000); // 1 KB
///
/// humanFileSize(1500); // 1.5 KB
///
/// humanFileSize(
///   1500,
///   quantityDisplayMode: const SimpleDisplayMode(round: true),
/// ); // 2 KB
///
/// humanFileSize(
///   1500,
///   quantityDisplayMode: const SimpleDisplayMode(truncate: true),
/// ); // 1 KB
///
/// humanFileSize(
///   1000,
///   quantityDisplayMode: CustomQuantityDisplayMode(
///     converter: (quantity, {required unit}) {
///       // Convert your quantity into a human-readable string here.
///     },
///   ),
/// );
/// ```
String humanFileSize(
  num quantity, {
  Unit? inputUnit,
  UnitConversion unitConversion = defaultUnitConversion,
  UnitStyle unitStyle = defaultUnitStyle,
  QuantityDisplayMode quantityDisplayMode = defaultQuantityDisplayMode,
}) {
  inputUnit ??= defaultUnit;

  if (!quantity.isFinite) {
    final String formattedQuantity;
    if (quantity.isNaN) {
      formattedQuantity = 'NaN';
    } else if (quantity.isNegative) {
      formattedQuantity = '-∞';
    } else {
      formattedQuantity = '∞';
    }

    final formattedUnit = unitStyle.format(inputUnit);

    return '$formattedQuantity $formattedUnit';
  }

  if (inputUnit.isIndivisible && quantity.truncate() != quantity) {
    quantity = quantity.round();
  }

  final output = _processUnitInformation(
    quantity,
    inputUnit: inputUnit,
    unitConversion: unitConversion,
  );

  return _formatFileSize(
    output.quantity,
    unit: output.unit,
    unitStyle: unitStyle,
    quantityDisplayMode: quantityDisplayMode,
  );
}

({Decimal quantity, Unit unit}) _processUnitInformation(
  num quantity, {
  required Unit inputUnit,
  required UnitConversion unitConversion,
}) {
  final inputBits = inputUnit.quantityToBits(quantity);

  final outputUnit =
      unitConversion.bitsToUnit(bits: inputBits.round().toBigInt());
  final outputQuantity = outputUnit.bitsToQuantity(inputBits);

  return (quantity: outputQuantity, unit: outputUnit);
}

String _formatFileSize(
  Decimal quantity, {
  required Unit unit,
  required UnitStyle unitStyle,
  required QuantityDisplayMode quantityDisplayMode,
}) {
  final formattedUnit = unitStyle.format(unit);
  final formattedQuantity = quantityDisplayMode.format(quantity, unit: unit);

  return '$formattedQuantity $formattedUnit';
}

/// Alias of [humanFileSize].
const fileSizeToString = humanFileSize;
