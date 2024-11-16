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

  group('unit style (ShortLowercaseStyle)', () {
    test('displays the unit in short lowercase style.', () {
      expect(
        fileSizeToString(
          1,
          inputUnit: Unit.gigabit,
          unitStyle: const ShortLowercaseStyle(),
        ),
        equals('1 gb'),
      );
    });
  });

  group('unit style (ShortUppercaseStyle)', () {
    test('displays the unit in short uppercase style.', () {
      expect(
        fileSizeToString(1, inputUnit: Unit.gigabit),
        equals('1 Gb'),
      );
    });
  });

  group('unit style (LongLowercaseStyle)', () {
    test('displays the unit in long lowercase style.', () {
      expect(
        fileSizeToString(
          1,
          inputUnit: Unit.gigabit,
          unitStyle: const LongLowercaseStyle(),
        ),
        equals('1 gbit'),
      );
    });
  });

  group('unit style (LongUppercaseStyle)', () {
    test('displays the unit in long uppercase style.', () {
      expect(
        fileSizeToString(
          1,
          inputUnit: Unit.gigabit,
          unitStyle: const LongUppercaseStyle(),
        ),
        equals('1 Gbit'),
      );
    });
  });

  group('quantity display mode (SimpleDisplayMode)', () {
    test(
      'if [round] is true, rounds the quantity to the nearest whole number.',
      () {
        expect(
          fileSizeToString(
            1.5,
            quantityDisplayMode: const SimpleDisplayMode(round: true),
          ),
          equals('2 B'),
        );
      },
    );

    test(
      'if [truncate] is true, truncates the quantity.',
      () {
        expect(
          fileSizeToString(
            1.5,
            quantityDisplayMode: const SimpleDisplayMode(truncate: true),
          ),
          equals('1 B'),
        );
      },
    );

    test(
      'removes trailing zeroes from whole numbers.',
      () {
        expect(fileSizeToString(1.0), equals('1 B'));
      },
    );

    test(
      'displays doubles using standard string representation.',
      () {
        expect(fileSizeToString(1.52), equals('1.52 B'));
      },
    );
  });

  group('quantity display mode (CustomQuantityDisplayMode)', () {
    test('displays the quantity in a custom format.', () {
      expect(
        fileSizeToString(
          1,
          quantityDisplayMode: CustomQuantityDisplayMode(
            converter: (_, {required unit}) => '<insert quantity here>',
          ),
        ),
        equals('<insert quantity here> B'),
      );
    });
  });
}
