import 'package:human_file_size/src/output_formatters/simple_output_formatter.dart';
import 'package:test/test.dart';

void main() {
  group('format()', () {
    test(
      "formats the parameters as '{quantity} {unit}'.",
      () {
        expect(
          const SimpleOutputFormatter().format(quantity: '123', unit: 'units'),
          equals('123 units'),
        );
      },
    );

    group('[includeSpace]', () {
      test(
        'when enabled, inserts a space between the quantity and unit.',
        () {
          expect(
            // ignore: avoid_redundant_argument_values
            const SimpleOutputFormatter(includeSpace: true).format(
              quantity: '1',
              unit: 'b',
            ),
            equals('1 b'),
          );
        },
      );

      test(
        'when disabled, does not insert a space between the quantity and unit.',
        () {
          expect(
            const SimpleOutputFormatter(includeSpace: false).format(
              quantity: '1',
              unit: 'b',
            ),
            equals('1b'),
          );
        },
      );
    });

    group('[unitFirst]', () {
      test(
        'when enabled, places the unit first.',
        () {
          expect(
            const SimpleOutputFormatter(unitFirst: true).format(
              quantity: '1',
              unit: 'b',
            ),
            equals('b 1'),
          );
        },
      );

      test(
        'when disabled, does not insert a space between the quantity and unit.',
        () {
          expect(
            // ignore: avoid_redundant_argument_values
            const SimpleOutputFormatter(unitFirst: false).format(
              quantity: '1',
              unit: 'b',
            ),
            equals('1 b'),
          );
        },
      );
    });
  });
}
