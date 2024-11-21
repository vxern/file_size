import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/short_uppercase_unit_style.dart';
import 'package:human_file_size/src/unit_symbols.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test("returns the unit's short, uppercase representation.", () {
      expect(const ShortUppercaseUnitStyle().format(Unit.gigabit), 'Gb');
    });

    test(
      "returns the unit's short, lowercase symbol if the short, uppercase "
      'representation is not defined.',
      () {
        expect(
          const ShortUppercaseUnitStyle().format(
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
}
