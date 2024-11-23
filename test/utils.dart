import 'package:human_file_size/src/unit.dart';

extension IterableExtension<T> on Iterable<T> {
  Iterable<List<T>> windows(int size) sync* {
    if (size <= 0) {
      throw StateError('The size must be a positive, non-zero integer.');
    }

    if (size > length) {
      throw StateError('The size must not exceed the number of elements.');
    }

    final iterator = this.iterator;
    final window = <T>[];
    while (iterator.moveNext()) {
      window.add(iterator.current);
      if (window.length != size) {
        continue;
      }

      yield [...window];

      window.removeAt(0);
    }
  }
}

int getFactor(Unit previous, Unit next) => (next.bits ~/ previous.bits).toInt();
