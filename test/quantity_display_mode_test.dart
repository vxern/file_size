import 'package:decimal/decimal.dart';
import 'package:file_size/file_size.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleDisplayMode', () {
    group('format()', () {
      test(
        'if [round] is true, rounds the quantity to the nearest whole number.',
        () {
          expect(
            const SimpleDisplayMode(round: true).format(
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
            const SimpleDisplayMode(truncate: true).format(
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
            const SimpleDisplayMode().format(
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
            const SimpleDisplayMode().format(
              Decimal.parse('1.52'),
              unit: Unit.byte,
            ),
            '1.52',
          );
        },
      );
    });
  });

  group('CustomQuantityDisplayMode', () {
    group('format()', () {
      test('displays the quantity in a custom format.', () {
        expect(
          CustomQuantityDisplayMode(
            converter: (_, {required unit}) => '<insert quantity here>',
          ).format(Decimal.one, unit: Unit.byte),
          '<insert quantity here>',
        );
      });
    });
  });
}
