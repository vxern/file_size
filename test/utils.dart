List<(T, T, T)> getTriplets<T>(List<T> elements) {
  if (elements.length < 3) {
    throw Exception('The given list must contain at least 3 elements.');
  }

  final pairs = <(T, T, T)>[];
  for (var index = 1; index < elements.length - 1; index += 1) {
    pairs.add((elements[index - 1], elements[index], elements[index + 1]));
  }

  return pairs;
}
