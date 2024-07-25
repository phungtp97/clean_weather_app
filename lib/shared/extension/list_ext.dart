import 'dart:math';

extension ListExtension<T> on List<T> {
  void shuffleList() {
    final random = Random();
    for (int i = length - 1; i > 0; i--) {
      int n = random.nextInt(i + 1);
      T temp = this[i];
      this[i] = this[n];
      this[n] = temp;
    }
  }

  List<T> filterExcludeNulls() {
    return where((element) => element != null).cast<T>().toList();
  }

  List<T> takes(int count) {
    return count > length ? this : sublist(0, count);
  }
}