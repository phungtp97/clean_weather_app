import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:use_state_utils/use_state_utils.dart';
import '../../generated/l10n.dart';
import '../command/command.dart';
import 'base.dart';

abstract class BaseState<S extends StatefulWidget, B extends BaseBloc> extends BaseStateNoBloc<S> with UseStateMixin {
  B? _bloc;
  B get bloc => _bloc ??= GetIt.I<B>();

  @override
  @mustCallSuper
  initState() {
    super.initState();
    useStreamSubscription(key: 'command', stream: bloc.commandStream, onData: (event) {
      onCommand(event);
    });
  }
  @mustCallSuper
  void onCommand(Command c) {
    switch(c.runtimeType) {
      case const (ShowLoadingCommand):
        showLoadingDialog();
        break;
      case const (DismissLoadingCommand):
        closeLoadingDialog();
        break;
    }
  }

}

abstract class BaseStateNoBloc<E extends StatefulWidget> extends State<E> {
  S get localization => S.of(context);

  void pop<T extends Object?>([T? result]) => Navigator.of(context).pop(result);

  showLoadingDialog() {}

  closeLoadingDialog() {}
}
