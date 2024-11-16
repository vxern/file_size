import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group('getTriplets()', () {
    test(
      'throws an exception if the list contains fewer than 3 elements.',
      () {
        for (final size in Iterable<int>.generate(2)) {
          expect(
            () => getTriplets(List<void>.generate(size, (index) {})),
            throwsException,
          );
        }
      },
    );

    test(
      'returns a list containing a single pair of elements when given a list '
      'with 3 elements.',
      () {
        expect(getTriplets([1, 2, 3]), equals([(1, 2, 3)]));
      },
    );

    test(
      'returns a list containing multiple, overlapping pairs of elements when '
      'given a list with more than 3 elements.',
      () {
        expect(getTriplets([1, 2, 3, 4]), equals([(1, 2, 3), (2, 3, 4)]));
      },
    );
  });
}
