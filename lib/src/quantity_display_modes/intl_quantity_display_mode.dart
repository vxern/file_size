import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:human_file_size/src/defaults.dart';
import 'package:human_file_size/src/quantity_display_modes/quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:intl/intl.dart';

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
