import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/unit.dart';

/// Defines how the final quantity should be displayed, where the quantity is
/// the amount of a given unit.
abstract class QuantityDisplayMode {
  /// Returns an instance of [QuantityDisplayMode].
  const QuantityDisplayMode();

  /// Given a [quantity] and a [unit], formats [quantity] as a human-readable
  /// string.
  String format(Decimal quantity, {required Unit unit});
}
