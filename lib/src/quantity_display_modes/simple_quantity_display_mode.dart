import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';

/// {@template IntlQuantityDisplayMode}
/// The quantity is displayed using basic calls to [Decimal.toString] and
/// [Decimal.toStringAsFixed].
/// {@endtemplate}
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
