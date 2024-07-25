import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../application.dart';

@injectable
class AddLocationBloc extends BaseBloc<AddLocationState> {
  final SaveLocationUseCase _saveLocationUseCase;

  AddLocationBloc(this._saveLocationUseCase) : super(const AddLocationState());

  void search(String query) {
    command = ShowLoadingCommand();
    locationFromAddress(query).then((locations) {
      command = DismissLoadingCommand();
      emit(state.copyWith(searchedLocation: locations));
    });
  }

  Future<bool> save(MyLocationEntity location) {
    command = ShowLoadingCommand();
    Completer<bool> completer = Completer();
    _saveLocationUseCase.execute(location).then((result) {
      command = DismissLoadingCommand();
      result.fold((failure) {
        command = ErrorDialogCommand(failure.toString());
      }, (success) {
        eventBus.fire(ReloadMyLocationListCommand());
        completer.complete(success);
      });
    });
    return completer.future;
  }

  Stream<List<Location>?> get locationStream =>
      stream.map((state) => state.searchedLocation);
}
