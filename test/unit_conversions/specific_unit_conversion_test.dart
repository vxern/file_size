import 'package:human_file_size/src/human_file_size.dart';
import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_conversions/specific_unit_conversion.dart';
import 'package:test/test.dart';

void main() {
  group('bitsToUnit()', () {
    test('displays the size in the specific unit given.', () {
      final unitConversion = SpecificUnitConversion(unit: Unit.kilobyte);

      const bytes = 1000 * 1000 * 8;
      expect(humanFileSize(bytes), equals('8 MB'));
      expect(
        humanFileSize(bytes, unitConversion: unitConversion),
        equals('8000 KB'),
      );
    });
  });
}
