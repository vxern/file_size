import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/long_uppercase_unit_style.dart';
import 'package:human_file_size/src/unit_symbols.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test("returns the unit's long, uppercase representation.", () {
      expect(const LongUppercaseUnitStyle().format(Unit.gigabit), 'Gbit');
    });

    test(
      "returns the unit's short, lowercase symbol if the long, uppercase "
      'representation is not defined.',
      () {
        expect(
          const LongUppercaseUnitStyle().format(
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
