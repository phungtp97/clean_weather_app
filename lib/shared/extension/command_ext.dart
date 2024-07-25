import '../../core/core.dart';

extension CommandExt on Command {
  void when<T extends Command>(Function(T) onData) {
    if(this is T) {
      onData(this as T);
    }
  }
}