import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';

/// A function used to format a [quantity] based on its [unit].
@Deprecated('Do not use [CustomQuantityDisplayMode].')
typedef QuantityFormatter = String Function(
  Decimal quantity, {
  required Unit unit,
});

/// {@template CustomQuantityDisplayMode}
/// The quantity passes through a custom converter to get its display format.
/// {@endtemplate}
@Deprecated(
  'Create your own concrete implementation of [QuantityDisplayMode].',
)
class CustomQuantityDisplayMode extends QuantityDisplayMode {
  /// The converter used to format the quantity.
  final QuantityFormatter converter;

  /// Returns an instance of [CustomQuantityDisplayMode].
  @Deprecated(
    'Create your own concrete implementation of [QuantityDisplayMode].',
  )
  const CustomQuantityDisplayMode({
    required this.converter,
  });

  @override
  String format(Decimal quantity, {required Unit unit}) =>
      converter(quantity, unit: unit);
}
