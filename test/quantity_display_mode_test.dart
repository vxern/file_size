import 'package:decimal/decimal.dart';
import 'package:human_file_size/human_file_size.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleQuantityDisplayMode', () {
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
  });

  group('IntlQuantityDisplayMode', () {
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
  });

  group('CustomQuantityDisplayMode', () {
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
  });
}
