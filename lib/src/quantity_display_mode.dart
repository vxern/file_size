import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:intl/intl.dart';

/// The default quantity display mode is [SimpleQuantityDisplayMode].
const defaultQuantityDisplayMode = SimpleQuantityDisplayMode();

/// The default number format is [NumberFormat.decimalPattern].
final defaultNumberFormat = NumberFormat.decimalPattern();

/// Defines how the final quantity should be displayed, where the quantity is
/// the amount of a given unit.
abstract class QuantityDisplayMode {
  /// Returns an instance of [QuantityDisplayMode].
  const QuantityDisplayMode();

  /// Given a [quantity] and a [unit], formats it as a human-readable string.
  String format(Decimal quantity, {required Unit unit});
}

/// The quantity is displayed using basic calls to [Decimal.toString] and
/// [Decimal.toStringAsFixed].
class SimpleQuantityDisplayMode extends QuantityDisplayMode {
  /// Specifies whether to round the quantity before formatting.
  final bool round;

  /// Specifies whether to truncate the quantity before formatting.
  ///
  /// If [round] is enabled, this will have no effect.
  final bool truncate;

  /// Returns an instance of [SimpleQuantityDisplayMode].
  const SimpleQuantityDisplayMode({
    this.round = false,
    this.truncate = false,
  });

  @override
  String format(Decimal quantity, {required Unit unit}) {
    if (round) {
      quantity = quantity.round();
    }

    if (truncate) {
      quantity = quantity.truncate();
    }

    // If the quantity has no decimal part, display it like an integer.
    if (quantity.isInteger) {
      return quantity.toStringAsFixed(0);
    }

    return quantity.toString();
  }
}

/// Alias of [SimpleQuantityDisplayMode].
@Deprecated('Use [SimpleQuantityDisplayMode] instead.')
typedef SimpleDisplayMode = SimpleQuantityDisplayMode;

/// The quantity is formatted using `intl`'s [NumberFormat].
class IntlQuantityDisplayMode extends QuantityDisplayMode {
  /// The [NumberFormat] used to format the quantity.
  final NumberFormat numberFormat;

  /// A wrapper around [numberFormat] used to format the incoming [Decimal]s.
  final DecimalFormatter decimalFormatter;

  /// Returns an instance of [IntlQuantityDisplayMode].
  IntlQuantityDisplayMode({NumberFormat? numberFormat})
      : numberFormat = numberFormat ?? defaultNumberFormat,
        decimalFormatter = DecimalFormatter(numberFormat!);

  @override
  String format(Decimal quantity, {required Unit unit}) =>
      decimalFormatter.format(quantity);
}

/// A function used to format a [quantity] based on its [unit].
typedef QuantityFormatter = String Function(
  Decimal quantity, {
  required Unit unit,
});

/// The quantity passes through a custom converter to get its display format.
class CustomQuantityDisplayMode extends QuantityDisplayMode {
  /// The converter used to format the quantity.
  final QuantityFormatter converter;

  /// Returns an instance of [CustomQuantityDisplayMode].
  const CustomQuantityDisplayMode({
    required this.converter,
  });

  @override
  String format(Decimal quantity, {required Unit unit}) =>
      converter(quantity, unit: unit);
}
