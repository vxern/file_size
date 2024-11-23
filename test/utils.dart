List<List<T>> getWindows<T>(List<T> elements, {required int size}) {
  assert(
    size < elements.length,
    'The size must not be larger than the number of elements.',
  );

  final windows = <List<T>>[];
  for (var index = 0; index < elements.length - (size - 1); index += 1) {
    windows.add(elements.sublist(index, index + size));
  }

  return windows;
}
