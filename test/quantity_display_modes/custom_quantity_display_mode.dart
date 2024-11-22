import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/custom_quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test('formats the quantity in a custom format.', () {
      expect(
        // ignore: deprecated_member_use_from_same_package
        CustomQuantityDisplayMode(
          converter: (_, {required unit}) => '<insert quantity here>',
        ).format(Decimal.one, unit: Unit.byte),
        '<insert quantity here>',
      );
    });
  });
}
