import 'package:decimal/decimal.dart';
import 'package:file_size/file_size.dart';
import 'package:test/test.dart';

void main() {
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
      expect(Unit.bit.toString(), "Unit 'b'");
    });
  });
}
