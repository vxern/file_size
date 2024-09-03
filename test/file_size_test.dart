import 'package:file_size/file_size.dart';
import 'package:test/test.dart';

void main() {
  group('quantity', () {
    test('accepts numbers.', () {
      expect(fileSizeToString(10 as num), equals('10 B'));
    });

    test('accepts integers.', () {
      expect(fileSizeToString(10), equals('10 B'));
    });

    test('accepts doubles.', () {
      expect(fileSizeToString(3.14159), equals('3.14159 B'));
    });

    test('accepts 1.', () {
      expect(fileSizeToString(1), equals('1 B'));
    });

    test('accepts 0.', () {
      expect(fileSizeToString(0), equals('0 b'));
    });

    test('accepts negative values.', () {
      expect(fileSizeToString(-100), equals('-100 B'));
    });

    test('handles positive infinity.', () {
      expect(fileSizeToString(double.infinity), equals('∞ b'));
    });

    test('handles positive infinity.', () {
      expect(fileSizeToString(double.negativeInfinity), equals('-∞ b'));
    });

    test('handles NaN.', () {
      expect(fileSizeToString(double.nan), equals('NaN b'));
    });
  });
}
