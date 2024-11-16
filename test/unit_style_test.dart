import 'package:file_size/file_size.dart';
import 'package:test/test.dart';

void main() {
  final testUnit = Unit(
    BigInt.zero,
    symbols: const UnitSymbols(shortLowercase: 'fallback'),
  );

  group('ShortLowercaseStyle', () {
    group('format()', () {
      test("returns the unit's short, lowercase representation.", () {
        expect(const ShortLowercaseStyle().format(Unit.gigabit), 'gb');
      });
    });
  });

  group('ShortUppercaseStyle', () {
    group('format()', () {
      test("returns the unit's short, uppercase representation.", () {
        expect(const ShortUppercaseStyle().format(Unit.gigabit), 'Gb');
      });

      test(
        "returns the unit's short, lowercase symbol if the short, uppercase "
        'representation is not defined.',
        () {
          expect(
            const ShortUppercaseStyle().format(
              Unit(
                BigInt.zero,
                symbols: const UnitSymbols(shortLowercase: 'fallback'),
              ),
            ),
            'fallback',
          );
        },
      );
    });
  });

  group('LongLowercaseStyle', () {
    group('format()', () {
      test("returns the unit's long, lowercase representation.", () {
        expect(const LongLowercaseStyle().format(Unit.gigabit), 'gbit');
      });

      test(
        "returns the unit's short, lowercase symbol if the long, lowercase "
        'representation is not defined.',
        () {
          expect(const LongLowercaseStyle().format(testUnit), 'fallback');
        },
      );
    });
  });

  group('LongUppercaseStyle', () {
    group('format()', () {
      test("returns the unit's long, uppercase representation.", () {
        expect(const LongUppercaseStyle().format(Unit.gigabit), 'Gbit');
      });

      test(
        "returns the unit's short, lowercase symbol if the long, uppercase "
        'representation is not defined.',
        () {
          expect(const LongUppercaseStyle().format(testUnit), 'fallback');
        },
      );
    });
  });
}
