import 'package:human_file_size/src/output_formatter.dart';
import 'package:human_file_size/src/quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_conversion.dart';
import 'package:human_file_size/src/unit_style.dart';
import 'package:intl/intl.dart';

/// Given a [quantity], formats the quantity as a human-readable string.
///
/// {@template humanFileSize}
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
/// To specify the mode in which the quantity will be displayed in, provide a
/// value for [quantityDisplayMode]. By default, the quantity will be displayed
/// using [SimpleQuantityDisplayMode]. For more information on quantity display
/// modes, read the documentation for [QuantityDisplayMode].
///
/// ```dart
/// humanFileSize(1000); // 1 KB
///
/// humanFileSize(1500); // 1.5 KB
///
/// humanFileSize(
///   1500,
///   quantityDisplayMode: const SimpleQuantityDisplayMode(round: true),
/// ); // 2 KB
///
/// humanFileSize(
///   1500,
///   quantityDisplayMode: const SimpleQuantityDisplayMode(truncate: true),
/// ); // 1 KB
///
/// humanFileSize(
///   1.234,
///   quantityDisplayMode: IntlQuantityDisplayMode(
///     numberFormat: NumberFormat.decimalPattern('pl'),
///   ),
/// ); // 1,234 B
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
/// To specify the method by which to obtain the output format, provide a value
/// for [outputFormatter]. By default, the output format will be
/// '{quantity} {unit}'.
///
/// ```dart
/// humanFileSize(1); // 1 B
///
/// humanFileSize(
///   1,
///   outputFormatter: const SimpleOutputFormatter(includeSpace: false),
/// ); // 1B
///
/// humanFileSize(
///   1,
///   outputFormatter: const SimpleOutputFormatter(unitFirst: true),
/// ); // B 1
/// ```
/// {@endtemplate}
String humanFileSize(
  num quantity, {
  Unit? inputUnit,
  UnitConversion unitConversion = defaultUnitConversion,
  QuantityDisplayMode quantityDisplayMode = defaultQuantityDisplayMode,
  UnitStyle unitStyle = defaultUnitStyle,
  OutputFormatter outputFormatter = defaultOutputFormatter,
}) {
  inputUnit ??= defaultUnit;
  final numberFormat = quantityDisplayMode is IntlQuantityDisplayMode
      ? quantityDisplayMode.numberFormat
      : defaultNumberFormat;

  final _FormattedInformation formatted;
  if (!quantity.isFinite) {
    formatted = _processNonFiniteFileSize(
      quantity,
      inputUnit: inputUnit,
      numberFormat: numberFormat,
      unitStyle: unitStyle,
    );
  } else {
    formatted = _processFiniteFileSize(
      quantity,
      inputUnit: inputUnit,
      unitConversion: unitConversion,
      quantityDisplayMode: quantityDisplayMode,
      unitStyle: unitStyle,
    );
  }

  return outputFormatter.format(
    quantity: formatted.quantity,
    unit: formatted.unit,
  );
}

typedef _FormattedInformation = ({String quantity, String unit});

_FormattedInformation _processNonFiniteFileSize(
  num quantity, {
  required Unit inputUnit,
  required NumberFormat numberFormat,
  required UnitStyle unitStyle,
}) {
  final String formattedQuantity;
  if (quantity.isNaN) {
    formattedQuantity = numberFormat.symbols.NAN;
  } else if (quantity.isNegative) {
    formattedQuantity =
        '${numberFormat.symbols.MINUS_SIGN}${numberFormat.symbols.INFINITY}';
  } else {
    formattedQuantity = numberFormat.symbols.INFINITY;
  }

  return (quantity: formattedQuantity, unit: unitStyle.format(inputUnit));
}

_FormattedInformation _processFiniteFileSize(
  num quantity, {
  required Unit inputUnit,
  required UnitConversion unitConversion,
  required QuantityDisplayMode quantityDisplayMode,
  required UnitStyle unitStyle,
}) {
  if (inputUnit.isIndivisible && quantity.truncate() != quantity) {
    quantity = quantity.round();
  }

  final inputBits = inputUnit.quantityToBits(quantity);

  final outputUnit =
      unitConversion.bitsToUnit(bits: inputBits.round().toBigInt());
  final outputQuantity = outputUnit.bitsToQuantity(inputBits);

  final formattedQuantity =
      quantityDisplayMode.format(outputQuantity, unit: outputUnit);
  final formattedUnit = unitStyle.format(outputUnit);

  return (quantity: formattedQuantity, unit: formattedUnit);
}

/// Alias of [humanFileSize].
const fileSizeToString = humanFileSize;

/// Adds a method [humanFileSize] to [num]s.
///
/// Usage:
///
/// ```dart
/// // Integer
/// 10.humanFileSize(); // 10 B
///
/// // Double
/// 10.0.humanFileSize(); // 10 B
/// ```
extension NumHumanFileSize on num {
  /// Takes this [num] as the quantity of data, before formatting it as a
  /// human-readable string.
  ///
  /// {@macro humanFileSize}
  String humanFileSize({
    Unit? inputUnit,
    UnitConversion unitConversion = defaultUnitConversion,
    QuantityDisplayMode quantityDisplayMode = defaultQuantityDisplayMode,
    UnitStyle unitStyle = defaultUnitStyle,
    OutputFormatter outputFormatter = defaultOutputFormatter,
  }) =>
      fileSizeToString(
        this,
        inputUnit: inputUnit,
        unitConversion: unitConversion,
        unitStyle: unitStyle,
        quantityDisplayMode: quantityDisplayMode,
        outputFormatter: outputFormatter,
      );
}
