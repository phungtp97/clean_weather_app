import '../command/command.dart';

typedef CommandListenable<C extends Command> = void Function(C data);