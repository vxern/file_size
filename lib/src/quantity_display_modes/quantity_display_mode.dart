import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/custom_quantity_display_mode.dart';
import 'package:human_file_size/src/quantity_display_modes/intl_quantity_display_mode.dart';
import 'package:human_file_size/src/quantity_display_modes/simple_quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:intl/intl.dart';

/// Defines how the final quantity should be displayed, where the quantity is
/// the amount of a given unit.
abstract class QuantityDisplayMode {
  /// Returns an instance of [QuantityDisplayMode].
  const QuantityDisplayMode();

  /// Given a [quantity] and a [unit], formats [quantity] as a human-readable
  /// string.
  String format(Decimal quantity, {required Unit unit});

  /// {@macro CustomQuantityDisplayMode}
  @Deprecated(
    'Create your own concrete implementation of [QuantityDisplayMode].',
  )
  const factory QuantityDisplayMode.custom({
    required QuantityFormatter converter,
  }) = CustomQuantityDisplayMode;

  /// {@macro IntlQuantityDisplayMode}
  factory QuantityDisplayMode.intl({NumberFormat? numberFormat}) =
      IntlQuantityDisplayMode;

  /// {@macro SimpleQuantityDisplayMode}
  const factory QuantityDisplayMode.simple({
    bool round,
    bool truncate,
  }) = SimpleQuantityDisplayMode;
}
