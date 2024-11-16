import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('getWindows()', () {
    test('produces overlapping lists of the given size.', () {
      expect(
        getWindows([1, 2, 3, 4], size: 2),
        equals(
          [
            [1, 2],
            [2, 3],
            [3, 4],
          ],
        ),
      );
      expect(
        getWindows([1, 2, 3, 4], size: 3),
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
        getWindows([1, 2, 3], size: 1),
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
