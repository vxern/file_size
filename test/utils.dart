import 'package:human_file_size/src/unit.dart';

extension ListWindows<T> on List<T> {
  List<List<T>> windows(int size) {
    if (size >= length) {
      throw StateError(
        'The size must not be larger than the number of elements.',
      );
    }

    final windows = <List<T>>[];
    for (var index = 0; index < length - (size - 1); index += 1) {
      windows.add(sublist(index, index + size));
    }

    return windows;
  }
}

int getFactor(Unit previous, Unit next) => (next.bits ~/ previous.bits).toInt();
