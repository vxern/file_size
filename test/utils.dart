List<List<T>> getWindows<T>(List<T> elements, {required int size}) {
  assert(size >= 1, 'The size must be at least 1.');
  assert(
    size < elements.length,
    'The size must not be larger than the number of elements.',
  );

  final previousElementsCount = ((size - 1) / 2).round();
  final nextElementsCount = (size - 1) - previousElementsCount;

  final windows = <List<T>>[];
  for (var index = previousElementsCount;
      index < elements.length - nextElementsCount;
      index += 1) {
    final previousElements = elements.sublist(
      index - previousElementsCount,
      index,
    );
    final nextElements = elements.sublist(
      index + 1,
      index + 1 + nextElementsCount,
    );

    windows.add([...previousElements, elements[index], ...nextElements]);
  }

  return windows;
}
