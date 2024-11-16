import 'package:decimal/decimal.dart';
import 'package:file_size/file_size.dart';
import 'package:file_size/src/quantity_display_mode.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('quantity', () {
    test('accepts numbers.', () {
      expect(fileSizeToString(10 as num), equals('10 B'));
    });

    test('accepts integers.', () {
      expect(fileSizeToString(10), equals('10 B'));
    });

    test('accepts doubles.', () {
      expect(fileSizeToString(3.14159), equals('3.14159 B'));
    });

    test('accepts 1.', () {
      expect(fileSizeToString(1), equals('1 B'));
    });

    test('accepts 0.', () {
      expect(fileSizeToString(0), equals('0 b'));
    });

    test('accepts negative values.', () {
      expect(fileSizeToString(-100), equals('-100 B'));
    });

    test('handles positive infinity.', () {
      expect(fileSizeToString(double.infinity), equals('∞ b'));
    });

    test('handles positive infinity.', () {
      expect(fileSizeToString(double.negativeInfinity), equals('-∞ b'));
    });

    test('handles NaN.', () {
      expect(fileSizeToString(double.nan), equals('NaN b'));
    });
  });

  group('input unit', () {
    test('takes [inputUnit] to be [Unit.byte] by default.', () {
      expect(fileSizeToString(100), equals('100 B'));
    });

    test('takes [inputUnit] into account.', () {
      expect(fileSizeToString(100, inputUnit: Unit.bit), equals('12.5 B'));
    });
  });

  group('unit conversion (BestFitConversion)', () {
    test(
      'displays the size in the unit that most accurately describes its '
      'magnitude.',
      () {
        for (final (previous, current, next)
            in getTriplets(defaultUnitConversion.numeralSystem.units)) {
          // Check that if we don't meet the size of the unit, the function
          // falls back to the previous unit.
          final previousFactor = current.bits / previous.bits;
          final previousQuantity = 1 - (1 / previousFactor);
          final unitQuantity =
              Decimal.parse((previousQuantity * previousFactor).toString());
          expect(
            fileSizeToString(previousQuantity, inputUnit: current),
            equals(
              [
                defaultQuantityDisplayMode.format(unitQuantity, unit: current),
                defaultUnitStyle.format(previous),
              ].join(' '),
            ),
          );

          expect(
            fileSizeToString(1, inputUnit: current),
            equals('1 ${defaultUnitStyle.format(current)}'),
          );

          // Check that if we exceed the size of the unit, the function moves
          // onto the next unit.
          final nextFactor = next.bits / current.bits;
          final nextQuantity = nextFactor;
          expect(
            fileSizeToString(nextQuantity, inputUnit: current),
            equals('1 ${defaultUnitStyle.format(next)}'),
          );
        }
      },
    );

    test('takes [numeralSystem] into account.', () {
      expect(fileSizeToString(1024), equals('1.024 KB'));
      expect(
        fileSizeToString(
          1024,
          unitConversion: const BestFitConversion(
            numeralSystem: BinarySystem(),
          ),
        ),
        equals('1 KiB'),
      );
    });

    test('displays the size in bits if equal to zero.', () {
      expect(fileSizeToString(0), equals('0 b'));
    });
  });

  group('unit conversion (SpecificUnitConversion)', () {
    test('displays the size in the specific unit given.', () {
      final unitConversion = SpecificUnitConversion(unit: Unit.kilobyte);

      const bytes = 1000 * 1000 * 8;
      expect(fileSizeToString(bytes), equals('8 MB'));
      expect(
        fileSizeToString(bytes, unitConversion: unitConversion),
        equals('8000 KB'),
      );
    });
  });
}
