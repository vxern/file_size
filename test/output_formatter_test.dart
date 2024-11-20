import 'package:human_file_size/human_file_size.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleOutputFormatter', () {
    group('format()', () {
      test(
        "formats the parameters as '{quantity} {unit}'.",
        () {
          expect(
            const SimpleOutputFormatter()
                .format(quantity: '123', unit: 'units'),
            equals('123 units'),
          );
        },
      );

      test(
        'if [includeSpace] is enabled, inserts a space between the quantity '
        'and unit.',
        () {
          expect(
            const SimpleOutputFormatter().format(quantity: '1', unit: 'b'),
            equals('1 b'),
          );
        },
      );

      test(
        'if [unitFirst] is enabled, inserts a space between the quantity '
        'and unit.',
        () {
          expect(
            const SimpleOutputFormatter(unitFirst: true)
                .format(quantity: '1', unit: 'b'),
            equals('b 1'),
          );
        },
      );
    });
  });
}
