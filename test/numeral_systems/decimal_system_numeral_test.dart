import 'package:decimal/decimal.dart';
import 'package:human_file_size/src/numeral_systems/decimal_numeral_system.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('units', () {
    final units = const DecimalNumeralSystem().units;

    test('there should be an even number of units.', () {
      expect(units.length.isEven, isTrue);
    });

    test('the factor between units in pairs should be 8.', () {
      for (final [a, b] in Iterable<List<Unit>>.generate(
        units.length ~/ 2,
        (index) => units.sublist(index * 2, (index * 2) + 2),
      )) {
        expect(
          (b.bits.toDecimal() / a.bits.toDecimal()).toDecimal(),
          equals(Decimal.fromInt(8)),
        );
      }
    });

    test(
      'the factor for the every other unit should be 1000.',
      () {
        final bitBased = <Unit>[];
        final byteBased = <Unit>[];
        for (final index in Iterable<int>.generate(units.length)) {
          if (index.isEven) {
            bitBased.add(units[index]);
          } else {
            byteBased.add(units[index]);
          }
        }

        for (final [a, b] in getWindows(bitBased, size: 2)) {
          expect(
            (b.bits.toDecimal() / a.bits.toDecimal()).toDecimal(),
            equals(Decimal.fromInt(1000)),
          );
        }
      },
    );
  });
}
