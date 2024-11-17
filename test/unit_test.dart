import 'package:decimal/decimal.dart';
import 'package:human_file_size/human_file_size.dart';
import 'package:test/test.dart';

void main() {
  group('bytes', () {
    test('returns the number of bytes in the unit.', () {
      expect(Unit.kilobit.bytes, equals(BigInt.from(125)));
    });

    test('returns 0 for [Unit.bit].', () {
      expect(Unit.bit.bytes, equals(BigInt.zero));
    });
  });

  group('quantityToBits()', () {
    test('calculates the equivalent number of bits.', () {
      expect(Unit.megabyte.quantityToBits(1), Decimal.fromInt(1000 * 1000 * 8));
    });
  });

  group('bitsToQuantity()', () {
    test('calculates the equivalent number of bits quantity of this unit.', () {
      expect(
        Unit.kilobyte.bitsToQuantity(Decimal.fromInt(1000 * 1000 * 8)),
        Decimal.fromInt(1000),
      );
    });
  });

  group('toString()', () {
    test('returns a human-readable representation of the unit.', () {
      expect(Unit.bit.toString(), equals("Unit 'b'"));
    });
  });
}
