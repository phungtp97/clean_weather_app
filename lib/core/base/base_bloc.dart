import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import '../../feature/application/application.dart';
import '../core.dart';
class BaseBloc<S extends Equatable> extends Cubit<S> {
  BaseBloc(super.initialState);
  late final BehaviorSubject<Command> _commandController = BehaviorSubject<Command>.seeded(NoCommand());
  Future<bool> get hasConnection => GetIt.I.get<NetworkInfo>().isConnected;

  Stream<Command> get commandStream => _commandController.stream;

  set command(Command s) => _commandController.add(s);

  EventBus get eventBus => GetIt.I<EventBus>();
  @mustCallSuper
  void dispose() {
    _commandController.close();
  }
}
