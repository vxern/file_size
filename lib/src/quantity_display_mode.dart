import 'package:decimal/decimal.dart';
import 'package:file_size/src/unit.dart';

/// Defines how the final quantity should be displayed, where the quantity is
/// the amount of a given unit.
abstract class QuantityDisplayMode {
  /// Returns an instance of [QuantityDisplayMode].
  const QuantityDisplayMode();

  /// Given a [quantity] and a [unit], formats it as a human-readable string.
  String format(Decimal quantity, {required Unit unit});
}

/// The quantity is displayed using the standard call to [num.toString].
class SimpleDisplayMode extends QuantityDisplayMode {
  /// Specifies whether to round the quantity before formatting.
  final bool round;

  /// Specifies whether to truncate the quantity before formatting.
  ///
  /// If [round] is enabled, this will have no effect.
  final bool truncate;

  /// Returns an instance of [SimpleDisplayMode].
  const SimpleDisplayMode({this.round = false, this.truncate = false});

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
  const CustomQuantityDisplayMode({required this.converter});

  @override
  String format(Decimal quantity, {required Unit unit}) =>
      converter(quantity, unit: unit);
}
