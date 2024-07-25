import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';

class AddLocationState extends Equatable {

  final List<Location>? searchedLocation ;

  const AddLocationState({this.searchedLocation});

  AddLocationState copyWith({List<Location>? searchedLocation}) {
    return AddLocationState(
      searchedLocation: searchedLocation ?? this.searchedLocation,
    );
  }

  @override
  List<Object?> get props => [searchedLocation];
}
