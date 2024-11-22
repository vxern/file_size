import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/intl_quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test("formats the quantity using [NumberFormat]'s formatter.", () {
      expect(
        IntlQuantityDisplayMode(
          numberFormat: NumberFormat.decimalPattern('pl'),
        ).format(Decimal.parse('1.234'), unit: Unit.byte),
        '1,234',
      );
    });
  });
}
