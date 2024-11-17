import 'package:decimal/decimal.dart';
import 'package:human_file_size/human_file_size.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('BestFitConversion', () {
    group('bitsToUnit()', () {
      test(
        'displays the size in the unit that most accurately describes its '
        'magnitude.',
        () {
          for (final [previous, current, next] in getWindows(
            defaultUnitConversion.numeralSystem.units,
            size: 3,
          )) {
            // Check that if we don't meet the size of the unit, the function
            // falls back to the previous unit.
            final previousFactor = current.bits / previous.bits;
            final previousQuantity = 1 - (1 / previousFactor);
            final unitQuantity =
                Decimal.parse((previousQuantity * previousFactor).toString());
            expect(
              humanFileSize(previousQuantity, inputUnit: current),
              equals(
                [
                  defaultQuantityDisplayMode.format(
                    unitQuantity,
                    unit: current,
                  ),
                  defaultUnitStyle.format(previous),
                ].join(' '),
              ),
            );

            expect(
              humanFileSize(1, inputUnit: current),
              equals('1 ${defaultUnitStyle.format(current)}'),
            );

            // Check that if we exceed the size of the unit, the function moves
            // onto the next unit.
            final nextFactor = next.bits / current.bits;
            final nextQuantity = nextFactor;
            expect(
              humanFileSize(nextQuantity, inputUnit: current),
              equals('1 ${defaultUnitStyle.format(next)}'),
            );
          }
        },
      );

      test('takes [numeralSystem] into account.', () {
        expect(humanFileSize(1024), equals('1.024 KB'));
        expect(
          humanFileSize(
            1024,
            unitConversion: const BestFitConversion(
              numeralSystem: BinarySystem(),
            ),
          ),
          equals('1 KiB'),
        );
      });

      test('displays the size in bits if equal to zero.', () {
        expect(humanFileSize(0), equals('0 b'));
      });
    });
  });

  group('SpecificUnitConversion', () {
    group('bitsToUnit()', () {
      test('displays the size in the specific unit given.', () {
        final unitConversion = SpecificUnitConversion(unit: Unit.kilobyte);

        const bytes = 1000 * 1000 * 8;
        expect(humanFileSize(bytes), equals('8 MB'));
        expect(
          humanFileSize(bytes, unitConversion: unitConversion),
          equals('8000 KB'),
        );
      });
    });
  });
}
