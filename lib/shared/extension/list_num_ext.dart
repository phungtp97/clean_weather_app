extension ListNumExtension<T extends num> on List<T> {
  T max() {
    if (isEmpty) {
      throw StateError('No element');
    }
    return reduce((value, element) => value > element ? value : element);
  }

  T min() {
    if (isEmpty) {
      throw StateError('No element');
    }
    return reduce((value, element) => value < element ? value : element);
  }
}