import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('windows()', () {
    test('produces overlapping lists of the given size.', () {
      expect(
        [1, 2, 3, 4].windows(2),
        equals(
          [
            [1, 2],
            [2, 3],
            [3, 4],
          ],
        ),
      );
      expect(
        [1, 2, 3, 4].windows(3),
        equals(
          [
            [1, 2, 3],
            [2, 3, 4],
          ],
        ),
      );
    });

    test('produces single-element lists if the size is 1.', () {
      expect(
        [1, 2, 3].windows(1),
        equals(
          [
            [1],
            [2],
            [3],
          ],
        ),
      );
    });
  });
}
