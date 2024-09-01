import 'package:file_size/src/unit.dart';

/// Defines how the final quantity should be displayed, where the quantity is
/// the amount of a given unit.
abstract class QuantityDisplayMode {
  /// Returns an instance of [QuantityDisplayMode].
  const QuantityDisplayMode();

  /// Given a [quantity] and a [unit], formats it as a human-readable string.
  String format(num quantity, {required Unit unit});
}

/// The quantity is displayed using the standard call to [num.toString].
class SimpleDisplayMode extends QuantityDisplayMode {
  /// Specifies whether to round the quantity before formatting.
  ///
  /// If used in conjunction with [truncate], the value will be first rounded,
  /// then truncated.
  final bool round;

  /// Specifies whether to truncate the quantity before formatting.
  ///
  /// If used in conjunction with [round], the value will be first rounded, then
  /// truncated.
  final bool truncate;

  /// Returns an instance of [SimpleDisplayMode].
  const SimpleDisplayMode({this.round = false, this.truncate = false});

  @override
  String format(num quantity, {required Unit unit}) {
    if (round) {
      quantity = quantity.round();
    }

    if (truncate) {
      quantity = quantity.truncate();
    }

    if (quantity == 0) {
      return quantity.toStringAsFixed(0);
    }

    return quantity.toString();
  }
}

/// The quantity is displayed with a fixed precision.
///
/// For example, with a [precision] of 3, a quantity 10.93214 will be displayed
/// as '10.932', meanwhile 10 will be displayed as '10.000'.
class FixedPrecisionDisplayMode extends QuantityDisplayMode {
  /// The fixed precision to display the quantity with.
  ///
  /// The value must be between 0 (inclusive) and 20 (inclusive).
  final int precision;

  /// Returns an instance of [FixedPrecisionDisplayMode].
  const FixedPrecisionDisplayMode({this.precision = 1});

  @override
  String format(num quantity, {required Unit unit}) =>
      quantity.toStringAsFixed(precision);
}

/// The quantity is displayed with a set precision.
///
/// For example, with a [precision] of 3, a quantity 10.93214 will be displayed
/// as '10.932', a quantity 10.9 will be displayed as '10.9', and a quantity of
/// 10 will be displayed as just '10'.
class PrecisionDisplayMode extends QuantityDisplayMode {
  /// The precision to display the quantity with.
  ///
  /// The value must be between 1 (inclusive) and 20 (inclusive).
  final int precision;

  /// Returns an instance of [PrecisionDisplayMode].
  const PrecisionDisplayMode({this.precision = 1});

  @override
  String format(num quantity, {required Unit unit}) =>
      quantity.toStringAsPrecision(precision);
}

/// A function used to format a [quantity] based on its [unit].
typedef QuantityFormatter = String Function(num quantity, {required Unit unit});

/// The quantity passes through a custom converter to get its display format.
class CustomQuantityDisplayMode extends QuantityDisplayMode {
  /// The converter used to format the quantity.
  final QuantityFormatter converter;

  /// Returns an instance of [CustomQuantityDisplayMode].
  const CustomQuantityDisplayMode({required this.converter});

  @override
  String format(num quantity, {required Unit unit}) =>
      converter(quantity, unit: unit);
}
