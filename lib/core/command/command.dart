import 'package:equatable/equatable.dart';

import '../../shared/shared.dart';

abstract class Command extends Equatable {}

class NoCommand extends Command {
  @override
  List<Object?> get props => [];
}

class ShowLoadingCommand extends Command {
  @override
  List<Object?> get props => [];
}

class DismissLoadingCommand extends Command {
  @override
  List<Object?> get props => [];
}

class SuccessDialogCommand extends Command {
  final String message;

  SuccessDialogCommand(this.message);

  @override
  List<Object?> get props => [message];
}

class ErrorDialogCommand extends Command {
  final String message;

  ErrorDialogCommand(this.message);

  @override
  List<Object?> get props => [message];
}

class NavigationCommand<T> extends Command {
  final String routeName;

  final T? arguments;

  NavigationCommand(this.routeName, {this.arguments});

  @override
  List<Object?> get props => [routeName, arguments];
}

class PopNavigationCommand extends Command {
  @override
  List<Object?> get props => [];
}

class ReloadMyLocationListCommand extends Command {
  @override
  List<Object?> get props => [];
}