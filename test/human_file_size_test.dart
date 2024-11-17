import 'package:human_file_size/human_file_size.dart';
import 'package:test/test.dart';

void main() {
  group('quantity', () {
    test('accepts numbers.', () {
      expect(humanFileSize(10 as num), equals('10 B'));
    });

    test('accepts integers.', () {
      expect(humanFileSize(10), equals('10 B'));
    });

    test('accepts doubles.', () {
      expect(humanFileSize(3.14159), equals('3.14159 B'));
    });

    test('accepts 1.', () {
      expect(humanFileSize(1), equals('1 B'));
    });

    test('accepts 0.', () {
      expect(humanFileSize(0), equals('0 b'));
    });

    test('accepts negative values.', () {
      expect(humanFileSize(-100), equals('-100 B'));
    });

    test('handles positive infinity.', () {
      expect(humanFileSize(double.infinity), equals('∞ B'));
    });

    test('handles positive infinity.', () {
      expect(humanFileSize(double.negativeInfinity), equals('-∞ B'));
    });

    test('handles NaN.', () {
      expect(humanFileSize(double.nan), equals('NaN B'));
    });
  });

  group('input unit', () {
    test('takes [inputUnit] to be [Unit.byte] by default.', () {
      expect(humanFileSize(100), equals('100 B'));
    });

    test('takes [inputUnit] into account.', () {
      expect(humanFileSize(100, inputUnit: Unit.bit), equals('12.5 B'));
    });

    test('maintains the [inputUnit] when dealing with non-finite values.', () {
      expect(
        humanFileSize(double.infinity, inputUnit: Unit.kibibit),
        equals('∞ Kib'),
      );
      expect(
        humanFileSize(double.negativeInfinity, inputUnit: Unit.kibibit),
        equals('-∞ Kib'),
      );
      expect(
        humanFileSize(double.nan, inputUnit: Unit.kibibit),
        equals('NaN Kib'),
      );
    });

    test('rounds fractional quantities when [inputUnit] is indivisible.', () {
      expect(humanFileSize(1.2, inputUnit: Unit.bit), equals('1 b'));
    });
  });

  group('unit conversion', () {
    test('takes [unitConversion] to be [BestFitConversion] by default.', () {
      expect(humanFileSize(1000 * 1000 * 1000), equals('1 GB'));
    });

    test('takes [unitConversion] into account.', () {
      expect(
        humanFileSize(
          100,
          unitConversion: SpecificUnitConversion(unit: Unit.bit),
        ),
        equals('800 b'),
      );
    });
  });

  group('unit style', () {
    test('takes [unitStyle] to be [ShortUppercaseStyle] by default.', () {
      expect(humanFileSize(1000), equals('1 KB'));
    });

    test('takes [unitStyle] into account.', () {
      expect(
        humanFileSize(1000, unitStyle: const ShortLowercaseStyle()),
        equals('1 kB'),
      );
    });
  });

  group('quantity display mode', () {
    test(
      'takes [quantityDisplayMode] to be [SimpleDisplayMode] by default.',
      () {
        expect(humanFileSize(1.23), equals('1.23 B'));
      },
    );

    test('takes [quantityDisplayMode] into account.', () {
      expect(
        humanFileSize(
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
