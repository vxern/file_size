import 'package:file_size/file_size.dart';
import 'package:test/test.dart';

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
      expect(fileSizeToString(double.infinity), equals('∞ B'));
    });

    test('handles positive infinity.', () {
      expect(fileSizeToString(double.negativeInfinity), equals('-∞ B'));
    });

    test('handles NaN.', () {
      expect(fileSizeToString(double.nan), equals('NaN B'));
    });
  });

  group('input unit', () {
    test('takes [inputUnit] to be [Unit.byte] by default.', () {
      expect(fileSizeToString(100), equals('100 B'));
    });

    test('takes [inputUnit] into account.', () {
      expect(fileSizeToString(100, inputUnit: Unit.bit), equals('12.5 B'));
    });

    test('maintains the [inputUnit] when dealing with non-finite values.', () {
      expect(
        fileSizeToString(double.infinity, inputUnit: Unit.kibibit),
        equals('∞ Kib'),
      );
      expect(
        fileSizeToString(double.negativeInfinity, inputUnit: Unit.kibibit),
        equals('-∞ Kib'),
      );
      expect(
        fileSizeToString(double.nan, inputUnit: Unit.kibibit),
        equals('NaN Kib'),
      );
    });

    test('rounds fractional quantities when [inputUnit] is indivisible.', () {
      expect(fileSizeToString(1.2, inputUnit: Unit.bit), equals('1 b'));
    });
  });

  group('unit conversion', () {
    test('takes [unitConversion] to be [BestFitConversion] by default.', () {
      expect(fileSizeToString(1000 * 1000 * 1000), equals('1 GB'));
    });

    test('takes [unitConversion] into account.', () {
      expect(
        fileSizeToString(
          100,
          unitConversion: SpecificUnitConversion(unit: Unit.bit),
        ),
        equals('800 b'),
      );
    });
  });

  group('unit style', () {
    test('takes [unitStyle] to be [ShortUppercaseStyle] by default.', () {
      expect(fileSizeToString(1000), equals('1 KB'));
    });

    test('takes [unitStyle] into account.', () {
      expect(
        fileSizeToString(1000, unitStyle: const ShortLowercaseStyle()),
        equals('1 kB'),
      );
    });
  });

  group('quantity display mode', () {
    test(
      'takes [quantityDisplayMode] to be [SimpleDisplayMode] by default.',
      () {
        expect(fileSizeToString(1.23), equals('1.23 B'));
      },
    );

    test('takes [quantityDisplayMode] into account.', () {
      expect(
        fileSizeToString(
          1000,
          quantityDisplayMode: CustomQuantityDisplayMode(
            converter: (quantity, {required unit}) => '<insert quantity here>',
          ),
        ),
        equals('<insert quantity here> KB'),
      );
    });
  });
}
