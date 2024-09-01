import 'package:file_size/src/unit.dart';

/// Defines how the final quantity should be displayed, where the quantity is
/// the amount of a given unit.
sealed class QuantityDisplayMode {
  const QuantityDisplayMode();

  /// Given a [quantity] and a [unit], formats it as a human-readable string.
  String format(num quantity, {required Unit unit});
}

/// The quantity is displayed with a fixed precision.
///
/// For example, with a [precision] of 3, a quantity 10.93214 will be displayed
/// as '10.932', meanwhile 10 will be displayed as '10.000'.
final class FixedPrecisionDisplayMode extends QuantityDisplayMode {
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
final class PrecisionDisplayMode extends QuantityDisplayMode {
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

/// The quantity is truncated before being displayed, effectively disregarding
/// its fractional part.
///
/// For example, a quantity 10.932 will be displayed as '10'.
final class TruncateDisplayMode extends QuantityDisplayMode {
  /// Returns an instance of [TruncateDisplayMode].
  const TruncateDisplayMode();

  @override
  String format(num quantity, {required Unit unit}) =>
      quantity.truncate().toString();
}

/// The quantity is rounded before being displayed.
///
/// For example, a quantity 10.932 will be displayed as '11', meanwhile 10.032
/// will be displayed as '10'.
final class RoundDisplayMode extends QuantityDisplayMode {
  /// Returns an instance of [RoundDisplayMode].
  const RoundDisplayMode();

  @override
  String format(num quantity, {required Unit unit}) =>
      quantity.round().toString();
}

/// A function used to format a [quantity] based on its [unit].
typedef QuantityFormatter = String Function(num quantity, {required Unit unit});

/// The quantity passes through a custom converter to get its display format.
final class CustomQuantityDisplayMode extends QuantityDisplayMode {
  /// The converter used to format the quantity.
  final QuantityFormatter converter;

  /// Returns an instance of [CustomQuantityDisplayMode].
  const CustomQuantityDisplayMode({required this.converter});

  @override
  String format(num quantity, {required Unit unit}) =>
      converter(quantity, unit: unit);
}
