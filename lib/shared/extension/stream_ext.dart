import 'dart:async';

extension StreamExtensions<T> on Stream<T> {
  StreamSubscription<T> on<S extends T>(void Function(S event) onEvent) {
    return listen((event) {
      if (event is S) {
        onEvent(event);
      }
    });
  }
}
