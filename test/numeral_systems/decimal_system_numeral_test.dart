import 'package:collection/collection.dart';
import 'package:human_file_size/src/numeral_systems/decimal_numeral_system.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('units', () {
    final units = const DecimalNumeralSystem().units;

    test('there should be an even number of units.', () {
      expect(units.length.isEven, isTrue);
    });

    test('the factor between every unit in pairs should be 8.', () {
      final factors =
          units.slices(2).map((pair) => getFactor(pair.first, pair.last));

      expect(factors, everyElement(equals(8)));
    });

    test(
      'the factor between every 2nd unit should be 1000.',
      () {
        final factors = [
          units.whereIndexed((index, _) => index.isEven),
          units.whereIndexed((index, _) => index.isOdd),
        ]
            .map((units) => units.toList().windows(2))
            .flattened
            .map((pair) => getFactor(pair.first, pair.last));

        expect(factors, everyElement(equals(1000)));
      },
    );
  });
}
