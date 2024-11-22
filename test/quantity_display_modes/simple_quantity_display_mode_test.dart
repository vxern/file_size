import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/quantity_display_modes/simple_quantity_display_mode.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test(
      'if [round] is true, rounds the quantity to the nearest whole number.',
      () {
        expect(
          const SimpleQuantityDisplayMode(round: true).format(
            Decimal.parse('1.5'),
            unit: Unit.byte,
          ),
          '2',
        );
      },
    );

    test(
      'if [truncate] is true, truncates the quantity.',
      () {
        expect(
          const SimpleQuantityDisplayMode(truncate: true).format(
            Decimal.parse('1.5'),
            unit: Unit.byte,
          ),
          '1',
        );
      },
    );

    test(
      'removes trailing zeroes from whole numbers.',
      () {
        expect(
          const SimpleQuantityDisplayMode().format(
            Decimal.parse('1.0'),
            unit: Unit.byte,
          ),
          '1',
        );
      },
    );

    test(
      'displays doubles using standard string representation.',
      () {
        expect(
          const SimpleQuantityDisplayMode().format(
            Decimal.parse('1.52'),
            unit: Unit.byte,
          ),
          '1.52',
        );
      },
    );
  });
}
