import 'package:human_file_size/human_file_size.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleOutputFormatter', () {
    group('format()', () {
      test(
        "formats the parameters as '{quantity} {unit}'",
        () {
          expect(
            const SimpleOutputFormatter()
                .format(quantity: '123', unit: 'units'),
            equals('123 units'),
          );
        },
      );
    });
  });
}
