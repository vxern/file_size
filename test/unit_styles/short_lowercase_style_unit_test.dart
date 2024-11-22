import 'package:human_file_size/src/unit.dart';
import 'package:human_file_size/src/unit_styles/short_lowercase_unit_style.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test("returns the unit's short, lowercase representation.", () {
      expect(const ShortLowercaseUnitStyle().format(Unit.gigabit), 'gb');
    });
  });
}
