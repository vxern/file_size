import 'package:collection/collection.dart';
import 'package:human_file_size/src/numeral_systems/numeral_system.dart';
import 'package:test/test.dart';

import '../utils.dart';

void testNumeralSystem(
  NumeralSystem numeralSystem, {
  required int expectedUnitFactor,
}) {
  group('units', () {
    test('there should be an even number of units.', () {
      expect(numeralSystem.units.length.isEven, isTrue);
    });

    test('the factor between every unit in pairs should be 8.', () {
      final factors = numeralSystem.units
          .slices(2)
          .map((pair) => getFactor(pair.first, pair.last));

      expect(factors, everyElement(equals(8)));
    });

    test(
      'the factor between every 2nd unit should be $expectedUnitFactor.',
      () {
        final factors = [
          numeralSystem.units.whereIndexed((index, _) => index.isEven),
          numeralSystem.units.whereIndexed((index, _) => index.isOdd),
        ]
            .map((units) => units.toList().windows(2))
            .flattened
            .map((pair) => getFactor(pair.first, pair.last));

        expect(factors, everyElement(equals(expectedUnitFactor)));
      },
    );
  });
}
