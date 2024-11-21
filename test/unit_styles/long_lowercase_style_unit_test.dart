import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/long_lowercase_unit_style.dart';
import 'package:human_file_size/src/unit_symbols.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test("returns the unit's long, lowercase representation.", () {
      expect(const LongLowercaseUnitStyle().format(Unit.gigabit), 'gbit');
    });

    test(
      "returns the unit's short, lowercase symbol if the long, lowercase "
      'representation is not defined.',
      () {
        expect(
          const LongLowercaseUnitStyle().format(
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
