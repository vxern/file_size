import 'package:collection/collection.dart';
import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/numeral_systems/binary_numeral_system.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('units', () {
    final units = const BinaryNumeralSystem().units;

    test('there should be an even number of units.', () {
      expect(units.length.isEven, isTrue);
    });

    test('the factor between every unit in pairs should be 8.', () {
      final factors = units.slices(2).map(
            (pair) => (pair.last.bits.toDecimal() / pair.first.bits.toDecimal())
                .toDecimal(),
          );

      expect(factors, everyElement(equals(Decimal.fromInt(8))));
    });

    test(
      'the factor between every 2nd unit should be 1024.',
      () {
        final factors = [
          units.whereIndexed((index, _) => index.isEven),
          units.whereIndexed((index, _) => index.isOdd),
        ].map((units) => units.toList().windows(2)).flattened.map(
              (pair) =>
                  (pair.last.bits.toDecimal() / pair.first.bits.toDecimal())
                      .toDecimal(),
            );

        expect(factors, everyElement(equals(Decimal.fromInt(1024))));
      },
    );
  });
}
